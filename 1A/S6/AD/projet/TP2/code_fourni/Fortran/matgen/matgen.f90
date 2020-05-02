subroutine matgen(imat, a, lda, n, d, info)
  implicit none

  integer :: imat, n, lda, info
  real(kind(1.d0)) :: a(lda,n)
  real(kind(1.d0)) :: d(n)

  real(kind(1.d0)), allocatable :: work(:)
  character(len=3) :: path
  character :: type, dist, pack
  integer :: kl, ku, mode, i
  real(kind(1.d0)) :: anorm, cndnum, rcondc
  integer :: iseed(4)
  real(kind(1.d0)), parameter :: done=1.d0, dmone=-1.d0

  iseed = (/1988, 1989, 1990, 1991/)
  info  = 0
  path(1:1) = 'Double precision'
  path(2:3) = 'SY'

  select case(imat)
  case(1)
     dist   = 'U'  ! uniform distribution
     type   = 'P'  ! symmetric, positive-definite
     mode   = 0    ! use D
     cndnum = n    ! the condition number
     anorm  = n    ! the matrix norm
     kl     = n-1  ! upper bandwidth
     ku     = n-1  ! lower bandwidth
     pack   = 'N'  ! no pack
     !write(*,'("=======================")')
     !write(*,'("Dist  : ",a1)')dist
     !write(*,'("Type  : ",a1)')type
     !write(*,'("Mode  : ",i1)')mode
     !write(*,'("Anorm : ",es10.3)')anorm
     !write(*,'("Cond  : ",es10.3)')cndnum
     !write(*,'(" ")')
      
     allocate(work(3*n), stat=info)
     if(info .ne. 0) return
    
     do i=1,n
        d(i) = n-i+1
     end do

     call dlatms( n, n, dist, iseed, type, &
          & d, mode, cndnum, anorm, kl, ku, &
          & pack, a, n, work, info )
     
     deallocate(work, stat=info)

     if(info .ne. 0) return

  case(2)
     dist   = 'N'  ! uniform distribution
     type   = 'P'  ! symmetric, positive-definite
     mode   = 5    ! random numbers in the range
                   ! ( 1/COND , 1 ) such that their logarithms
                   ! are uniformly distributed.
     cndnum = 1e10 ! the condition number
     anorm  = 1.d0 ! the matrix norm
     kl     = n-1  ! upper bandwidth
     ku     = n-1  ! lower bandwidth
     pack   = 'N'  ! no pack
     !write(*,'("=======================")')
     !write(*,'("Dist  : ",a1)')dist
     !write(*,'("Type  : ",a1)')type
     !write(*,'("Mode  : ",i1)')mode
     !write(*,'("Anorm : ",es10.3)')anorm
     !write(*,'("Cond  : ",es10.3)')cndnum
     !write(*,'(" ")')
      
     allocate(work(3*n), stat=info)
     if(info .ne. 0) return
    
     call dlatms( n, n, dist, iseed, type, &
          & d, mode, cndnum, anorm, kl, ku, &
          & pack, a, n, work, info )
     if(info .ne. 0) return

     call sort(d, n)
     
     deallocate(work, stat=info)

  case(3)
     dist   = 'N'  ! uniform distribution
     type   = 'P'  ! symmetric, positive-definite
     mode   = 3    ! D(I)=COND**(-(I-1)/(N-1))
     cndnum = 1e5  ! the condition number
     anorm  = 100.d0 ! the matrix norm
     kl     = n-1  ! upper bandwidth
     ku     = n-1  ! lower bandwidth
     pack   = 'N'  ! no pack
     !write(*,'("=======================")')
     !write(*,'("Dist  : ",a1)')dist
     !write(*,'("Type  : ",a1)')type
     !write(*,'("Mode  : ",i1)')mode
     !write(*,'("Anorm : ",es10.3)')anorm
     !write(*,'("Cond  : ",es10.3)')cndnum
     !write(*,'(" ")')
      
     allocate(work(3*n), stat=info)
     if(info .ne. 0) return
    
     call dlatms( n, n, dist, iseed, type, &
          & d, mode, cndnum, anorm, kl, ku, &
          & pack, a, n, work, info )
     if(info .ne. 0) return
     
     deallocate(work, stat=info)

  case(4)
     dist   = 'N'  ! uniform distribution
     type   = 'P'  ! symmetric, positive-definite
     mode   = 4    ! D(i)=1 - (i-1)/(N-1)*(1 - 1/COND)
     cndnum = 1e2  ! the condition number
     anorm  = 1000.d0 ! the matrix norm
     kl     = n-1  ! upper bandwidth
     ku     = n-1  ! lower bandwidth
     pack   = 'N'  ! no pack
     !write(*,'("=======================")')
     !write(*,'("Dist  : ",a1)')dist
     !write(*,'("Type  : ",a1)')type
     !write(*,'("Mode  : ",i1)')mode
     !write(*,'("Anorm : ",es10.3)')anorm
     !write(*,'("Cond  : ",es10.3)')cndnum
     !write(*,'(" ")')
      
     allocate(work(3*n), stat=info)
     if(info .ne. 0) return
    
     call dlatms( n, n, dist, iseed, type, &
          & d, mode, cndnum, anorm, kl, ku, &
          & pack, a, n, work, info )
     if(info .ne. 0) return
     
     deallocate(work, stat=info)
  case default
     write(*,'("Wrong matrix id")')
     info = 1
  end select

  !write(*,'("Matrix generated")')

  return
end subroutine matgen
   

! --------------------------------------------------------------------
! SUBROUTINE  Sort():
!    This subroutine receives an array x() and sorts it into descending
! order.
! --------------------------------------------------------------------

SUBROUTINE  Sort(x, Size)
  IMPLICIT  NONE
  DOUBLE PRECISION, DIMENSION(Size), INTENT(INOUT) :: x
  INTEGER, INTENT(IN)                   :: Size
  INTEGER                               :: i
  INTEGER                               :: Location
  DOUBLE PRECISION                      :: Temp


  DO i = 1, Size-1 
    Location = FindMaximum(x, i, Size) 
    Temp = x(i)
    x(i) = x(Location)
    x(Location) = Temp
  END DO

  CONTAINS

    INTEGER FUNCTION  FindMaximum(x, Start, End)
      IMPLICIT  NONE
      DOUBLE PRECISION, DIMENSION(:), INTENT(IN) :: x
      INTEGER, INTENT(IN)                :: Start, End
      DOUBLE PRECISION                   :: Maximum
      INTEGER                            :: Location
      INTEGER                            :: i

      Maximum  = x(Start)
      Location = Start
      DO i = Start+1, End
        IF (x(i) > Maximum) THEN
          Maximum  = x(i)
          Location = i
        END IF
      END DO
      FindMaximum = Location            ! return the position
    END FUNCTION  FindMaximum

END SUBROUTINE  Sort
