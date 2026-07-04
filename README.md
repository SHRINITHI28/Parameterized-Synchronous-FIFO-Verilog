# Parameterized Synchronous FIFO in Verilog HDL

## Overview

This project implements a parameterized synchronous First-In First-Out (FIFO) memory using Verilog HDL. The FIFO supports configurable data width and depth, circular buffer implementation, synchronous read/write operations, simultaneous read and write functionality, and full/empty status flag generation.

The design has been functionally verified using Xilinx Vivado with a comprehensive testbench covering reset, write, read, simultaneous read/write, FIFO full, FIFO empty, and pointer wrap-around conditions.

---

## Features

- Parameterized data width(32bit) and FIFO depth(8)
- Circular buffer implementation
- Synchronous Write operation
- Synchronous Read operation
- Simultaneous Read & Write support
- Full flag generation
- Empty flag generation
- Circular read/write pointer management
- Functional verification using Vivado simulation

---

## Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| datawidth | Width of each data word | 32 |
| depth | Number of FIFO locations | 8 |
| addr_width | Address width | 3 |

---

## Input Ports

| Signal | Width | Description |
|--------|-------|-------------|
| clk | 1 | System Clock |
| reset | 1 | Active High Reset |
| write_enable | 1 | Enables write operation |
| read_enable | 1 | Enables read operation |
| data_in | datawidth | Input data |

---

## Output Ports

| Signal | Width | Description |
|--------|-------|-------------|
| data_out | datawidth | Output data |
| full | 1 | FIFO Full indicator |
| empty | 1 | FIFO Empty indicator |

---

## FIFO Architecture

- Parameterized memory array
- Circular buffer implementation
- Read Pointer
- Write Pointer
- Counter-based Full/Empty detection
- Synchronous Read and Write operations

---

## Testbench Verification

The FIFO was verified for the following test cases:

- Reset operation
- Multiple Write operations
- Multiple Read operations
- Simultaneous Read & Write
- FIFO Full condition
- FIFO Empty condition
- Circular Pointer Wrap-around

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
---

## Learning Outcomes

- Parameterized RTL Design
- FIFO Architecture
- Circular Buffer Implementation
- Read/Write Pointer Management
- Counter-Based Full and Empty Detection
- Verilog Testbench Development
- Functional Verification

---

## Author

**Shrinithi K L**

ECE Student | SSN College of Engineering

Building strong fundamentals in Digital Design, RTL Design, FPGA, and VLSI with Verilog HDL.
