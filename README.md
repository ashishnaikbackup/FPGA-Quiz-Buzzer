# FPGA Quiz Buzzer

> **3-player FPGA quiz buzzer built with Verilog HDL and Xilinx Vivado**

A compact digital-design project that implements a first-press quiz buzzer on an FPGA development board. Three players compete to answer a question; the first detected button press selects that player and lights the corresponding LED for approximately one second.

[![Verilog](https://img.shields.io/badge/HDL-Verilog-8A2BE2?style=for-the-badge)](https://en.wikipedia.org/wiki/Verilog)
[![Vivado](https://img.shields.io/badge/Tool-Xilinx%20Vivado-red?style=for-the-badge)](https://www.amd.com/en/products/software/adaptive-socs-and-fpgas/vivado.html)
[![FPGA](https://img.shields.io/badge/Platform-FPGA-blue?style=for-the-badge)](https://www.amd.com/en/products/adaptive-socs-and-fpgas.html)

## Project Overview

The project demonstrates practical FPGA digital-design concepts including:

- Finite State Machine (FSM) design
- Synchronous counter-based timing
- Button inputs and LED outputs
- Reset handling
- FPGA pin constraints using XDC
- RTL implementation and synthesis in Vivado

## How It Works

The design has four states:

| State | Description | Output |
|---|---|---|
| `S0` | Waiting for a player | All LEDs OFF |
| `S1` | Player A selected | `ledA` ON |
| `S2` | Player B selected | `ledB` ON |
| `S3` | Player C selected | `ledC` ON |

While in `S0`, the buttons are checked in this order:

**Player A → Player B → Player C**

Once a player is selected, the corresponding LED remains ON for approximately one second. The FSM then returns to `S0`, ready for the next round.

## Timing

The XDC defines a **50 MHz** system clock:

- Clock period: **20 ns**
- Clock frequency: **50 MHz**
- Counter terminal value: **49,999,999**
- LED indication: approximately **1 second**

## Hardware Interface

| Signal | FPGA Pin | Function |
|---|---:|---|
| `clk` | E3 | 50 MHz clock |
| `rst` | B8 | Reset button |
| `btnA` | D9 | Player A button |
| `btnB` | C9 | Player B button |
| `btnC` | B9 | Player C button |
| `ledA` | H5 | Player A LED |
| `ledB` | J5 | Player B LED |
| `ledC` | T9 | Player C LED |

> Pin assignments are taken directly from the project's XDC constraints file. Verify them against your exact FPGA board before programming different hardware.

## Repository Structure

```text
FPGA-Quiz-Buzzer/
├── README.md
├── src/
│   └── quiz_buzzer.v
├── constraints/
│   └── quiz_buzzer_constraints.xdc
└── docs/
    └── project_notes.md
```

## Vivado Setup

1. Open **Xilinx Vivado**.
2. Create a new RTL project.
3. Add `src/quiz_buzzer.v` as the design source.
4. Add `constraints/quiz_buzzer_constraints.xdc` as the constraints file.
5. Set `quiz_buzzer` as the top module.
6. Run **Synthesis**.
7. Run **Implementation**.
8. Generate the **Bitstream**.
9. Connect the FPGA board and open **Hardware Manager**.
10. Program the device and test the buttons.

## Expected Behavior

```text
             +----------------+
             |   WAIT / S0    |
             +-------+--------+
                     |
          +----------+----------+
          |          |          |
        btnA       btnB       btnC
          |          |          |
          v          v          v
       +-----+    +-----+    +-----+
       | S1  |    | S2  |    | S3  |
       | A   |    | B   |    | C   |
       +--+--+    +--+--+    +--+--+
          |          |          |
          +----------+----------+
                     |
                ~1 second
                     |
                     v
             +----------------+
             |   WAIT / S0    |
             +----------------+
```

## Design Notes

This is an RTL-level educational project intended to demonstrate basic FPGA design and finite-state-machine concepts. The current implementation checks the buttons sequentially in the `S0` state, so if multiple buttons are asserted at the same clock edge, the coded priority is A > B > C.

For a more advanced version, the project could be extended with:

- Debouncing for mechanical buttons
- A buzzer/speaker output
- Seven-segment display for player indication
- Question timer
- Lockout until reset
- Simulation testbench
- Improved simultaneous-input handling

## Files

### `src/quiz_buzzer.v`
Main Verilog RTL module containing the FSM, outputs, and one-second counter.

### `constraints/quiz_buzzer_constraints.xdc`
Vivado XDC file containing FPGA pin assignments and the 50 MHz clock constraint.

### `docs/project_notes.md`
Short technical notes about the implementation.

## Tools & Technologies

- **Verilog HDL**
- **Xilinx Vivado**
- **FPGA Development Board**
- **Finite State Machine (FSM)**
- **RTL Digital Design**

## Author

**Ashish Naik**  
4th-year B.E. student — Goa Engineering College

- GitHub: [ashishnaikbackup](https://github.com/ashishnaikbackup)
- LinkedIn: [Ashish Naik](https://www.linkedin.com/in/ashish-naik-9b256038b/)

---

If you found this project useful, feel free to explore, fork, or improve it.