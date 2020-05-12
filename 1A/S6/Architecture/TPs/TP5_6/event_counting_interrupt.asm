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
    inc %r3                                                 // %r3 += 1
    reti                                                    // Goto fetch
    
main:
    set 0x200, %r29                                         // Initialize the stack

    set LD, %r9                                             // %r9 = &LD
    set MEM, %r3                                            // %r3 = &MEM
    clr %r3                                                 // MEM = 0

    loop:                                                   // Start loop                                                     
         st %r3, [%r9]                                      // Store %r3 on the leds     
    ba loop                                                 // Alawys loop
/** End of program */
