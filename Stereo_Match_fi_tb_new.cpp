#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "VStereo_Match.h"
#include "VStereo_Match___024root.h"

#define TRACE_EN

vluint64_t sim_time = 0;
vluint64_t index_data = 0;
vluint64_t fault_idx = 3;

int main(int argc, char** argv, char** env) {
    VStereo_Match *dut = new VStereo_Match;
    std::vector<int> image_left;
    std::vector<int> image_right;
    std::vector<int> image_valid;

    std::vector<int> output_data;
    std::vector<int> output_valid;
    std::vector<int> fault_descriptor;

    std::ifstream file_image_left("../input_vector_left_image.txt"); 
    std::ifstream file_image_right("../input_vector_right_image.txt"); 
    std::ifstream file_image_valid("../input_vector_valid.txt"); 
    std::ofstream outputDato("../output_vector_data.txt"); // create a new output file or overwrite an existing one
    std::ofstream outputValid("../output_vector_valid.txt");
    std::ifstream file_fault_descriptor("fault_descriptor.txt");

    std::string line;
    if(file_image_left)
    while(std::getline(file_image_left, line)){
        image_left.push_back(std::stoi(line));
    }
    while(std::getline(file_image_right, line)){
        image_right.push_back(std::stoi(line));
    }
    while(std::getline(file_image_valid, line)){
        image_valid.push_back(std::stoi(line));
    }
    while(std::getline(file_fault_descriptor, line)){
        fault_descriptor.push_back(std::stoi(line));
    }

    Verilated::traceEverOn(true);
    #ifdef TRACE_EN
        VerilatedVcdC *m_trace = new VerilatedVcdC;    
        dut->trace(m_trace, 1);
        m_trace->open("waveform.vcd");
    #endif

    // Define bit positions for the control signals
    constexpr uint8_t TFEn_BIT = 3;
    constexpr uint8_t CLK_BIT = 2;
    constexpr uint8_t RST_BIT = 1;
    constexpr uint8_t EN_BIT = 0;

    auto setControlSignal = [](uint8_t TFEn, uint8_t CLK, uint8_t RST, uint8_t EN) {
        return (TFEn << TFEn_BIT) | (CLK << CLK_BIT) | (RST << RST_BIT) | (EN << EN_BIT);
    };

    dut->i_Tresh_LRCC = 8; 
    dut->injector_i_CONTROL = setControlSignal(0, 0, 0, 0); // Reset control signals

    for(int i=0; i<51; i++) {
        dut->injector_i_CONTROL ^= (1 << CLK_BIT); // Toggle clock bit
        dut->eval();
        #ifdef TRACE_EN 
            m_trace->dump(sim_time);
        #endif
        sim_time++;       
    }    

    dut->injector_i_CONTROL = setControlSignal(0, 0, 1, 0); // Activate reset

    int modules = fault_descriptor[0];
    int component = fault_descriptor[1];
    int sr_leght = fault_descriptor[2];
    // Configuration of the saboteurs
    for (int m_shift = 0; m_shift < modules; m_shift++) {
        for (int bit_shift = 0; bit_shift < sr_leght; bit_shift++) {
            dut->injector_i_CONTROL = setControlSignal(0, 0, 0, 1); // Enable saboteur
            dut->injector_i_CONTROL ^= (1 << CLK_BIT); // Toggle clock bit
            if (m_shift == component) {
                dut->injector_i_SI = fault_descriptor[bit_shift + 3];
            } else {
                dut->injector_i_SI = 0;
            }
            dut->eval(); 
            #ifdef TRACE_EN 
                m_trace->dump(sim_time);
            #endif
            sim_time++;
            dut->injector_i_CONTROL ^= (1 << CLK_BIT); // Toggle clock back
            dut->eval(); 
            #ifdef TRACE_EN 
                m_trace->dump(sim_time);
            #endif
            sim_time++;         
        }
    }

    dut->injector_i_SI = 0;
    dut->injector_i_CONTROL = setControlSignal(1, 0, 0, 0); // Enable fault injector

    // Workload execution
    if (outputDato.is_open() && outputValid.is_open()) {
        while (index_data < image_valid.size()) {
            dut->injector_i_CONTROL ^= (1 << CLK_BIT); // Toggle clock bit
            dut->eval();
            #ifdef TRACE_EN 
                m_trace->dump(sim_time);
            #endif
            if ((dut->injector_i_CONTROL & (1 << CLK_BIT)) == 0) {       
                dut->i_dval = image_valid[index_data];
                dut->i_dato_L = image_left[index_data];
                dut->i_dato_R = image_right[index_data];     
                outputDato << int(dut->o_dato) << "\n";
                outputValid << int(dut->o_dval) << "\n"; 
                index_data++;
            } 
            sim_time++;
        }
        outputDato.close(); // Close the file when done
        outputValid.close();
        #ifdef TRACE_EN
            m_trace->close();
        #endif
        delete dut;
    } else {
        std::cerr << "Error opening file\n";
    }

    exit(EXIT_SUCCESS);
}
