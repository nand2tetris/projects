// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Tests the Memory chip by inputting values to selected addresses, 
// verifying that these addresses were indeed written to, and verifying  
// that other addresses were not accessed by mistake. In particular, we 
// focus on probing the registers in addresses 'lower RAM', 'upper RAM',
// and 'Screen', which correspond to 0, %X2000, and %X4000 in Hexadecimal 
// (0, 8192 (8K), and 16385 (16K+1) in decimal).

load Memory.hdl,
output-file Memory.out,
compare-to Memory.cmp,
output-list in%D1.6.1 load%B2.1.2 address%B1.15.1 out%D1.6.1;

echo "Before you run this script, select the 'Screen' option from the 'View' menu";

// We've noticed a common design mistake in several students' Memory.hdl files.
// This error leads to zeros being written in the offset of inactive memory segments
// instead of the intended location. To identify this issue, the test should check not
// only for incorrect writes into the wrong segment but also for any unexpected changes.
// To prepare for this, we've initialized the memory with a specific number in the areas
// where these erroneous writes might happen.

//// Sets RAM[2000], RAM[4000] = 12345 (for the following overwrite test)
set in 12345, set load 1, set address %X2000, tick, output; tock, output;
set address %X4000, tick, output; tock, output;

set in -1,				// Sets RAM[0] = -1
set load 1,
set address 0,
tick,
output;
tock,
output;

set in 9999,			// RAM[0] holds value
set load 0,
tick,
output;
tock,
output;

set address %X2000,		// Did not also write to upper RAM or Screen
eval,
output;
set address %X4000,
eval,
output;

//// Sets RAM[0], RAM[4000] = 12345 (for following overwrite test)
set in 12345, set load 1, set address %X0000, tick, output; tock, output;
set address %X4000, tick, output; tock, output;

set in 2222,			// Sets RAM[2000] = 2222
set load 1,
set address %X2000,
tick,
output;
tock,
output;

set in 9999,			// RAM[2000] holds value
set load 0,
tick,
output;
tock,
output;

set address 0,			// Did not also write to lower RAM or Screen
eval,
output;
set address %X4000,
eval,
output;

set load 0,				// Low order address bits connected
set address %X0001, eval, output;
set address %X0002, eval, output;
set address %X0004, eval, output;
set address %X0008, eval, output;
set address %X0010, eval, output;
set address %X0020, eval, output;
set address %X0040, eval, output;
set address %X0080, eval, output;
set address %X0100, eval, output;
set address %X0200, eval, output;
set address %X0400, eval, output;
set address %X0800, eval, output;
set address %X1000, eval, output;
set address %X2000, eval, output;

set address %X1234,		// RAM[1234] = 1234
set in 1234,
set load 1,
tick,
output;
tock,
output;

set load 0,
set address %X2234,		// Did not also write to upper RAM or Screen 
eval, output;
set address %X6234,
eval, output;

set address %X2345,		// RAM[2345] = 2345
set in 2345,
set load 1,
tick,
output;
tock,
output;

set load 0,
set address %X0345,		// Did not also write to lower RAM or Screen 
eval, output;
set address %X4345,
eval, output;

//// Clears the overwrite detection value from the screen
set in 0, set load 1, set address %X4000, tick, output; tock, output;

// Keyboard test

set address 24576,
echo "Click the Keyboard icon and hold down the 'K' key (uppercase) until you see the next message...",
// It's important to keep holding the key down since if the system is busy,
// the memory will zero itself before being outputted.

while out <> 75 {
    tick, tock,     // tick, tock prevents hang if sync. parts used in KB path.
}

clear-echo,
output;

// Screen test

//// Sets RAM[0FCF], RAM[2FCF] = 12345 (for following overwrite test)
set in 12345, set load 1, set address %X0FCF, tick, output; tock, output;
set address %X2FCF, tick, output; tock, output;

set load 1,
set in -1,
set address %X4FCF,
tick,
tock,
output,

set address %X504F,
tick,
tock,
output;

set address %X0FCF,		// Did not also write to lower or upper RAM
eval,
output;
set address %X2FCF,
eval,
output;

set load 0,				// Low order address bits connected
set address %X4FCE, eval, output;
set address %X4FCD, eval, output;
set address %X4FCB, eval, output;
set address %X4FC7, eval, output;
set address %X4FDF, eval, output;
set address %X4FEF, eval, output;
set address %X4F8F, eval, output;
set address %X4F4F, eval, output;
set address %X4ECF, eval, output;
set address %X4DCF, eval, output;
set address %X4BCF, eval, output;
set address %X47CF, eval, output;
set address %X5FCF, eval, output;

set load 0,
set address 24576,
echo "Two horizontal lines should be in the middle of the screen. Hold down 'Y' (uppercase) until you see the next message ...",
// It's important to keep holding the key down since if the system is busy,
// the memory will zero itself before being outputted.

while out <> 89 {
    tick, tock,     // tick, tock prevents hang if sync. parts used in KB path.
}

clear-echo,
output;
