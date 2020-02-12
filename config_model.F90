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
    
    integer ::  jj

    model_CS%ni = 5
    model_CS%nj = 5
    allocate(tracer(model_CS%ni,model_CS%nj))
    
    tracer(:,:) = 0.

    do jj = 1,model_CS%nj
      tracer(1,jj) = 1.
    enddo

  end subroutine config_model_init

end module config_model
