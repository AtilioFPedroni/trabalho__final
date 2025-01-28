module automato
  use, intrinsic :: iso_fortran_env, only: sp => real32, dp => real64, i4 => int32, i8 => int64
  implicit none

  integer(kind=i4), parameter :: n = 50  ! Número de sítios no autômato
  real(kind=dp), parameter :: p = 0.01_dp  ! Probabilidade de inverter o estado

  contains
    ! converte o número de regra para binário
    subroutine regra(n_regra, up)
      integer(kind=i4), intent(in) :: n_regra
      integer(kind=i4), intent(out) :: up(0:7)  !regra de 8 bits
      integer(kind=i4) :: i

      do i = 0, 7
        up(i) = iand(ishft(n_regra, -i), 1)
      end do
    end subroutine regra

    subroutine passo(sitio, up, rng)
      use rndgen_mod
      implicit none
      integer(kind=i4), intent(inout) :: sitio(n)  ! sitio é um vetor de N posições
      integer(kind=i4), intent(in) :: up(0:7)
      type(rndgen), intent(inout) :: rng ! gerador de números aleatórios

      integer(kind=i4) :: esquerda, direita, vizi, i
      integer(kind=i4) :: novo_sitio(n)
      real(kind=dp) :: random_number

      novo_sitio = 0

      do i = 1, n  ! para cada sitio
        ! calcula os vizinhos
        esquerda = mod(i - 2 + n, n) + 1
        direita = mod(i + 0 + n, n) + 1

        ! calcula o valor do vizinho (3 bits)
        vizi = sitio(esquerda) * 4 + sitio(i) * 2 + sitio(direita)

        ! aplicar a regra para determinar o novo valor do sitio
        novo_sitio(i) = up(vizi)

        ! adiciona aleatoriedade: inverte o valor do sitio com probabilidade p
        random_number = rng%rnd()
        if (random_number < p) then
          novo_sitio(i) = 1 - novo_sitio(i)  ! inverte o valor
        end if
      end do

      sitio = novo_sitio

    end subroutine passo
  end module automato