# Digital-alarm-clock-verilog
A Verilog HDL implementation of a digital alarm clock featuring timekeeping, alarm functionality, and simulation-based verification using testbenches and waveform analysis.

## Overview

This project implements a Digital Alarm Clock using Verilog HDL. The system keeps track of hours, minutes, and seconds while providing alarm functionality. The design was developed and verified through simulation, demonstrating the use of sequential logic, counters, clock management, and hardware verification techniques.

## Features

* Digital timekeeping (Hours, Minutes, Seconds)
* Alarm setting functionality
* Alarm trigger indication
* Reset capability
* Modular Verilog design
* Testbench-based verification

## System Architecture

The design consists of multiple modules working together to implement clock functionality:

* Clock Divider
* Second Counter
* Minute Counter
* Hour Counter
* Alarm Logic
* Top-Level Module

## Tools Used

* Verilog HDL
* EDA Playground
* EPWave Waveform Viewer

## Working Principle

The clock continuously counts seconds, minutes, and hours using synchronous sequential logic. When the current time matches the user-defined alarm time, the alarm signal is activated. The design is verified through simulation and waveform analysis.

## Simulation Results

Simulation waveforms demonstrate:

* Proper second counting
* Minute increment after 60 seconds
* Hour increment after 60 minutes
* Alarm activation at the preset time
* Correct reset operation

## Applications

* Digital clock systems
* FPGA-based timing systems
* Embedded digital designs
* Educational digital electronics projects

## Learning Outcomes

This project helped develop skills in:

* Verilog HDL programming
* Sequential circuit design
* Counter implementation
* Hardware simulation
* Testbench development
* Digital system verification

## Author

Divanshi Arora
