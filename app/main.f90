program automato_celular
  use automato
  use rndgen_mod
  implicit none

  integer :: n_regra, i, t, up(0:7)
  integer :: sitio(n)
  type(rndgen) :: rng
  integer :: seed_value
  integer :: unit_number

  unit_number = 10

  print *, "Digite o número da regra (0-255):"
  read*, n_regra

  !verifica se o n_regra está dentro do intervalo
  if (n_regra < 0 .or. n_regra > 255) then
    print *, "Número da regra inválido"
    stop
  end if

  print *, "Digite a semente para o gerador de números aleatórios:"
  read *, seed_value

  call rng%init(seed_value)

  !inicia o automato com um único sítio "vivo" (1) no meio

  sitio = 0
  sitio(n/2) = 1

  call regra(n_regra, up)

  open(unit_number, file='automato.dat', status='replace')

  do t = 1, n !para cada passo de tempo
    call print_sitio(sitio, unit_number)

    call passo(sitio, up, rng)

  end do

  close(unit=unit_number)

  print *, "Dados gravados no arquivo automato.dat"

contains

  subroutine print_sitio(sitio, unit_number)
    integer, intent(in) :: sitio(n)
    integer, intent(in) :: unit_number
    character(len=1) :: char
    integer :: i

    do i = 1, n
      if (sitio(i) == 1) then
        char = '*'
      else
        char = ' '
      end if
      write(unit_number, '(A)', advance='no') char
    end do

    write(unit_number,*)

    end subroutine print_sitio

end program automato_celular
      
      








































