#!/bin/bash
PATH_ROOT=$(pwd)
mkdir -p fi_work
cd fi_work

# Create a C++ testbench wrapper
cat > tb_fault_injection_system.cpp << 'EOT'
#include "Vtop_fault_injection_system.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include <iostream>

// Simple clock cycle counter
vluint64_t main_time = 0;

// Function to handle time
double sc_time_stamp() {
    return main_time;
}

int main(int argc, char** argv) {
    // Initialize Verilator
    Verilated::commandArgs(argc, argv);
    
    // Create an instance of the top module
    Vtop_fault_injection_system* top = new Vtop_fault_injection_system;
    
    // Enable waveform tracing
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("dump.vcd");
    
    // Initialize inputs
    top->clk = 0;
    top->rst = 1;  // Start with reset asserted
    top->cpu_wren = 0;
    top->cpu_rden = 0;
    top->cpu_addr = 0;
    top->cpu_wdata = 0;
    top->posit_in1 = 0;
    top->posit_in2 = 0;
    top->posit_start = 0;
    
    std::cout << "Starting simulation" << std::endl;
    
    // Run simulation for 100 cycles
    for (int i = 0; i < 200; i++) {
        // Toggle clock every 5 time units
        top->clk = (i % 2 == 0);
            
        // Release reset after 20 time units
        if (i == 20)
            top->rst = 0;
        if (i == 40)
            top->rst = 1;
            
        // Example: Write to DATA register (addr 0) at time 60
        if (i == 60) {
            top->cpu_addr = 0;  // DATA register
            top->cpu_wdata = 0xAAAAAAAA;
            top->cpu_wren = 1;
        }
        
        // Deassert write enable
        if (i == 70)
            top->cpu_wren = 0;
            
        // Example: Write to STATUS register (addr 1) at time 80
        if (i == 80) {
            top->cpu_addr = 1;  // STATUS register
            top->cpu_wdata = 0x00000008;  // Set SETUP bit
            top->cpu_wren = 1;
        }
        
        // Deassert write enable
        if (i == 90)
            top->cpu_wren = 0;
        
        // Evaluate model
        top->eval();
        
        // Dump waveform data
        tfp->dump(main_time);
        main_time++;
        
        // Print progress every 10 cycles
        if (i % 10 == 0) {
            std::cout << "Cycle " << i << std::endl;
        }
    }
    
    // Cleanup
    tfp->close();
    delete top;
    delete tfp;
    
    std::cout << "Simulation completed successfully" << std::endl;
    return 0;
}
EOT

# Run Verilator with the corrected command line
verilator --cc \
    /home/b.demir/Desktop/newtrywrapper/stereo_vision_core-develop/FI/srcs/top_fault_injection_system.v \
    /home/b.demir/Desktop/newtrywrapper/stereo_vision_core-develop/FI/srcs/Module_0_gate_sbtr.v \
    /home/b.demir/Desktop/newtrywrapper/stereo_vision_core-develop/FI/srcs/Module_1_gate_sbtr.v \
    /home/b.demir/Desktop/newtrywrapper/stereo_vision_core-develop/FI/srcs/Module_2_gate_sbtr.v \
    /home/b.demir/Desktop/newtrywrapper/stereo_vision_core-develop/FI/srcs/controller.v \
    /home/b.demir/Desktop/newtrywrapper/stereo_vision_core-develop/FI/srcs/posit_add_fi_sbtr.v \
    /home/b.demir/Desktop/newtrywrapper/stereo_vision_core-develop/FI/srcs/reset_handler.v \
    /home/b.demir/Desktop/newtrywrapper/stereo_vision_core-develop/FI/sbtr_cells/shift_register.v \
    /home/b.demir/Desktop/newtrywrapper/stereo_vision_core-develop/FI/sbtr_cells/basic_sabotuer.v \
    /home/b.demir/Desktop/newtrywrapper/stereo_vision_core-develop/FI/sbtr_cells/super_sabouter.v \
    --top-module top_fault_injection_system \
    --exe tb_fault_injection_system.cpp \
    -Wno-fatal -Wno-WIDTHEXPAND -Wno-WIDTHTRUNC -Wno-CASEOVERLAP -Wno-CASEINCOMPLETE -Wno-UNOPTFLAT \
    --max-num-width 80000 --trace --trace-depth 1 --threads 2 -j 4

# Build the simulation
make -C obj_dir -f Vtop_fault_injection_system.mk

echo "Compilation complete. Running simulation..."
./obj_dir/Vtop_fault_injection_system
