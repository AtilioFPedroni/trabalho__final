module automato
  use rndgen_mod
  implicit none

  integer, parameter :: n= 50 ! Número de sítios no autômato
  real, parameter :: p = 0.01 ! Probabilidade de inverter o estado

  contains
    ! converte o número de regra para binário
    subroutine regra(n_regra, up)
      integer, intent(in) :: n_regra
      integer, intent(out) :: up(0:7)  !regra de 8 bits
      integer :: i

      do i = 0, 7
        up(i) = iand(ishft(n_regra, -i), 1)
      end do
    end subroutine regra

    subroutine passo(sitio, up, rng)
      use rndgen_mod
      implicit none
      integer, intent(inout) :: sitio(n)!itio é um vetor de N posições
      integer, intent(in) :: up(0:7) 
      type(rndgen), intent(inout) :: rng !gerador de números aleatórios

      integer :: esquerda, direita, vizi, i
      integer :: novo_sitio(n)
      real :: random_number

      novo_sitio = 0

      do i = 1, n!para cada sitio
       ! calcula os vizinhos
<<<<<<< HEAD
        esquerda = mod(i - 2 + n, n) + 1
=======
        esquerda = mod(i - 2 + n, n) + 1 
>>>>>>> refs/remotes/origin/main
        direita =  mod(i +0 + n, n) +1

        ! calcula o valor do vizinho(3bits)
        vizi = sitio(esquerda) * 4 + sitio(i) * 2 + sitio(direita)

        !aplicar a regra para determinar o novo valor do sitio
        novo_sitio(i) = up(vizi)

        !adiciona aleatoridade: inverte o valor do sitio com probabilidade p
        random_number = rng%rnd()
        if (random_number < p) then
          novo_sitio(i) = 1 - novo_sitio(i) !inverte o valor
        end if
      end do

      sitio = novo_sitio

      end subroutine passo

   end module automato
    