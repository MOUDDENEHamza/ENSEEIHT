//-----------------------------------------------------------------------------------------
// Calculate the sum of the items of a given array
//
// @author Hamza MOUDDENE
//-----------------------------------------------------------------------------------------

set    T, %r1                     // %r1 = T
set    n, %r4                     // %r4 = &n
ld    [%r4], %r4                  // %r4 = n
clr    %r2                        // i = 0
clr    %r3                        // S = 0

loop:    subcc %r2, %r4, %r0      // %r0 = i - n
         be    endloop            // goto stop 
         ld    [%r1 + %r2], %r5   // %r4 = T[i]
         add   %r3, %r5, %r3      // S += T[i]
         add   %r2, 1, %r2        // i += 1              
         ba    loop               // si i < n loop
endloop: set S, %r1               // [%r1] = &S
         st %r3, [%r1]            // %r1 = S
end :    ba end                   // end
         
T : .word 14, 7, 12, 27, 3, 55, 44, 22, 15, 6
n : .word 10
S : .word 0
