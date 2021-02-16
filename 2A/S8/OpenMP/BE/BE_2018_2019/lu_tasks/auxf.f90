function dnrm2_c(n, x, incx) bind(c)
  use iso_c_binding

  integer(c_int), value :: n, incx
  real(c_double)        :: x(n), dnrm2_c

  real(kind(1.d0)) :: dnrm2

  dnrm2_c = dnrm2(n, x(1), incx)

  return

end function dnrm2_c


function dnrmf_c(m, n, a, lda) bind(c)

  use iso_c_binding
  
  integer(c_int), value :: m, n, lda
  real(c_double)        :: a(lda,n), dnrmf_c

  real(kind(1.d0)) :: dlange, w

  
  dnrmf_c = dlange('F', m, n, a(1,1), lda, w)

end function dnrmf_c
