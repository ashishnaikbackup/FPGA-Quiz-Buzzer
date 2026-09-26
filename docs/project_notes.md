# Project Notes

## Project
FPGA Quiz Buzzer

## Core Concept
Finite State Machine (FSM) based first-button detection for three players.

## Clock
50 MHz clock with a 20 ns period.

## State Machine

- S0: waiting state
- S1: Player A selected
- S2: Player B selected
- S3: Player C selected

## Buzzer Behavior

The first detected button selects the corresponding player state and LED. The selected state remains active for approximately one second before returning to the waiting state.

## Input Priority

In the waiting state, the current RTL checks buttons in the order A, B, C. If multiple buttons are asserted at the same sampling edge, A has the highest coded priority, followed by B and C.

## Vivado

The project uses a 20 ns `create_clock` constraint, corresponding to a 50 MHz clock. The XDC file also maps the buttons, LEDs, and reset input to the FPGA package pins used during the original implementation.
