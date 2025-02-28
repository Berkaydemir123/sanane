#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Vsystem_top.h"
#include "Vsystem_top___024root.h"

vluint64_t sim_time = 0;

int main(int argc, char** argv, char** env) {
    Verilated::traceEverOn(true);
    Vsystem_top *dut = new Vsystem_top;
    
    // VCD tracing
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    dut->trace(m_trace, 5);
    m_trace->open("waveform.vcd");

    // Initialize inputs
    dut->i_CLK_SYS = 0;
    dut->i_RST_SYS = 1;
    dut->i_data_l = 0;
    dut->i_data_r = 0;
    dut->i_dval = 0;
    dut->i_tresh_lrcc = 0;
    dut->i_ADDR = 0;
    dut->i_WRDATA = 0;
    dut->i_WREn = 0;
    dut->i_RDEn = 0;

    // Apply reset
    for (int i = 0; i < 10; i++) {
        dut->i_CLK_SYS ^= 1;
        dut->eval();
        m_trace->dump(sim_time++);
    }
    dut->i_RST_SYS = 0;
    
    // Configure CONTROLLER for Fault Injection
    dut->i_WREn = 1;
    dut->i_ADDR = 0x00000001;
    dut->i_WRDATA = 0x00010010;
    dut->eval();
    m_trace->dump(sim_time++);
    dut->i_WREn = 0;
    
    // Provide Stereo Input Data
    dut->i_data_l = 0xFF;
    dut->i_data_r = 0xAA;
    dut->i_dval = 1;
    dut->eval();
    m_trace->dump(sim_time++);
    dut->i_dval = 0;

    // Read Controller Status
    dut->i_RDEn = 1;
    dut->i_ADDR = 0x00000001;
    dut->eval();
    m_trace->dump(sim_time++);
    dut->i_RDEn = 0;
    
    // Finish Simulation
    for (int i = 0; i < 100; i++) {
        dut->i_CLK_SYS ^= 1;
        dut->eval();
        m_trace->dump(sim_time++);
    }

    // Cleanup
    m_trace->close();
    delete dut;
    delete m_trace;
    exit(EXIT_SUCCESS);
}