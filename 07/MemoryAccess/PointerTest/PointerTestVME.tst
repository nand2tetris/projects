// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Tests and illustrates PointerTest.vm on the VM simulator.

load PointerTest.vm,
output-file PointerTest.out,
compare-to PointerTest.cmp,

set RAM[0] 256,   // initializes the stack pointer

repeat 15 {       // PointerTest.vm has 15 VM commands
  vmstep;
}

// Outputs the stack base, THIS, THAT, and
// some values from the the this and that segments
output-list RAM[256]%D1.6.1 RAM[3]%D1.6.1 RAM[4]%D1.6.1
            RAM[3032]%D1.6.1 RAM[3046]%D1.6.1;
output;
