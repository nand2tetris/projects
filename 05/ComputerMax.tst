// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Tests the Computer chip by having it execute the program Max.hack.
// The program computes maximum(R0, R1) and writes the result in RAM[2].

load Computer.hdl,
output-file ComputerMax.out,
compare-to ComputerMax.cmp,
// Tracks the values of the time, reset bit, A-register, D-register,
// program counter, R0, R1, and R2.
output-list time%S1.3.1 reset%B2.1.2 ARegister[]%D1.7.1 DRegister[]%D1.7.1 PC[]%D0.4.0 RAM16K[0]%D1.7.1 RAM16K[1]%D1.7.1 RAM16K[2]%D1.7.1;

// Loads the binary program Add.hack into the computer's instruction memory 
ROM32K load Max.hack,

// first run: computes max(3,5)
set RAM16K[0] 3,
set RAM16K[1] 5,
output;

repeat 14 {
    tick, tock, output;
}

// resets the PC
set reset 1,
tick, tock, output;

// second run: computes max(23456,12345)
set reset 0,
set RAM16K[0] 23456,
set RAM16K[1] 12345,
output;

// The run on these inputs requires less cycles (different branching)
repeat 10 {
    tick, tock, output;
}
