module checksums

  implicit none; private

  public checksum_2d

  contains

  integer function checksum_2d(array, ni, nj)
    real, dimension(:,:) :: array !< Array to be checksummed
    integer              :: ni    !< Number of columns in array
    integer              :: nj    !< Number of rows in array 

    integer, parameter :: xk = kind(array)  !< Kind type of x
    integer :: i,j
    
    checksum_2d = 0
    do i=1,ni; do j=1,nj

      checksum_2d = checksum_2d + popcnt(transfer(array(i,j),1_xk))
    enddo; enddo


  end function checksum_2d



end module checksums
