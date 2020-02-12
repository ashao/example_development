program test_problem

  use config_model, only : config_type, config_model_init
  use checksums,    only : checksum_2d

  implicit none 

  type(config_type) :: model_CS
  real, dimension(:,:), allocatable :: tracer

  call config_model_init( model_CS, tracer ) 
  write(*,'(I3)') checksum_2d(tracer, model_CS%ni, model_CS%nj)

end program test_problem

