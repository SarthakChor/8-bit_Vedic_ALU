# 8-bit Vedic ALU – Verilog Implementation

## Overview

This project presents the design and implementation of an **8-bit Arithmetic Logic Unit (ALU)** using **Verilog HDL**. The ALU performs four fundamental arithmetic operations: **Addition, Subtraction, Multiplication, and Division**. The multiplication operation is implemented using the **Urdhva Tiryagbhyam (Vertical and Crosswise)** algorithm from **Vedic Mathematics**, enabling a faster and more efficient multiplication architecture compared to conventional methods.

The design was developed, simulated, synthesized, and implemented using **Xilinx Vivado** and successfully deployed on a **Spartan-7 FPGA (Boolean Board)**. This project demonstrates the practical integration of Vedic mathematical principles into digital hardware design while following a modular and synthesizable RTL architecture.

---

## Features

- 8-bit ALU implemented in Verilog HDL
- Supports four arithmetic operations:
  - Addition
  - Subtraction
  - Multiplication (Vedic Multiplier)
  - Division
- Modular RTL design
- Fully synthesizable implementation
- Functional simulation using Xilinx Vivado
- FPGA implementation on Spartan-7 Boolean Board

---

## Supported Operations

| Operation | Description |
|-----------|-------------|
| Addition | Computes `A + B` |
| Subtraction | Computes `A - B` |
| Multiplication | Computes `A × B` using the Urdhva Tiryagbhyam algorithm |
| Division | Computes `A ÷ B` |

---

## Vedic Multiplication

The multiplication operation is implemented using the **Urdhva Tiryagbhyam (Vertical and Crosswise)** algorithm from Vedic Mathematics.

Unlike conventional multiplication methods that generate partial products sequentially, the Vedic algorithm generates them in parallel, making it well suited for FPGA implementations.

### Advantages

- Faster multiplication
- Parallel partial product generation
- Reduced computational delay
- Modular hardware implementation
- Efficient FPGA realization

---

## Design Methodology

The ALU is designed using a modular RTL approach.

```
                 +----------------------+
                 |      8-bit ALU       |
                 +----------------------+
                          |
        -----------------------------------------
        |        |           |                  |
    Addition  Subtraction  Multiplication   Division
                             |
                     Vedic Multiplier
```

Each arithmetic operation is implemented as an independent module, improving readability, scalability, and maintainability.

---

## Tools Used

- **Hardware Description Language:** Verilog HDL
- **Design Suite:** Xilinx Vivado
- **Target FPGA:** Xilinx Spartan-7
- **Development Board:** Boolean Board

---

## FPGA Implementation

The complete design was synthesized and implemented on the **Spartan-7 FPGA**. The implementation flow included:

- RTL Design
- Behavioral Simulation
- Synthesis
- Implementation (Place & Route)
- Timing Analysis
- Bitstream Generation
- Hardware Verification

---

## Project Structure

```
8-bit-Vedic-ALU/
│
├── src/
│   ├── ALU.v
│   ├── Adder.v
│   ├── Subtractor.v
│   ├── VedicMultiplier.v
│   ├── Divider.v
│   └── Top.v
│
├── testbench/
│   └── ALU_tb.v
│
├── constraints/
│   └── BooleanBoard.xdc
│
├── images/
│
└── README.md
```

> Folder names may differ depending on your project organization.

---

## Simulation

Behavioral simulation was carried out using **Vivado Simulator** to verify the functionality of all supported operations.

The simulation validates:

- Correct addition
- Correct subtraction
- Correct multiplication using the Vedic multiplier
- Correct division functionality

---

## Applications

This project can be used in:

- FPGA-based Digital Systems
- Embedded Computing
- Digital Arithmetic Units
- Educational Projects
- Computer Architecture Laboratories
- VLSI Design Learning
- Processor Datapath Design

---

## Future Enhancements

Possible future improvements include:

- 16-bit and 32-bit ALU implementation
- Signed arithmetic support
- Overflow and carry flag generation
- Pipelined architecture for higher throughput
- Integration of logical and shift operations
- Performance comparison with conventional multiplier architectures

---

## Learning Outcomes

This project demonstrates practical knowledge of:

- Verilog HDL
- RTL Design
- Modular Hardware Design
- Digital Arithmetic Circuits
- Vedic Mathematics
- FPGA Design Flow
- Xilinx Vivado
- Behavioral Simulation
- Synthesis and Timing Analysis
- FPGA Implementation

---

## Author

**Sarthak Chor**

Bachelor of Engineering (Electronics & Telecommunication)

**Areas of Interest**
- Digital VLSI Design
- RTL Design
- FPGA Design
- Verilog/SystemVerilog
- Computer Architecture

---

## License

This project is intended for educational and research purposes. Feel free to use, modify, and extend the design with proper attribution.
