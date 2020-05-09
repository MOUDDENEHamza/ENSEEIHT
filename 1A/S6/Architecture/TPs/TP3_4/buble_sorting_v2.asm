//-----------------------------------------------------------------------------------------
// Implement the buble sorting in a given array with subprogram
//
// @author Hamza MOUDDENE
//-----------------------------------------------------------------------------------------

set T, %r1                                      // %r1 = &T
set N, %r2                                      // %r2 = &N
ld [%r2], %r2                                   // %r2 = N
sub %r2, 1, %r3                                 // i   = n - 1 

loop1 :   cmp %r3, 1                            // Compare i and 1
          bl endloop1                           // If (i < 1) goto endloop
          sub %r3, 1, %r13                      // %r13 = i - 1
          clr %r4                               // j = 0
          loop2 :       cmp %r4, %r13           // Compare j and (i - 1)
                        bg endloop2             // If j > (i - 1) goto endloop2
                        ld [%r1 + %r4], %r5     // %r5 = T[j]
                        add %r4, 1, %r8         // %r8 = j + 1
                        ld [%r1 + %r8], %r6     // %r6 = T[j + 1]
                        call permute            // Permute T[j] and T[j + 1]
                        inc %r4                 // j += 1
                        ba loop2                // Goto loop2
          endloop2:                             // Endloop2
          
          dec %r3                               // i -= 1
          ba loop1                              // Goto loop1
endloop1: ba endloop1                           // End program

// Subprogram to permute T[j] and T[j + 1]
permute :                                            
        if :     cmp %r5, %r6                   // Compare T[j] and T[j + 1]
                 ble endif                      // If (T[j] <= T[j + 1]), then goto endif
                 st %r5, [%r1 + %r8]            // %r5 = T[j + 1]
                 st %r6, [%r1 + %r4]            // %R6 = T[j]
        endif :                                 // End if
        ret                                     // Return
        
T: .word 10,9,8,7,6,5,4,3,2,1
N: .word 10
