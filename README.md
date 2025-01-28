# Simulação de Autômato Celular Unidimensional com Fortran e Python

Este documento explica um conjunto de programas que simulam um autômato celular unidimensional usando Fortran para a simulação e Python para a visualização. O programa Fortran gera os dados da simulação, e o programa Python lê esses dados e gera um gráfico.

## Autômato Celular

Um autômato celular é um modelo computacional discreto que consiste em uma grade de células. Cada célula pode estar em um número finito de estados, e o estado de cada célula é atualizado de acordo com uma regra local que depende do estado de suas vizinhas. Autômatos celulares são frequentemente usados para modelar sistemas complexos.

## Código Fortran

O código Fortran é dividido em dois arquivos principais:

### 1. Módulo `automato.f90`

Este módulo define a lógica principal da simulação do autômato celular.
