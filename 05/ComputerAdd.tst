// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Tests the Computer chip by having it execute the program Add.hack.
// The program adds up the constants 2 and 3 and writes the result in RAM[0]. 

load Computer.hdl,
output-file ComputerAdd.out,
compare-to ComputerAdd.cmp,
// Tracks the values of the time, reset bit, A-register, D-register,
// program counter, R0, R1, and R2.
output-list time%S1.3.1 reset%B2.1.2 ARegister[0]%D1.7.1 DRegister[0]%D1.7.1 PC[]%D0.4.0 RAM16K[0]%D1.7.1 RAM16K[1]%D1.7.1 RAM16K[2]%D1.7.1;

// Loads the binary program Add.hack into the computer's instruction memory 
ROM32K load Add.hack,
output;

// First run (at the beginning PC=0)
repeat 6 {
    tick, tock, output;
}

// Resets the PC
set reset 1,
set RAM16K[0] 0,
tick, tock, output;

// Second run, to check that the PC was reset correctly.
set reset 0,

repeat 6 {
    tick, tock, output;
}
