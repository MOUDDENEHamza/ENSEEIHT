//-----------------------------------------------------------------------------------------
// Implements the reverse polish notation
//
// @author Hamza MOUDDENE
//-----------------------------------------------------------------------------------------

set 0x200, %r29                          // Initialize the stack
set Expr, %r1                            // %r1 = &Expr
END = 0x80000000                         // End of expression
MASK = 0x00000001                        // Maks to get the least significant bit

clr %r2                                  // i = 0, index of loop
ld [%r1 + %r2], %r3                      // %r3 = Expr[i]
set END, %r4                             // %r4 = END

/** Start loop */
LOOP : cmp %r3, %r4                      // Compare Expr[i] and END
    be ENDLOOP                           // If (Expr[i] == END) goto endloop
    and %r3, %r4, %r5                    // Mask to recuperate the most significant bit
    
    IF1 : cmp %r5, %r4                   // compare Expr[i]&END and END
        /** If (Expr[i]&END = END) that means that Expr[i]&END is an arithmetic operation 
          */
        be ELSE1                         // Goto ELSE                         
        push %r3                         // Push the operand
        ba ENDIF1                          // Goto ENDIF1
    ELSE1 :                              // If (Expr[i]&END and END)is an arithmetic operation
        pop %r6                          // Pop second operand
        pop %r7                          // Pop first operand
        set MASK, %r8                    // %r8 = MASK
        and %r3, %r8, %r9                // %r9 = Expr[i]&MASK (the least significant bit)
        clr %r10                         // %r10 = 0
        IF2 : cmp %r9, %r8               // Compare (Expr[i]&MASK) and MASK
            bne ELSE2                    // If [(Expr[i]&MASK) != MASK], then goto ELSE2
            /** ADDITION CASE */
            addcc %r7, %r6, %r10         // %r10 = op1 + op2
            push %r10                    // Push %r10 on the stack
            ba ENDIF1                    // Goto ENDIF1
        ELSE2 :
            /** SOUSTRATION CASE */
            subcc %r7, %r6, %r10         // %r10 = op1 - op2
            push %r10                    // Push %r10 on the stack
            ba ENDIF1                    // Goto LOOP
        ENDIF2 :                         // Quit ENDIF2
        
    ENDIF1 :                             // Quit ENDIF1
    inc %r2                              // i += 1
    ld [%r1 + %r2], %r3                  // Update %r3
    ba LOOP                              // Goto LOOP
ENDLOOP : ba ENDLOOP                     // Quit ENDLOOP
// End program

/** Data structure we will use in this program
    Expr represents : 15 7 4 − + 2 −, and 0x80000000 it is the end of expression
    */
Expr : .word 15, 7, 4, 0x80000002, 0x80000001, 2, 0x80000002, 0x80000000
