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

# Implementação Gráfica no Python

## Função `ler_dados(filename)`
Lê os dados de um arquivo e os prepara para visualização, convertendo `*` (células vivas) em 1 e espaços (células mortas) em 0.  
- Ajusta o tamanho das linhas e retorna um array NumPy bidimensional.  
- Importante para garantir a correta formatação dos dados para análise.

## Função `plotar_dados(data, n_regra, p, seed_value)`
Gera um gráfico visual da evolução do autômato celular, facilitando a análise dos padrões criados pela regra e pela aleatoriedade.

## Execução Principal
1. Define o arquivo de entrada.  
2. Lê os dados com `ler_dados()`.  
3. Configura parâmetros (`n_regra`, `p`, `seed_value`).  
4. Cria o gráfico com `plotar_dados()`.

## Interpretação do Gráfico
- **Eixo Vertical**: Representa o tempo (linhas mais altas são passos iniciais).  
- **Eixo Horizontal**: Representa as células (cada coluna é uma célula).  
- **Cores**: Preto (0, morto) e branco (1, vivo).  

### Padrões Observados
- **Início**: Ponto central vivo.  
- **Evolução**: Regras determinam a propagação dos padrões.  
- **Aleatoriedade**: Introduz desvios e irregularidades.  

O gráfico combina regras fixas e aleatoriedade, revelando padrões dinâmicos e complexos.


# Valores para Regra e Semente

## Regra
- Número inteiro entre **0 e 255**, definindo as transições do autômato.  
- Exemplos de padrões:
  - **30**: Padrões caóticos.  
  - **90**: Triângulos simétricos.  
  - **110**: Complexos e caóticos.  
  - **184**: Mudanças regulares.  

## Semente
- Qualquer número inteiro.  
- Determina a sequência aleatória, afetando os padrões.  
- A mesma semente gera os mesmos resultados (com a mesma regra).

## Resumo
1. Compile e execute o programa Fortran, informando:
   - **Regra**: 0 a 255.  
   - **Semente**: Número inteiro.  
2. Execute o script Python para visualizar os padrões.  
3. Varie a regra e a semente para explorar diferentes comportamentos.