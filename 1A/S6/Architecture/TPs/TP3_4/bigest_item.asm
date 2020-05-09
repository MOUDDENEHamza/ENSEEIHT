////-----------------------------------------------------------------------------------------
// Search the bigest item in array
//
// @author Hamza MOUDDENE
////-----------------------------------------------------------------------------------------

set   T, %r1                                  // %r1 = &T
set   n, %r4                                  // %r4 = &n
ld    [%r4], %r4                              // %r4 = n
ld    [%r1], %r3                              // Max = T[0]  

clr %r2                                       // i = 0
loop:    subcc %r2, %r4, %r0                  // %r0 = i - n
         bge    endloop                       // if (i >= n)goto endloop 
         ld[%r1 + %r2], %r5                   // %r5 = T[i]      
         if: subcc %r5, %r3, %r0              // if (T[i] < Max)
               bl   endif                     // if (T[i] < Max) then goto endif
               clr %r3                        // Max = 0
               add  %r5, 0, %r3               // Max = T[i]
         endif:                               // endif
         add   %r2, 1, %r2                    // i += 1              
         ba    loop                           // goto loop
endloop: set Max, %r6                         // quit loop, and set Max in %r6 : %r6 = &Max
         st %r3, [%r6]                        // Store the Max in address of %r6
end:     ba end                               // end of program

T : .word 14, 7, 12, 27, 3, 55, 44, 22, 15, 6
n : .word 10
Max : .word 0
