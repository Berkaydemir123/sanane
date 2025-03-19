# Posit Arithmetic Fault Injection System

This project implements a fault injection system for testing the resilience of posit arithmetic operations against various types of hardware faults. The system allows for the controlled injection of stuck-at-0, stuck-at-1, and transient (bit-flip) faults at specific points in the circuit.

## Project Structure

- `controller.v` - CPU interface for controlling fault injection
- `top_fault_injection_system.v` - Top-level module connecting controller and posit adder
- `posit_add_fi_sbtr.v` - Posit adder with fault injection capability
- `shift_register.v` - Serial shift register for fault configuration
- `super_sabouter.v` - Module for injecting specific types of faults
- `basic_sabotuer.v` - Low-level module implementing fault behavior
- Other Verilog modules for posit arithmetic operations

## Fault Injection Infrastructure

The system uses a daisy-chained fault injection mechanism with:
- 4 fault-injectable modules with shift registers:
  - `dsl1`: 64 enable bits + 2 control bits
  - `dsr2`: 204 enable bits + 2 control bits
  - `uut_de1@ls`: 204 enable bits + 2 control bits
  - `uut_de1@xinst_k`: 52 enable bits + 2 control bits
- Total: 524 enable bits + 8 control bits = 532 bits

## Controller Register Map

The controller has four 32-bit registers:

### DATA Register (addr = 2'b00)
- Stores saboteur enable patterns to be shifted into the target hardware
- Must be written multiple times for long shift registers (17 writes for 524 bits)

### STATUS Register (addr = 2'b01)
- Bit 0 (BUSY): Set by controller when operations are in progress
- Bit 1 (OP): Set when operation is in progress
- Bit 2 (START): Set by CPU to start fault injection
- Bit 3 (SETUP): Set by CPU to initiate setup phase
- Bits [19:4]: Shift register length (532 for this system)
- Bits [21:20]: Fault type control
  - 00: Stuck-at-0
  - 01: Stuck-at-1
  - 1x: Transient (bit-flip)

### COUNTER Register (addr = 2'b10)
- Used for timing transient fault injection
- Increments during operation phase

### COMPARATOR Register (addr = 2'b11)
- Used to specify when to inject transient faults
- When COUNTER equals COMPARATOR, transient fault is injected for one cycle

## Usage Instructions

### Setup Phase
1. Write the fault type and shift register length to STATUS register
   - For stuck-at-0: 0x00005B0 (532 bits, fault type 00)
   - For stuck-at-1: 0x00105B0 (532 bits, fault type 01)
   - For transient: 0x00205B0 (532 bits, fault type 10)

2. Write fault patterns to DATA register (17 writes for 524 bits)
   - Each write loads 32 bits of enable pattern
   - Check BUSY bit after each write

3. Set SETUP bit in STATUS register (OR with 0x08)
   - Controller will start sending configurations to shift registers
   - Wait for BUSY bit to clear

### Operation Phase
1. For transient faults, set COUNTER and COMPARATOR registers
   - COUNTER should be reset to 0
   - COMPARATOR specifies when to inject the fault

2. Set START bit in STATUS register (OR with 0x04)
   - Controller enables fault injection based on configured type

3. Apply inputs to the posit adder
   - Set posit_in1, posit_in2 values
   - Set posit_start to 1 for one cycle

4. Read outputs after posit_done is asserted
   - Check posit_out, posit_inf, posit_zero signals

## Simulation
Use the provided testbench (`tb_fault_injection_system.v`) to verify system operation:
- Scenario 1: Stuck-at-1 fault injection
- Scenario 2: Transient fault injection at cycle 5

## Implementation Notes
- The controller expects multiple DATA register writes for shift registers > 32 bits
- The STATUS register BUSY bit must be checked between operations
- For transient faults, the fault is injected for exactly one clock cycle
- The system uses active low reset for shift registers (i_RST = 0 resets the shift register)
