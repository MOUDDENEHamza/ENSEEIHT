! This file is provided as part of the "projet long" for the "Calcul Scientifique et Analyse de Données" course
! at INP-ENSEEIHT
! Date: 02/2018
! Authors: P. Amestoy, P. Berger, A. Buttari, Y. Diouane, S. Gratton, R. Guivarch, F.H. Rouet, E. Simon
!
! This file contains the driver for testing the developed methods
! 
program main
  implicit none
  integer                       :: ierr, m, n, maxit, lwork, i, j, it, n_ev, disp, version, imat, p
  double precision, allocatable :: a(:,:), work(:)
  double precision, allocatable :: w(:), w_aux(:), e_vect(:,:), u(:)
  double precision, allocatable :: e_vals(:), res_ev(:)
  integer, allocatable          :: it_ev(:)
  integer                       :: t_start, t_end, t_rate, len
  double precision              :: time, eps, res, percentage, dummy, accuracy
  double precision, parameter   :: done = 1.d0, dzero = 0.d0
  character (len=20)            :: version_str
  double precision              :: normF_A, workf(1)
  
  ! external functions
  double precision, external    :: dlange, dnrm2

  !! parameter initializations 
  ierr = 0

  !! THOSE ARE THE ONLY VALUES YOU ARE ALLOWED TO MODIFY IN THIS FILE
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  maxit = 10000
  eps = 1d-15
  p = 1
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  call parse_args(n, m, version, imat, percentage, disp)

  allocate(a(n,n), e_vals(n), stat=ierr)
  if(ierr .ne.0) then
    write(*,'("Cannot allocate data, Input matrix is too big")')
    stop
  endif
  
  ! Generate the matrix
  call matgen(imat, a, n, n, e_vals, ierr)

  if(disp >= 1) then
     write(*,'(" ")')
     write(*,'("Here are the first ",i2," eigenvalues: ")', advance='no')min(n,10)
     do i=1, min(n,10)
        write(*,'(f10.3,x)',advance='no') e_vals(i)
     end do
     write(*,'(" ")')

     ! print the spectrum of the matrix in 'spectrum.txt'
     open(20, file='spectrum.txt')
     do i = 1,n
       write(20,'(f10.3,x)') e_vals(i)
     end do
     close(20)
  end if

  write(version_str, "(I2)") version

  normF_A = dlange('f', n, n, a, n, workf)

  write(*,*)
  select case(version)

   case(10)

     write(*,'("Calling LAPACK DSYEV on A")')
     
     lwork=2*max(1,3*n+n,5*n)
     allocate(w(n), work(lwork), e_vect(n,n), w_aux(n), stat=ierr)
     if(ierr .ne.0) then
        write(*,'("Cannot allocate data, Input matrix is too big for the LAPACK version")')
        stop
     endif

     call system_clock(t_start)
     call dsyev('v', 'u', n, a, n, w_aux, work, lwork, ierr)
      do i=1, n
        e_vect(:, i) = a(:, n-i +1)
        w(i) = w_aux(n-i +1)
      end do
     call system_clock(t_end, t_rate)
     time = real(t_end-t_start)/real(t_rate)

     write(*,'("End of LAPACK DSYEV")')
     
     m = 10
     n_ev   = m

  case(11)
     
    write(*,'("Calling the basic deflated power method")')

     allocate(w(m), e_vect(n, m), it_ev(m), res_ev(m), stat=ierr)
     if(ierr .ne.0) then
        write(*,'("Cannot allocate data.")')
        stop
     endif

     call system_clock(t_start)
     call deflated_power_method(n, m, a, percentage, maxit, eps, w, e_vect, n_ev, res_ev, it_ev, ierr)
     call system_clock(t_end, t_rate)
     time = real(t_end-t_start)/real(t_rate)

     write(*,'("End of the basic deflated power method")')

     select case(ierr)
     case(-3) 
       write(*,*) "maxit reached : ERROR"
       write(*,*) "hints: increase maxit or decrease eps in main.f90"
     case(-2)
       write(*,*) "allocation problem : ERROR"
     case(-1)
       write(*,*) "parameters consistancy : ERROR"
     case(0)
       write(*,'(" ")')
       write(*,'("percentage ", f5.2, " reached with ", i4, " eigenvalues")') percentage, n_ev
     case(1)
       write(*,'("percentage ", f5.2, " NOT reached with ", i4, " eigenvalues")') percentage, n_ev
     end select
        
   case(0)

     write(*,'("Calling the basic subspace iteration method v0")')

     allocate(w(m), e_vect(n, m), it_ev(m), stat=ierr)
     if(ierr .ne.0) then
        write(*,'("Cannot allocate data.")')
        stop
     endif

     call random_number(e_vect)

     call system_clock(t_start)
     call subspace_iter_v0(n, m, a, maxit, eps, e_vect, w, res, it, ierr)
     call system_clock(t_end, t_rate)
     time = real(t_end-t_start)/real(t_rate)
     write(*,'("End of the basic subspace iteration method")')

     select case(ierr)
     case(-4)
       write(*,'("Problem in dsyev : ERROR")')
     case(-3) 
       write(*,*) "maxit reached : ERROR"
       write(*,*) "hints: increase maxit or decrease eps in main.f90"
     case(-2)
       write(*,*) "allocation problem : ERROR"
     case(-1)
       write(*,*) "parameters consistancy : ERROR"
     case(0)
       write(*,'(" ")')
       write(*,'(i4, " Eigenvalues computed in ", i10, " iterations with a residual of", e10.3 )') m, it, res
     end select

     n_ev = m

   case(1)

     write(*,'("Calling the subspace iteration method v1")')

     allocate(w(m), e_vect(n, m), it_ev(m), res_ev(m), stat=ierr)
     if(ierr .ne.0) then
        write(*,'("Cannot allocate data.")')
        stop
     endif

     call random_number(e_vect)

     call system_clock(t_start)
     call subspace_iter_v1(n, m, a, percentage, maxit, eps, e_vect, w, n_ev, res_ev, it_ev, ierr)
     call system_clock(t_end, t_rate)
     time = real(t_end-t_start)/real(t_rate)

     write(*,'("End the subspace iteration method v1")')
     
     select case(ierr)
     case(-4)
       write(*,'("Problem in dsyev : ERROR")')
     case(-3) 
       write(*,*) "maxit reached : ERROR"
       write(*,*) "hints: increase maxit or decrease eps in main.f90"
     case(-2)
       write(*,*) "allocation problem : ERROR"
     case(-1)
       write(*,*) "parameters consistancy : ERROR"
     case(0)
       write(*,'(" ")')
       write(*,'("percentage ", f5.2, " reached with ", i4, " eigenvalues")') percentage, n_ev
     case(1)
       write(*,'("percentage ", f5.2, " NOT reached with ", i4, " eigenvalues")') percentage, n_ev
     end select

     write(*,*) 'n_ev =', n_ev

  case(2)

     write(*,'("Calling the subspace iteration method v2")')

     allocate(w(m), e_vect(n, m), it_ev(m), res_ev(m), stat=ierr)
     if(ierr .ne.0) then
        write(*,'("Cannot allocate data.")')
        stop
     endif

     call random_number(e_vect)

     call system_clock(t_start)
     call subspace_iter_v2(n, m, a, p, percentage, maxit, eps, e_vect, w, n_ev, res_ev, it_ev, ierr)
     call system_clock(t_end, t_rate)
     time = real(t_end-t_start)/real(t_rate)

     write(*,'("End the subspace iteration method v2")')
     
     select case(ierr)
     case(-4)
       write(*,'("Problem in dsyev : ERROR")')
     case(-3) 
       write(*,*) "maxit reached : ERROR"
       write(*,*) "hints: increase maxit or decrease eps in main.f90"
     case(-2)
       write(*,*) "allocation problem : ERROR"
     case(-1)
       write(*,*) "parameters consistancy : ERROR"
     case(0)
       write(*,'(" ")')
       write(*,'("percentage ", f5.2, " reached with ", i4, " eigenvalues")') percentage, n_ev
     case(1)
       write(*,'("percentage ", f5.2, " NOT reached with ", i4, " eigenvalues")') percentage, n_ev
     end select

     write(*,*) 'n_ev =', n_ev

     
  case(3)

     write(*,'("Calling the subspace iteration method v3")')

     allocate(w(m), e_vect(n, m), it_ev(m), res_ev(m), stat=ierr)
     if(ierr .ne.0) then
        write(*,'("Cannot allocate data.")')
        stop
     endif

     call random_number(e_vect)

     call system_clock(t_start)
     ! CHANGE to v3 when you are ready to test this version
     call subspace_iter_v2(n, m, a, p, percentage, maxit, eps, e_vect, w, n_ev, res_ev, it_ev, ierr)
     call system_clock(t_end, t_rate)
     time = real(t_end-t_start)/real(t_rate)

     write(*,'("End the subspace iteration method v3")')
     
     select case(ierr)
     case(-4)
       write(*,'("Problem in dsyev : ERROR")')
     case(-3) 
       write(*,*) "maxit reached : ERROR"
       write(*,*) "hints: increase maxit or decrease eps in main.f90"
     case(-2)
       write(*,*) "allocation problem : ERROR"
     case(-1)
       write(*,*) "parameters consistancy : ERROR"
     case(0)
       write(*,'(" ")')
       write(*,'("percentage ", f5.2, " reached with ", i4, " eigenvalues")') percentage, n_ev
     case(1)
       write(*,'("percentage ", f5.2, " NOT reached with ", i4, " eigenvalues")') percentage, n_ev
     end select

     write(*,*) 'n_ev =', n_ev


   case default
     write(*,'("Version is not valid or yet implemented")')

   end select


   if(ierr.ge.0) then
     if(disp >= 1) then
       write(*,'(" ")')
       write(*,'(" ")')
       write(*,'(i4, " First eigenvalues ")') min(n_ev,m)
       write(*,*) "========================="
       do i=1, min(n_ev, m)
         select case(version)
           case(10)
             write(*,'("Eigenvalue ",i4,":",f10.3)') i, w(i)
           case(11)  
             write(*,'("Eigenvalue ",i4,":",f10.3, "   accuracy :", e10.3, "   number of iterations : ",i10)') &
            i, w(i), res_ev(i), it_ev(i)
           case(0)
              write(*,'("Eigenvalue ",i4,":",f10.3)') i, w(i)
           case(1)  
             write(*,'("Eigenvalue ",i4,":",f10.3, "   accuracy :", e10.3, "   number of iterations : ",i10)') &
            i, w(i), res_ev(i), it_ev(i)
           case(2)  
             write(*,'("Eigenvalue ",i4,":",f10.3, "   accuracy :", e10.3, "   number of iterations : ",i10)') &
            i, w(i), res_ev(i), it_ev(i)
         end select
       end do
        write(*,'(" ")')
     end if

     if(disp >= 2) then
       ! check the accuracy ||A*V_i - Lambda_i*V_i||/|Lambda_i| for each pair

       allocate(u(n))
       ! A is lost with DSYEV and power
       if(version >= 10) then
         call matgen(imat, a, n, n, e_vals, ierr)
       end if

       write(*,*)  '||A*V_i - Lambda_i*V_i||/||A||'
       write(*,*)  "=============================="
       do i = 1, min(n_ev, m)
         call dgemv('n', n, n, done, a, n, e_vect(1,i), 1, dzero, u, 1)
         u = u - w(i)*e_vect(:,i)
         write(*, '("Eigenvalue ",i4,":",e10.3)') i, dnrm2(n, u, 1) / normF_A
       end do
       deallocate(u)

       if(disp == 3) then
         ! save eigenvectors in a file
         open(20, file="eigenvectors_"//trim(adjustl(version_str))//".txt")
         do i = 1, n
           do j = 1, min(n_ev, m)
             write(20,'(f10.6,x)', advance='no') e_vect(i, j)
           end do
           write(20, *) ''
         end do
         close(20)
       end if

     end if

  else
     write(*,'("An error was found. IERR=",i4)')ierr
  end if

  deallocate(a, w, stat=ierr)

  if(allocated(e_vect)) deallocate(e_vect, stat=ierr)
  if(allocated(w_aux)) deallocate(w_aux, stat=ierr)
  if(allocated(work)) deallocate(work, stat=ierr)
  if(allocated(res_ev)) deallocate(res_ev, stat=ierr)
  if(allocated(it_ev)) deallocate(it_ev, stat=ierr)

  write(*,*) 
  write(*,*) "=================================="
  write(*,*) 'Time = ', time
  write(*,*) "=================================="

  stop
  
end program main
