////-----------------------------------------------------------------------------------------
// Factoriel itervative version
//
// @author Hamza MOUDDENE
////-----------------------------------------------------------------------------------------

set N, %r1                                            // %r1 = &N
ld [%r1], %r1                                         // %r1 = N
set 2, %r2                                            // %r2 = 2
set 1, %r3                                            // %r3 = 1 

FOR : cmp %r2, %r1                                    // Compare i and N
    bg END_FOR                                        // If (i > N) goto END_FOR
    umulcc %r2, %r3, %r3                              // res = res * i
    inc %r2                                           // i++
    ba FOR                                            // Goto FOR
END_FOR :                                             // Quit FOR
set fact, %r1                                         // %r1 = &fact
st %r3, [%r1]                                         // fact = res

/** The number we will calculte it factoriel */
N    : .word 4
fact : .word 0
