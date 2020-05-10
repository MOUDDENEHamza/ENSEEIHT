//-----------------------------------------------------------------------------------------
// Implement the sieve of eratosthenes, the purpose of this program is to eliminate from an 
// array of n items all the items which are multile of another
//
// @author Hamza MOUDDENE
//-----------------------------------------------------------------------------------------

set T , %r1                               // %r1 = &T
set elim , %r6                            // %r6 = &elim
set n , %r4                               // %r4 = &n
ld [%r4] , %r4                            // %r4 = n
sub %r4, 2, %r12                          // %r12  = n - 2
sub %r4, 1, %r4                           // %r4  = n - 1
clr %r2                                   // i = 0

loop1: cmp %r2, %r12                      // if (i < n - 2)
    bg endloop1                           // si i > n - 2 goto to endloop1     
         ld[%r6 + %r2], %r7               // %r7 = elim[i] 
         
         if1: cmp %r7, 0                  // if (elim[i] == 0)
             bne endif1                   // if (elim[i] != 0) goto endif1
             ld[%r1 + %r2], %r5           // %r5 = T[i]
             add %r2, 1, %r8              // %r8 = j = i + 1 
            
            loop2: cmp %r8, %r4           // if (j < n - 1)
               bg endloop2                // if (j > n - 1) goto endloop2 
                 ld[%r1 + %r8], %r10      // %r10 = T[j]
                 ld[%r1 + %r2], %r11      // %r11 = x = T[i]
                 
                 loop3: cmp %r11, %r10    // if (x < T[j]) 
                   bge endloop3           // if (x >= T[j]) goto endloop3
                     add %r11, %r5, %r11  // %r11 = x = x + T[i]
                   bl loop3               // if (x < T[j]) goto endloop3 
                 endloop3:                // Quit loop3
                 
                 if2: cmp %r11, %r10      // if (x == T[j])
                   bne endif2             // if (x != T[j]) goto enif2
                    clr %r13              // %r13 = 0 
                    inc %r13              // %r13 = 1
                    st %r13, [%r6 + %r8]  // %r13 = elim[j] = 1
                 endif2:                  // Quit if2
                 
                 inc %r8                  // j += 1
                 cmp %r8, %r4             // if (j < n - 1)
               ble loop2                  // if (j <= n - 1) goto loop2 
             endloop2:                    // Quit loop2
             
         endif1:                          // Quit if1  
         
         inc %r2                          // i += 1  
         cmp %r2, %r12                    // if (i < n - 2)
    ble loop1                             // if (i <= n - 2) goto loop1
endloop1: ba endloop1                     // Quit loop1

elim : .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
T: .word 3, 4, 7, 12, 13, 15, 16, 20, 23, 37
n: .word 10
