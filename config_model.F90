module config_model

  implicit none; private

  type, public :: config_type
    integer :: ni !< Number of elements in the i-direction
    integer :: nj !< Number of elements in the i-direction
  end type config_type

  public config_model_init

  contains

  subroutine config_model_init( model_CS, tracer )
    type(config_type),                 intent(inout) :: model_CS !< Model configuration structure
    real, dimension(:,:), allocatable, intent(  out) :: tracer   !< Tracer array

    integer :: ni, nj
    integer :: namunit
    integer ::  jj
    integer :: open_status

    NAMELIST/domain/ ni, nj

    ! Set default namelist values
    ni = 5
    nj = 5

    open( unit=namunit, file = "model.nml", form = 'FORMATTED', status = 'OLD', access = 'SEQUENTIAL', &
          iostat = open_status )

    if (open_status /= 0) then
      stop 'Cannot open namelist model.nml'
    endif

    read(namunit,domain)

    ! Overwrite model defaults with values from namelist
    model_CS%ni = ni
    model_CS%nj = nj

    ! Finish initialization
    allocate(tracer(model_CS%ni,model_CS%nj))

    tracer(:,:) = 0.

    do jj = 1,model_CS%nj
      tracer(1,jj) = 1.
    enddo

  end subroutine config_model_init

end module config_model
