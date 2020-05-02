subroutine matgen(imat, a, n, info)
  implicit none

  real(kind(1.d0)), allocatable :: a(:,:)
  integer :: imat, n, info

  real(kind(1.d0)), allocatable :: work(:), d(:)
  character(len=3) :: path
  character :: type, dist
  integer :: kl, ku, mode
  real(kind(1.d0)) :: anorm, cndnum, rcondc
  integer :: iseed(4)
  real(kind(1.d0)), parameter :: done=1.d0, dmone=-1.d0
  
  !ehouarn
  integer :: i,j
  double precision :: eps, norme_f
  intrinsic epsilon 
  !ehouarn
  
  iseed = (/1988, 1989, 1990, 1991/)
  info  = 0
  path(1:1) = 'Double precision'
  path(2:3) = 'GE'

  select case(imat)
  case(1:11)
     call dlatb4( path, imat, n, n, type, kl, ku, anorm, mode, cndnum, dist )
     rcondc = 1.d0 / cndnum
     
     write(*,'("=======================")')
     ! write(*,'("Type  : ",a1)')type
     ! write(*,'("KL    : ",i4)')kl
     ! write(*,'("KL    : ",i4)')ku
     write(*,'("Anorm : ",es10.3)')anorm
     write(*,'("Cond  : ",es10.3)')cndnum
  write(*,'(" ")')
      
     allocate(a(n,n), work(3*n), d(n), stat=info)
     if(info .ne. 0) return
    
     call dlatms( n, n, dist, iseed, type, &
          & d, mode, cndnum, anorm, kl, ku, &
          & 'no packing', a, n, work, info )
     if(info .ne. 0) return
     
     deallocate(d, work, stat=info)
  case(12)
      !write(*,'("Generate matrix with bad determinant")')
      !info = 1  ! to remove when the generator is implemented 
      write(*,'("Generate numerically singular matrix ")')
      call dlatb4( path, 8, n, n, type, kl, ku, anorm, mode, cndnum, dist )
      rcondc = 1.d0 / cndnum
     
      write(*,'("=======================")')
      ! write(*,'("Type  : ",a1)')type
      ! write(*,'("KL    : ",i4)')kl
      ! write(*,'("KL    : ",i4)')ku
      write(*,'("Anorm : ",es10.3)')anorm
      write(*,'("Cond  : ",es10.3)')cndnum
      write(*,'(" ")')
      
      allocate(a(n,n), work(3*n), d(n), stat=info)
      if(info .ne. 0) return
    
      call dlatms( n, n, dist, iseed, type, &
          & d, mode, cndnum, anorm, kl, ku, &
          & 'no packing', a, n, work, info )
      if(info .ne. 0) return
      
      deallocate(d, work, stat=info)
      
      eps=epsilon(eps)
      a(:,1)=eps*a(:,1)
      if(n.gt.5)then
        i=(n+1)/2
        a(:,i)=eps*a(:,i)
      endif
      a(:,n)=eps*a(:,n)
      
  case default
     write(*,'("Wrong matrix id")')
     info = 1
  end select


  return
end subroutine matgen
   
