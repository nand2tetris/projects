// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Tests StaticTest.asm on the CPU emulator.

load StaticTest.asm,
output-file StaticTest.out,
compare-to StaticTest.cmp,

set RAM[0] 256,    // initializes the stack pointer

repeat 200 {       // enough cycles to complete the execution
  ticktock;
}

// Outputs the value at the stack's base 
output-list RAM[256]%D1.6.1;
output;
