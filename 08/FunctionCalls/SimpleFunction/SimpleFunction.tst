// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Tests SimpleFunction.asm in the CPU emulator.
// In particular, tests how the assembly implementation of the 'function'
// VM command initializes local variables, and how the assembly implementation
// of the 'return' VM command handles the return value, SP, LCL, ARG, THIS, and THAT. 
// Before executing the code, initializes the stack pointer and the pointers of some
// of the memory segments, and sets some values in the argument segment.

load SimpleFunction.asm,
output-file SimpleFunction.out,
compare-to SimpleFunction.cmp,

set RAM[0] 317,    // SP
set RAM[1] 317,    // LCL
set RAM[2] 310,    // ARG
set RAM[3] 3000,   // THIS
set RAM[4] 4000,   // THAT
set RAM[310] 1234, 
set RAM[311] 37,    
set RAM[312] 1000, 
set RAM[313] 305,
set RAM[314] 300,
set RAM[315] 3010,
set RAM[316] 4010, 

repeat 300 {
	ticktock;
}

// Outputs SP, LCL, ARG, THIS, THAT, and the return value.
output-list RAM[0]%D1.6.1 RAM[1]%D1.6.1 RAM[2]%D1.6.1 
            RAM[3]%D1.6.1 RAM[4]%D1.6.1 RAM[310]%D1.6.1;
output;
