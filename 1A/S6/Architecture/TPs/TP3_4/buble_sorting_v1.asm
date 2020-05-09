//-----------------------------------------------------------------------------------------
// Implement the buble sorting in a given array without subprogram
//
// @author Hamza MOUDDENE
//-----------------------------------------------------------------------------------------

set T , %r1                           // %r1 = &T
set n , %r4                           // %r4 = &n
ld [%r4] , %r4                        // %r4 = n
sub %r4, 1, %r3                       // i   = n - 1

loop1: cmp %r3, 1                     // Compare i and 1
    bl endloop1                       // if %r3 < 1 
    sub %r3, 1, %r13                  // %r13 = i - 1
    clr %r5                           // j = 0
    loop2: cmp %r5, %r13              // compare j and (i - 1)
         bg endloop2                  // if (j > (i - 1))
         ld [%r1 + %r5] , %r6         // %r6 = T[j]
         add %r5, 1, %r8              // %r8 = j + 1
         ld [%r1 + %r8] , %r7         // %r7 = T[j + 1]
         
         if: cmp %r6, %r7             // compare T[j] and T[j + 1] 
             ble endif                // if (T[j] <= T[j + 1]) goto endif  
             st %r7 , [%r1 + %r5]     // T[j] = T[j+1]
             st %r6 , [%r1 + %r8]     // T[j+1] = old_T[j]
         endif:                       // Endif, permutation done
         
         inc %r5                      // j =+ 1
         ba loop2                     // goto loop2
     endloop2:                        // Endloop2
     dec %r3                          // i -= 1
     ba loop1                         // goto to loop1
endloop1: ba endloop1                 // End program

T: .word 10,9,8,7,6,5,4,3,2,1
n: .word 10
