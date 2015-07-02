!---------------------------------------------------------------------------------------------------!
! Program to simulate temperature programmed desorption using 2 models                              !
!    a) No inter-adsorbate interactions (only adsorption enthalpy)                                  !
!    b) Adsorption enthalpy and quadratic inter-adsorbate interactions                              !
!                                                                                                   !
! Inputs : Initial surface coverage                                                                 !
!          Initial and final temperatures (scanning range)                                          !
!          heating rate                                                                             !
!          desorption rate constant                                                                 !
!          adsorption energy                                                                        !
!          inter-adsorbate interaction energy                                                       !
!---------------------------------------------------------------------------------------------------!

program tpd_integrate

  implicit none

  ! Physical parameters
  real*8, parameter :: A = 1E13                ! Desorption constant k_des = 1E13 s^-1
  real*8, parameter :: B = 8819.43d0           ! 0.76 eV/kB = 8819.43 K
  real*8, parameter :: C = 6498.53d0           ! 0.56 eV/kB = 6498.53 K

  ! Modeling parameters
  real*8, parameter :: init_coverage = 0.45    ! in ML
  real*8, parameter :: init_temp = 120         ! in K
  real*8, parameter :: final_temp = 400        ! in K
  real*8, parameter :: heating_rate = 8        ! in K/s
  real*8, parameter :: timestep = 0.01         ! in s

  ! Variables
  real*8 :: temp                               ! Current temperature
  integer :: int_temp                          ! Integer form of current temperature for looping
  real*8 :: theta, dtheta_dT                   ! Coverage and its temperature detivative for model (a)
  real*8 :: theta_2, dtheta_dT_2               ! Coverage and its temperature detivative for model (b)

  ! Initialize coverage values
  theta = init_coverage
  theta_2 = init_coverage

  ! Clear existing output file (if any)
  call system("rm -f h2s-tpd.data")

  ! Open output file
  open(unit = 777, file = 'h2s-tpd.data', status = 'new')

  do int_temp = int(init_temp*10000), int(final_temp*10000), int(heating_rate*timestep*10000)
     temp = int_temp/10000d0

     dtheta_dT = (A/heating_rate) * exp(0-(B/temp)) * theta                    !
     theta = theta - (dtheta_dT*heating_rate*timestep)                         ! For model (a)

     dtheta_dT_2 = (A/heating_rate) * exp(0-((B-(C*theta_2))/temp)) * theta_2  !
     theta_2 = theta_2 - (dtheta_dT_2*heating_rate*timestep)                   ! For model (b)

     ! Make sure that surface coverage does not drop below zero.
     ! Otherwise the program tries to desorb molecules from a surface that has negative coverage.
     if (theta < 0) theta = 0.0d0
     if (theta_2 < 0) theta_2 = 0.0d0

     write(777,*) temp, dtheta_dT, dtheta_dT_2

  end do

  ! Close output files
  close(777)


end program tpd_integrate

