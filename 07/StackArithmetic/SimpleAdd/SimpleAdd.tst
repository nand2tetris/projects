// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Tests SimpleAdd.asm on the CPU emulator.

load SimpleAdd.asm,
output-file SimpleAdd.out,
compare-to SimpleAdd.cmp,

set RAM[0] 256,  // initializes the stack pointer 

repeat 60 {      // enough cycles to complete the execution
  ticktock;
}

// Outputs the stack pointer and the value at the stack's base
output-list RAM[0]%D2.6.2 RAM[256]%D2.6.2;
output;
