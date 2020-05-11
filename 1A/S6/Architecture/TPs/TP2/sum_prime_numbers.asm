/**--------------------------------------------------------------------------------------------
Calculates the sum of the prime first N integers, with N in %r1 and the result wil be in %r2

@author Hamza MOUDDENE
---------------------------------------------------------------------------------------------*/

set N, %r1                               // %r1 = &N
ld [%r1], %r1                            // %r1 = N
set 2, %r2                               // %r2 = 0
set 2, %r3                               // p = 2

WHILE1 : cmp %r1, 0                      // Comapre N and 0
    ble ENDWHILE1                        // If (N <= 0) goto WHILE1
    IF2 : cmp %r6, 0                     // Compare %r2 and 0
        bne ELSE2                        // If (%r6 != 0), then goto ELSE2
        set 2, %r5                       // i = 2
        ba ENDIF2                        // Quit IF2
    ELSE2 :                              // If %r6 != 0
        clr %r5                          // i = 0
        addcc %r6, 1, %r5                // i = %r6 + 1
        clr %r6                          // %r6 = 0
    ENDIF2 :                             // Quit IF2
    FOR : cmp %r5, %r3                   // Compare i and p
        bge ENDFOR                       // IF (i >= p), then goto ENDFOR
        add %r3, 0, %r4                  // %r4 = tmp = p
        WHILE2 : cmp %r4, 0              // Compare tmp and p
            ble ENDWHILE2                // If (tmp <= 0) goto ENDWHILE2
            subcc %r4, %r5, %r4          // tmp -= i
            ba WHILE2                    // Goto WHILE2
        ENDWHILE2 :                      // Quit WHILE2
        IF : cmp %r4, 0                  // Compare tmp and 0
            bne ENDIF                    // If (tmp != 0) then goto ENDIF
            addcc %r2, %r5, %r2          // Sum += i
            clr %r6                      // %r6 = 0
            addcc %r5, 0, %r6            // %r6 = i 
            dec %r1                      // %r1 --
            IF1 : cmp %r1, 0             // Compare N and 0
                bne ENDIF1               // If (N != 0), then goto ENDIF1
                ba WHILE1                // Goto WHILE1
            ENDIF1:                      // Quit IF1
        ENDIF :                          // Quit IF
        inc %r5                          // i +=1
        ba FOR                           // Goto For
    ENDFOR:                              // Quit For
    clr %r4                              // tmp = 0
    inc %r3                              // p += 1
    ba WHILE1                            // Goto WHILE1
ENDWHILE1 : set Sum, %r1                 // %r1 = &Sum
    st %r2, [%r1]                        // %r1 = Sum
END : ba END                             // End of program

/** N is the maximum of the interval where we will look for prime numbers, and Sum where we
    will store the result.
 */
N   : .word 9
Sum : .word 0
