//-----------------------------------------------------------------------------------------
// The following example program runs cyclicly and never stops; at each cycle it 
// reads a 8-bit most significant on the 16 switch, then 8-bit least significant on 
// the 16 switch and calculate their sum and displays it on the (simulated) 16 leds.
//
// @author Hamza MOUDDENE
//-----------------------------------------------------------------------------------------

SW   = 0x90000000                           // Switches I/O address
LD   = 0xB0000000                           // Leds I/O address
MASK = 0x000000ff                           // Mask to get the least significant bits

set    SW, %r8                              // %r8 = &SW
set    LD, %r9                              // %r9 = &LD
set    MASK, %r4                            // %r4 = &MASK
loop:      ld     [%r8], %r1                // %r1 = SW
           slr    %r1, 8, %r2               // %r2 = SW[15..8]
           and    %r1, %r4, %r3             // %r2 = SW[7..0]
           addcc  %r2, %r3, %r5             // %r5 = SW[15..8] + SW[7..0]
           slr    %r1, 8, %r2               // %r5 = SW[7..0]
           st     %r5, [%r9]                // %r9 = %r2       
           ba     loop                      // Goto loop
/** End of program */
