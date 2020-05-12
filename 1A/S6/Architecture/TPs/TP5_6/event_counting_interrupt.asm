//-----------------------------------------------------------------------------------------------
// The following example program runs cyclicly and never stops; at each cycle it checks if sw[0] 
// increased from 0 to 1, if it is true it increases the value of address memeory 0x100 and 
// displays it on the leds
//
// @author Hamza MOUDDENE
//-----------------------------------------------------------------------------------------------

SW = 0x90000000                                         // switches I/O address
LD = 0xB0000000                                         // leds I/O address
MEM = 0x100                                             // Memory address 0x100  
MASK = 0b1                                              // Mask containing 

set SW, %r8                                             // %r8 = &SW
set LD, %r9                                             // %r9 = &LD
set MASK, %r2                                           // %r2 = &MASK
set MEM, %r4                                            // %r4 = &MEM

st %r0, [%r4]                                           // [%r4] = [&MEM] = 0
ld[%r4], %r4                                            // %r4 = [&MEM]
clr %r10                                                // %r10 = 0

loop:                                                   // Start loop           
     ld[%r8], %r1                                       // %r1 = [SW]
     and %r1, %r2, %r3                                  // %r3 = SW and MASK
     
     if1: cmp %r3, 1                                    // if (SW[0] == 1)
       bne endif1                                       // if (SW[0] != 1) goto endif1
         
         if2: cmp %r10, 0                               // if (old_SW[0] == 0)
           bne endif2                                   // if (old_SW[0] != 0) goto endif2
             inc %r4                                    // %r4 += 1
             st %r4, [%r9]                              // Store %r3 on the leds
         endif2:                                        // Quit the if2 loop
     
     endif1:                                            // Quit the if1 loop
     
     clr %r10                                           // %r10 = 0
     add %r3, %r10, %r10                                // %r10 = %r3
   ba loop                                              // Alawys loop
/** End of program */
