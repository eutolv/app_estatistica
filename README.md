# Estatística App

Este projeto é um aplicativo de estatísticas desenvolvido em Ruby, com a capacidade de calcular várias estatísticas básicas e distribuções, como média, variância, desvio padrão, entre outros, a partir de dados fornecidos pelo usuário. O aplicativo oferece duas versões: uma de linha de comando (CLI) e uma com interface gráfica (GUI), mas a interface gráfica foi deixada de lado por enquanto devido à complexidade no desenvolvimento.

## Funcionalidades

- **Estatísticas Básicas**: Média, Variância, Desvio Padrão, Coeficiente de Variação.
- **Distribuições**: Distribuição Normal, Exponencial, Binomial, Uniforme, Poisson.
- **Agrupamento em Classes**: Agrupamento de dados em classes de frequências.
- **Regressão Linear**: Cálculos de regressão para dados.

## Estrutura do Projeto

O projeto é composto pelos seguintes arquivos principais:

1. **app.rb** - Arquivo principal da versão de linha de comando do aplicativo.
2. **estatistica/base_estatistica.rb** - Classe que contém os cálculos principais das estatísticas básicas, como média, variância, desvio padrão, e coeficiente de variação.
3. **estatistica/calculo_factory.rb** - Classe responsável por invocar cálculos adicionais, como distribuições e agrupamento em classes.
4. **coeficiente_variacao.rb** - Classe para calcular o coeficiente de variação a partir da média e desvio padrão.
5. **distribuicao_normal.rb** - Classe para calcular a distribuição normal acumulada (CDF) para um valor específico.
6. **variancia.rb** - Classe que calcula a variância e o desvio padrão a partir dos dados e frequências.

## Como Usar

### Versão de Linha de Comando (CLI)

1. **Clone o repositório**:

    ```bash
    git clone https://github.com/seu-usuario/estatistica-app.git
    cd estatistica-app
    ```

2. **Execute o aplicativo**:

    Para iniciar o aplicativo de linha de comando, basta executar o arquivo `app.rb`:

    ```bash
    ruby app.rb
    ```

3. **Entradas do usuário**:
    O programa solicitará que você insira os dados e as frequências, separados por espaços. Depois, o aplicativo calculará as estatísticas básicas.

    Após calcular as estatísticas básicas, você poderá escolher entre realizar cálculos adicionais, como distribuições, agrupamento em classes ou regressão linear.

4. **Exemplo de Entrada e Saída**:
    - Dados: `5 10 15 20`
    - Frequências: `1 2 3 4`

    O programa calculará a média, variância, desvio padrão e coeficiente de variação com base nos valores fornecidos.

### Interface Gráfica (GUI) (Desenvolvimento Incompleto)

A versão gráfica foi desenvolvida utilizando a biblioteca GTK3, mas não está completamente funcional no momento devido à complexidade do layout e interatividade. Para usá-la, você pode executar o arquivo `app_gui.rb` (não recomendado para o momento).

### Cálculos Adicionais

O aplicativo oferece vários tipos de cálculos adicionais após a entrada dos dados principais:

1. **Agrupamento em Classes** - Solicita o número de classes e agrupa os dados em intervalos.
2. **Distribuições**:
    - Normal (CDF)
    - Exponencial
    - Binomial
    - Uniforme
    - Poisson
3. **Regressão Linear** - Calcula a linha de melhor ajuste para os dados fornecidos.

Esses cálculos podem ser realizados a partir da linha de comando ou da interface gráfica (se funcional).

## Arquitetura

- **Classe EstatisticaBase**: Responsável pelos cálculos básicos de estatísticas como média, variância, desvio padrão e coeficiente de variação.
- **Classe CalculoFactory**: Responsável por invocar o cálculo adequado com base na opção selecionada pelo usuário (agrupamento em classes, distribuições, etc).
- **Classes de Distribuição**: Cada classe de distribuição (Normal, Exponencial, Binomial, etc.) realiza o cálculo da respectiva distribuição.
- **Classe CoeficienteVariacao**: Calcula o coeficiente de variação com base nos valores da estatística.
- **Classe Variancia**: Realiza o cálculo da variância e desvio padrão.

## Requisitos

- Ruby 2.5 ou superior
- GTK3 (apenas para a versão com interface gráfica)

## Instalação

1. **Instalar Ruby**: Se você não tiver o Ruby instalado, pode baixá-lo [aqui](https://www.ruby-lang.org/en/documentation/installation/).
2. **Instalar Dependências**: Para usar a versão gráfica, você precisará instalar o GTK3:

    ```bash
    gem install gtk3
    ```

3. **Rodar o projeto**: Após clonar o repositório e instalar as dependências, basta rodar o projeto conforme descrito.

## Contribuindo

Se você deseja contribuir para o projeto, fique à vontade para abrir pull requests ou relatar problemas. Todas as contribuições são bem-vindas!

## Licença

Esse projeto está licenciado sob a [MIT License](LICENSE).
