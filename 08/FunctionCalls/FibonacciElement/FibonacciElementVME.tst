// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Tests and illustrates the given Fibonacci element program on the VM emulator.

load,  // loads all the VM files from the current folder
output-file FibonacciElement.out,
compare-to FibonacciElement.cmp,

set sp 261,

repeat 110 {
  vmstep;
}

// Outputs the stack pointer and the value at the stack's base.
// That's where the implementation should put the return value.  
output-list RAM[0]%D1.6.1 RAM[261]%D1.6.1;
output;
