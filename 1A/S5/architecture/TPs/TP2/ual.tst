// add
set a[31..0] 00000000000000000000000000000110
set b[31..0] 00000000000000000000000000000011
set cmd[5..0] 000000
check s[31..0] 00000000000000000000000000001001
check N 0
check Z 0
check V 0
check C 0
check enN 0
check enZ 0
check enVC 0

// addcc
set cmd[5..0] 010000
check enN 1
check enZ 1
check enVC 1

// sub
set a[31..0] 01111111111111111111111111111111
set b[31..0] 10000000000000000000000000000000
set cmd[5..0] 000100
check s[31..0] 11111111111111111111111111111111
check N 1
check Z 0
check C 1
check V 1
check enN 0
check enZ 0
check enVC 0

// subcc
set cmd[5..0] 010100
check enN 1
check enZ 1
check enVC 1

// and
set a[31..0] 01111111111111111111111111111111
set b[31..0] 10000000000001000000000000000000
set cmd[5..0] 000001
check s[31..0] 00000000000001000000000000000000
check N 0
check Z 0
check enN 0
check enZ 0
check enVC 0

// andcc
set cmd[5..0] 010001
check enN 1
check enZ 1
check enVC 0

// or
set a[31..0] 01111111111111111111111111110011
set b[31..0] 10000000000001000000000000000000
set cmd[5..0] 000010
check s[31..0] 11111111111111111111111111110011
check N 1
check Z 0
check enN 0
check enZ 0
check enVC 0

// orcc
set cmd[5..0] 010010
check enN 1
check enZ 1
check enVC 0

// xor
set a[31..0] 01111111111111111111111111110011
set b[31..0] 10000000000001000000000000000000
set cmd[5..0] 000011
check s[31..0] 11111111111110111111111111110011
check N 1
check Z 0
check enN 0
check enZ 0
check enVC 0

// xorcc
set cmd[5..0] 010011
check enN 1
check enZ 1
check enVC 0

// signext13
set a[31..0] 00000000000000000011000000001100
set cmd[5..0] 100000
check s[31..0] 11111111111111111111000000001100
check N 1
check Z 0
check enN 0
check enZ 0
check enVC 0
