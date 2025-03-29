# Estatística em Ruby

Este projeto fornece uma implementação de cálculos estatísticos em Ruby, incluindo distribuições estatísticas, regressão linear e coeficiente de variação.

## Estrutura do Projeto

O projeto está organizado da seguinte forma:

```
/statistica
  |-- base_estatistica.rb  # Classe principal para cálculos estatísticos
  |-- calculo_factory.rb   # Fábrica para selecionar diferentes cálculos
  |-- coeficiente_variacao.rb # Cálculo do coeficiente de variação
  |-- distribuicao_normal.rb  # Cálculo da distribuição normal
  |-- variancia.rb  # Cálculo de variância e desvio padrão
```

## Funcionalidades

O projeto inclui os seguintes métodos e funcionalidades:

- **Métricas Básicas**: Média, variância, desvio padrão e coeficiente de variação.
- **Distribuições Estatísticas**:
  - Normal
  - Exponencial
  - Binomial
  - Uniforme
  - Poisson
- **Regressão Linear**: Cálculo da equação de regressão linear e coeficiente de determinação (R²).
- **Agrupamento de Dados**:
  - Em classes
  - Discreto

## Como Usar

1. Clone o repositório:

   ```sh
   git clone https://github.com/seu-usuario/estatistica-ruby.git
   cd estatistica-ruby/statistica
   ```

2. Execute um script Ruby que utilize as classes. Por exemplo:

   ```ruby
   require_relative 'base_estatistica'

   estatistica = EstatisticaBase.new
   estatistica.dados = [10, 20, 30, 40, 50]
   estatistica.frequencias = [2, 3, 5, 4, 1]
   estatistica.calcular_estatisticas_basicas

   puts "Média: #{estatistica.media}"
   puts "Desvio Padrão: #{estatistica.desvio_padrao}"
   ```

## Requisitos

- Ruby 2.7 ou superior

## Contribuição

Sinta-se à vontade para abrir *Issues* e *Pull Requests* caso tenha sugestões ou melhorias.

## Licença

Este projeto está sob a licença MIT.

