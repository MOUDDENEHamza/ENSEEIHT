! This file is provided as part of the "projet long" for the "Calcul Scientifique et Analyse de Données" course
! at INP-ENSEEIHT
! Date: 02/2019
! Authors: P. Amestoy, P. Berger, A. Buttari, Y. Diouane, S. Gratton, R. Guivarch, F.H. Rouet, E. Simon
!
! This file contains the implementation of
! - one routine for computing the eigenpairs of a symmetric matrix with the subspace iteration method 
!   with Rayleigh-Ritz projection
!
!--------------------------------------------------------------------------------------------------------------------
!
!! subspace_iter_v1
! -----------------
!
! routine that computes a certain amount of eigenvalues and eigenvectors of a matrix A
! using the subspace iteration method with Rayleigh-Ritz projection (v1)
!
! ..Input arguments
!    n : integer, size of the matrix A
!    m : integer, size of the searched subspace
!    a : double precision matrix
!
!    percentage : double precision, fraction of the trace we would like to obtain
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
!    n_ev : integer, the number of computed eigenvalues
!    acc_ev : double precision vector, accuracy for each eigenvalues
!    it_ev : integer vector, number of iterations for each eigenvalues
!
!    ierr : integer, indicates how the routine ends
!           O : OK
!           1 : the maximum number of eigenvalues is reached before obtaining the percentage (WARNING)
!          -1 : inconsistancy of the values of the arguments (ERROR)
!          -2 : allocation problem (ERROR)
!          -3 : maxit reached (ERROR)
!          -4 : problem in dsyev (ERROR)
!-------------------------------------------------------------------------------------------------------------------
  subroutine subspace_iter_v1(n, m, a, percentage, maxit, eps, v, w, n_ev, acc_ev, it_ev, ierr)
    implicit none
    !! the subspace dimensions
    integer,          intent(in)                     :: n, m
    !! the target matrix                              
    double precision, dimension(n, n), intent(in)    :: a
    !! the percentage of the trace we want to obtain
    double precision, intent(in)                     :: percentage
    !! maximum # of iteration                         
    integer,          intent(in)                     :: maxit
    !! the tolerance for the stopping criterion       
    double precision, intent(in)                     :: eps
    !! the starting subspace. The computed eigenvectors will be
    !! returned in this array
    double precision, dimension(n, m), intent(inout) :: v
    !! the m dominant eigenvalues
    double precision, dimension(m), intent(out)      :: w
    !! number of computed eigenvalues
    integer,          intent(out)                    :: n_ev
    !! accuracy for each eigenvalues
    double precision, dimension(m),   intent(out)    :: acc_ev
    !!  number of iterations for each eigenvalues
    integer,          dimension(m),   intent(out)    :: it_ev
    !! a flag for signaling errors                    
    integer,          intent(out)                    :: ierr
                                                      
    ! external functions
    double precision, external                       :: dlange, ddot

    ! constants
    integer, parameter                               :: ione = 1
    double precision, parameter                      :: done = 1.d0, dzero = 0.d0, dmoins = -1.d0

    !! local variables                                
    integer                                          :: i, j
    double precision, allocatable, dimension(:,:)    :: y
    double precision, allocatable, dimension(:,:)    :: h, x
    double precision, allocatable, dimension(:)      :: aux_acc, w_aux, t
    double precision                                 :: trace, p_trace, eig_sum, normF_A
    integer                                          :: conv
    integer                                          :: k
    double precision                                 :: acc
    logical                                          :: ok
    double precision                                 :: beta
    !! the length of the workspace for dsyev
    integer                                          :: lwork
    !! the workspace                               
    double precision, allocatable, dimension(:)      :: work

    ierr = 0

    if(m.gt.n)then
       ierr = -1
       return
    end if

    lwork = m*m + 5*m + n*n
    allocate(y(n, m), h(m, m), x(m, m), w_aux(m), aux_acc(n), t(m), work(lwork), stat=ierr)
    if(ierr .ne. 0) then
      ierr = -2
      return
    end if

    trace = 0.d0
    do i = 1, n
      trace = trace + a(i,i)
    end do
    p_trace = percentage * trace
    eig_sum = 0.d0
 
    normF_A = dlange('f', n, n, a, n, work)

    it_ev = 0
    acc_ev = 0.D0
    n_ev = 0
    k = 0

    !! Initial set of orthonormal vectors
    call gram_schmidt(v, n, m, y)
    v = y

    do while((eig_sum .lt. p_trace) .and. (n_ev .lt. m) .and. (k .lt. maxit))

      k = k + 1
       
      !! A. Compute  y = a*v
      call dgemm('n', 'n', n, m, n, done, a, n, v, n, dzero, y, n)

      !! B. Orthonormalisation
      call gram_schmidt(y, n, m, v)

      !! C. Rayleigh-Ritz projection
      !!   1. H = V^T A V
      !!     Y = A V
      call dgemm('n','n', n, m, n, done, a, n, v, n, dzero, y, n)
      !!     H = V'*Y
      call dgemm('t', 'n', m, m, n, done, v, n, y, n, dzero, h, m) 
      !!   2. Spectral decomposition
      call dsyev('v', 'u', m, h, m, w_aux, work, lwork, ierr) 
      if( ierr .ne.0 )then
        write(*,'("Error in dsyev")')
        ierr = -4
        goto 999
      end if

      !! Sort in the decreasing order
      !! (we suppose that all the eigen values are positve)
      do i = 1, m
        t(i) = w_aux(m-i+1)
        x(:, i)  = h(:, m-i+1)
      end do

      !!   3. V = VX
      y = v
      call dgemm('n', 'n', n, m, m, done, y, n, x, m, dzero, v, n)

      !! D. Convergence analysis step
      conv = 0
      i = n_ev + 1
      !! the larger eigenvalue will converge more swiftly than 
      !! those corresponding to the smaller eigenvalue.
      !! for this reason, we test the convergence in the order 
      !! i=1,2,.. and stop with the first one to fail the test
      ok = .false.
      do while(.not. ok)
        if( i .gt. m) then
          ok = .true.
        else
          !!compute acc=norm(a*v(:,i) - v(:,i)*t(i),2)/lambda;
          !!--compute aux_acc=a*v(:,i) - v(:,i)*t(i)
          !!--compute acc=||aux_acc||/||a||
          aux_acc = v(:,i)
          beta = -t(i)
          call dgemv('n', n, n, done, a, n, v(1,i), ione, beta, aux_acc, ione)
          acc = sqrt(ddot(n, aux_acc, ione, aux_acc, ione))/normF_A
          ! write(*,*) i, acc

          if(acc.gt.eps) then
            ok = .true.
          else
            ! write(*,*) 'vector', i, 'converges', acc
            conv = conv + 1
            w(i) = t(i)
            acc_ev(i) = acc
            it_ev(i) = k
            eig_sum = eig_sum + w(i)
            i = i + 1
            if( eig_sum .ge. p_trace) ok = .true.
          end if
        end if
      end do

      n_ev = n_ev + conv
      !write(*,*) n_ev

    end do

    if(n_ev .eq. m) then 
      ierr = 1
    end if
    if(k .eq. maxit) then
      ierr = -3
    end if

999 continue
    deallocate(y, h, x, w_aux, aux_acc, t)
    write(*,*)
    
    return
  end subroutine subspace_iter_v1
