! This file is provided as part of the "projet long" for the "Calcul Scientifique et Analyse de Données" course
! at INP-ENSEEIHT
! Date: 02/2019
! Authors: P. Amestoy, P. Berger, A. Buttari, Y. Diouane, S. Gratton, R. Guivarch, F.H. Rouet, E. Simon
!
! This file contains the implementation of
! - one routine for computing the eigenpairs of a symmetric matrix with the deflated power method
!--------------------------------------------------------------------------------------------------------------------

!! deflated_power_method
! ---------------------
!
! routine that computes a certain amount of eigenvalues and eigenvectors of a matrix A
! using the deflated power method
!
! ..Input arguments
!    n : integer, size of the matrix A
!    m : integer, maximum number of searched eigenvalues
!    a : double precision matrix
!
!    percentage : double precision, fraction of the trace we would like to obtain
!
!    maxit : integer, maximum number of iterations of the power method
!    eps : the tolerance for the stopping criterion of the power method

! ..Output arguments
!    w : double precision vector, the eigenvalues
!    v : double precision matrix, the corresponding eigenvectors
!    n_ev : integer, the number of computed eigenvalues
!    acc_ev : double precision vector, residual for each eigenvalues
!    it_ev : integer vector, number of iterations for each eigenvalues
!
!    ierr : integer, indicates how the routine ends
!           O : OK
!           1 : the maximum number of eigenvalues is reached before obtaining the percentage (WARNING)
!          -1 : inconsistancy of the values of the arguments (ERROR)
!          -2 : allocation problem (ERROR)
!          -3 : maxit reached (ERROR)
!--------------------------------------------------------------------------------------------------------------------
  subroutine deflated_power_method(n, m, a, percentage, maxit, eps, w, v, n_ev, acc_ev, it_ev, ierr)
    implicit none
    !! the subspace dimensions
    integer,          intent(in)                            :: n, m
    !! the target matrix (symetric)
    double precision, dimension(n,n), intent(in)            :: a
    !! the percentage of the trace we want to obtain
    double precision, intent(in)                            :: percentage
    !! maximum # of iteration
    integer,          intent(in)                            :: maxit
    !! the tolerance for the stopping criterion
    double precision, intent(in)                            :: eps
    !! the m dominant eigenvalues
    double precision, dimension(m),   intent(out)           :: w
    !! the m associated eigenvectors
    double precision, dimension(n, m),   intent(out)        :: v
    !! number of computed eigenvalues
    integer,          intent(out)                           :: n_ev
    !! residual for each eigenvalues
    double precision, dimension(m),   intent(out)           :: acc_ev
    !!  number of iterations for each eigenvalues
    integer,          dimension(m),   intent(out)           :: it_ev
    !! a flag for signaling errors
    integer,          intent(out)                           :: ierr

    ! external functions
    double precision, external                              :: dnrm2   ! two-norm
    double precision, external                              :: ddot    ! scalar product
    double precision, external                              :: dlange 
   
    ! constants
    integer, parameter                                      :: ione = 1
    double precision, parameter                             :: done = 1.d0, dzero = 0.d0

    ! local variables
    integer                                                 :: i, j, conv, k
    double precision, allocatable, dimension(:)             :: y ! work vector
    double precision                                        :: beta, moins_beta
    double precision                                        :: norme, normeA
    double precision                                        :: trace, eig_sum
    double precision                                        :: alpha

    ierr = 0
    !! check the parameter consistancy
    if((percentage.gt.1d0)  .or. (percentage.lt.0d0)) then
       ierr = -1
       return
    end if
    if(m.gt.n) then
       ierr = -1
       return
    end if
    
    !! compute the trace
    trace = 0.d0
    do i=1, n
       trace = trace + a(i,i)
    end do

    !! work vector
    allocate(y(n), stat=ierr)
    if(ierr .ne. 0) then
      ierr = -2
      return
    end if

    eig_sum = 0.D0
    n_ev = 0
    i = 0

    do while((i.lt.m).and.(eig_sum/trace.le.percentage))

      i = i + 1

      !! Frobenius Norm of A
      normeA = dlange('f', n, n, a, n, y )

      !! power method

      k = 0
      conv = 0
      
      !! x_0 random
      call random_number(v(:,i))

      do while((conv.eq.0).and.(k.lt.maxit))

        !! y_k+1 = A*x_k
        call dgemv('n', n, n, done, a, n, v(1,i), ione, dzero, y, ione)
      
        !! x_k+1 = y_k+1 / ||y_k+1||
        norme = dnrm2(n, y, ione)
        v(:,i) = y/norme
        
        !! beta_k+1 = x-k+1^T A X_k+1
        call dgemv('n', n, n, done, a, n, v(1,i), ione, dzero, y, ione)
        beta = ddot(n, v(1,i), ione, y, ione)
        moins_beta = - beta

        !! norm introduced in 2.1.2
        !! ||beta*x_k - A*x_k||/||A|| < eps
        ! v(:,i) contains x_k
        ! y contains A*x_k
        ! y <- y - beta * v(:,i)
        call daxpy(n, moins_beta, v(1,i), ione, y, ione)
        norme = dnrm2(n, y, ione)/normeA

        if(norme.le.eps) conv = 1

        k = k + 1
        write(*,'(" IT:",i5," -- Accuracy is: ",es10.2,a)',advance='no') k, norme, char(13)

      end do

      if(k.ge.maxit) then
        ierr = -3
        return
      end if

      w(i) = beta
      it_ev(i) = k
      acc_ev(i) = norme
      eig_sum = eig_sum + w(i)
      write(*,'("Eigenvalue ",i4,":",f10.3)')  i, w(i)

      !! deflation
      !! A <- A - beta * v(:,i)^T * v(:,i)
      if(i.lt.n) then
        ! BLAS routine DGER
        ! A <- - beta * v(:,i)^T * v(:,i) + A
        call DGER(n, n, moins_beta, v(1,i), ione, v(1,i), ione, A, n)
      end if

    end do

    !! number max of eigenvalues reached
    if(eig_sum/trace.le.percentage) ierr = 1

    n_ev = i

    deallocate(y)
    
    return

  end subroutine deflated_power_method
