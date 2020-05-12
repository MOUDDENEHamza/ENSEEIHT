//-----------------------------------------------------------------------------------------
// The following example program runs cyclicly and never stops; at each cycle it 
// reads a 16-bit number n on (simulated) switches, computes the square root of
// n and displays it on the (simulated) 16 leds.
//
// @author Hamza MOUDDENE
//-----------------------------------------------------------------------------------------

SW = 0x90000000                             // Switches I/O address
LD = 0xB0000000                             // Leds I/O address

set    SW, %r8                              // %r8 = &SW
set    LD, %r9                              // %r9 = &LD
loop:      ld [%r8], %r1                    // %r1 = SW
           umulcc %r1, %r1, %r2             // %r2 = SW ^ 2
           st     %r2, [%r9]                // %r9 = %r2       
           ba     loop                      // Goto loop
/** End of program */
