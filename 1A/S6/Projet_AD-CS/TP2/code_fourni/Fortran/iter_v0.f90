! This file is provided as part of the "projet long" for the "Calcul Scientifique et Analyse de Données" course
! at INP-ENSEEIHT
! Date: 02/2019
! Authors: P. Amestoy, P. Berger, A. Buttari, Y. Diouane, S. Gratton, R. Guivarch, F.H. Rouet, E. Simon
!
! This file contains the implementation of
! - one routine for computing the eigenpairs of a symmetric matrix with the basic subspace iteration method
!   (TO BE DEVELOPPED DURING "TP2 projet")
!
!--------------------------------------------------------------------------------------------------------------------
!
!! subspace_iter_v0
! -----------------
!
! routine that computes a certain number of eigenvalues and eigenvectors of a matrix A
! using the subspace iteration method (v0)
!
! ..Input arguments
!    n : integer, size of the matrix A
!    m : integer, maximum number of searched eigenvalues
!    a : double precision matrix
!
!    maxit : integer, maximum number of iterations of the power method
!    eps : the tolerance for the stopping criterion of the power method
!
! ..Input/Output arguments
!    v : double precision matrix, (input) the starting subspace
!                                 (output) the eigenvectors corresponding
!                                          to the dominant eigenvalues
!
! ..Output arguments
!    w : double precision vector, the eigenvalues
!    acc : double precision vector, accuracy for the invariant subspace
!    it : integer vector, number of iterations of the method
!
!    ierr : integer, indicates how the routine ends
!           O : OK
!          -1 : inconsistancy of the values of the arguments (ERROR)
!          -2 : allocation problem (ERROR)
!          -3 : maxit reached (ERROR)
!          -4 : problem in dsyev (ERROR)
!--------------------------------------------------------------------------------------------------------------------
  subroutine subspace_iter_v0(n, m, a, maxit, eps, v, w, acc, it, ierr)
    implicit none
    !! the subspace dimensions
    integer,          intent(in)                     :: n, m
    !! the target matrix                              
    double precision, dimension(n, n), intent(in)    :: a
    !! maximum # of iteration                         
    integer,          intent(in)                     :: maxit
    !! the tolerance for the stopping criterion       
    double precision, intent(in)                     :: eps
    !! the m dominant eigenvalues
    double precision, dimension(m), intent(out)      :: w
    !! the starting subspace. The computed eigenvectors will be
    !! returned in this array
    double precision, dimension(n, m), intent(inout) :: v
    !! the returned accuracy                          
    double precision, intent(out)                    :: acc
    !! the number of iteration to converge            
    integer,          intent(out)                    :: it
    !! a flag for signaling errors                    
    integer,          intent(out)                    :: ierr
                                                      
    ! external functions
    double precision, external                       :: dlange

    ! constants
    integer, parameter                               :: ione = 1
    double precision, parameter                      :: done = 1.d0, dzero = 0.d0, dmoins = -1.d0

    !! local variables                                
    integer                                          :: i, j, k
    double precision, allocatable, dimension(:,:)    :: aux, y
    !! h, rayleigh-Ritz quotient ; x, eigenvectors of h
    double precision, allocatable, dimension(:,:)    :: h, x
    !! w_aux, eigenvalues computed by spectral decomposition subroutine DSYEV
    double precision, allocatable, dimension(:)      :: w_aux
    double precision, allocatable, dimension(:)      :: work
    integer                                          :: lwork
    double precision                                 :: normF_A


    ierr = 0

    if(m.gt.n)then
       ierr = -1
       return
    end if
    
    lwork = m*m + 5*m + n*n

    allocate(aux(n, m), y(n, m), h(m, m), x(m, m), w_aux(m), work(lwork), stat = ierr)
    if(ierr .ne. 0) then
      ierr = -2
      return
    end if

    normF_A = dlange('f', n, n, a, n, work)

    k = 0
    acc = 100*eps

    !! v is a set of orthonormal vectors 
    call gram_schmidt(v, n, m, y)
    v = y

    do while((acc .ge. eps) .and. (k .lt. maxit))

      k = k + 1

      !! Compute  y = a*v
      call dgemm('n', 'n', n, m, n, done, a, n, v, n, dzero, y, n)

      !! Compute  h = v'*y
      call dgemm('t', 'n', m, m, n, done, v, n, y, n, dzero, h, m)

      !! Compute the accuracy ||a*v - v*h||/||A|| == ||y - v*h||/||A||
      !! Compute  aux = y-v*h
      aux = y
      call dgemm('n', 'n', n, m, m, dmoins, v, n, h, m, done, aux, n)

      !! Compute acc = ||aux|| / ||A||
      acc = dlange('f', n, m, aux, n, work) / normF_A

      write(*,'(" IT:",i5," -- Accuracy is: ",es10.2,a)',advance='no') k, acc, char(13)
      !! V <- orthonormalization of y
      call gram_schmidt(y, n, m, v)

    end do

    if(acc .lt. eps) then
      ! compute the spectral decomposition of the Rayleigh quotient h
      call dsyev('v', 'u', m, h, m, w_aux, work, lwork, ierr) 
      if( ierr .ne.0 )then
        write(*,'("Error in dsyev")')
        ierr = -4
        goto 999
      end if

      !! Sort in the decreasing order (dsyev returns eigenvalues in ascending order)
      !! (we suppose that all the eigen values are positive)
      do i=1, m
        x(:, i) = h(:, m-i +1)
        w(i) = w_aux(m-i +1)
      end do

      !! v = v*x
      y = v
      call dgemm('n', 'n', n, m, m, done, y, n, x, m, dzero, v, n)

    else
      ierr = -3
    end if

999 continue
    deallocate(aux, y, h, x, w_aux, work)
    write(*,*)

    it = k
    
    return
  end subroutine subspace_iter_v0
