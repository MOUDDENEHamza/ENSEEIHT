//-----------------------------------------------------------------------------------------------
// The following example program runs cyclicly and never stops; at each cycle it reads the value,
// of 0x100 and displays it on the led, with a interruption subprogram that increments the 
// content of memory address 0x100 at each occurrence of an interruption on IT.
//
// @author Hamza MOUDDENE
//------------------------------------------------------------------------------------------------

LD = 0xB0000000                                             // leds I/O address  
MEM = 0x100                                                 // Memory address 0x100   

ba main                                                     // branch always main

handler:                                                    // Interruption subprogram  
    inc %r2                                                 // %r2 += 1
    st %r2, [%r3]                                           // MEM = %r2
    reti                                                    // Goto fetch
    
main:
    set 0x200, %r29                                         // Initialize the stack

    set LD, %r9                                             // %r9 = &LD
    set MEM, %r3                                            // %r3 = &MEM
    st %r0, [%r3]                                           // MEM = 0

    loop:                                                   // Start loop                                                     
         ld [%r3], %r2                                      // %r2 = MEM
         st %r2, [%r9]                                      // Store %r2 on the leds     
    ba loop                                                 // Alawys loop
/** End of program */
