# Simulação de Autômato Celular Unidimensional com Fortran e Python

Este documento explica um conjunto de programas que simulam um autômato celular unidimensional usando Fortran para a simulação e Python para a visualização. O programa Fortran gera os dados da simulação, e o programa Python lê esses dados e gera um gráfico.

## Autômato Celular

Um autômato celular é um modelo computacional discreto que consiste em uma grade de células. Cada célula pode estar em um número finito de estados, e o estado de cada célula é atualizado de acordo com uma regra local que depende do estado de suas vizinhas. Autômatos celulares são frequentemente usados para modelar sistemas complexos.

# Implementação do Autômato Celular em Fortran

## Estrutura Modular
- **`rndgen_mod`**: Geração de números aleatórios.  
- **`automato`**: Lógica do autômato celular.  
- **`main.f90`**: Coordena entrada, saída e lógica principal.

## Autômato Celular
- **Espaço**: Representado por um array unidimensional (`lattice`) de inteiros (0 ou 1).  
- **Tempo**: Avança de forma discreta em passos controlados por um loop `do`.  
- **Regras**: Subrotina `passo` calcula o próximo estado de cada célula com base na vizinhança e na regra binária.  
- **Condições de Contorno**: Espaço com bordas periódicas (células conectadas circularmente).

## Aleatoriedade
- A subrotina `passo` usa a função `rnd()` para inverter estados com probabilidade `p`, garantindo variação estocástica entre execuções.

## Saída
- Os estados do autômato são salvos em `automato_data.dat`, com:
  - `*` para células no estado 1.
  - Espaços em branco para células no estado 0.

## Recursos do Fortran
- **Arrays**: Representam as células.  
- **Loops `do`**: Controlam iterações.  
- **Subrotinas**: Estruturam lógica modular.  
- **Entrada/Saída**: Manipulação de dados com `print` e `write`.