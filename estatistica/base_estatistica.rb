# estatistica/base_estatistica.rb

class EstatisticaBase
  attr_accessor :dados, :frequencias, :media, :variancia, :desvio_padrao, :coeficiente_variacao

  def initialize
    @dados = []
    @frequencias = []
    @media = 0.0
    @variancia = 0.0
    @desvio_padrao = 0.0
    @coeficiente_variacao = 0.0
  end

  def calcular_estatisticas_basicas
    return if @dados.empty? || @frequencias.empty?

    total_frequencias = @frequencias.sum
    @media = @dados.each_with_index.sum { |valor, index| valor * @frequencias[index] } / total_frequencias

    @variancia = @dados.each_with_index.sum do |valor, index|
      frequencia = @frequencias[index]
      frequencia * ((valor - @media) ** 2)
    end / total_frequencias

    @desvio_padrao = Math.sqrt(@variancia)
    @coeficiente_variacao = (@desvio_padrao / @media) * 100 unless @media.zero?
  end

  # Método para calcular a distribuição normal
  def calcular_distribuicao_normal(valor)
    z = (valor - @media) / @desvio_padrao
    0.5 * (1 + Math.erf(z / Math.sqrt(2)))
  end

  # Método para calcular a distribuição exponencial
  def calcular_distribuicao_exponencial(lambda, x)
    return 0 if x < 0
    lambda * Math.exp(-lambda * x)
  end

  # Método para calcular a distribuição binomial
  def calcular_distribuicao_binomial(n, p, k)
    combina = (1..n).reduce(1, :*) / ((1..k).reduce(1, :*) * (1..(n - k)).reduce(1, :*))
    combina * (p**k) * ((1 - p)**(n - k))
  end

  # Método para calcular a distribuição uniforme
  def calcular_distribuicao_uniforme(a, b, x)
    return 0 if x < a || x > b
    1.0 / (b - a)
  end

  # Método para calcular a distribuição de Poisson
  def calcular_distribuicao_poisson(lambda, k)
    (lambda ** k) * Math.exp(-lambda) / (1..k).reduce(1, :*)
  end

  # Método para calcular regressão linear e coeficiente de determinação
  def calcular_regressao_linear
    n = @dados.size
    return { slope: 0, intercept: 0, r_squared: 0 } if n < 2

    sum_x = @dados.sum
    sum_y = @frequencias.sum
    sum_xy = @dados.each_with_index.sum { |x, i| x * @frequencias[i] }
    sum_x_squared = @dados.sum { |x| x ** 2 }

    slope = (n * sum_xy - sum_x * sum_y) / (n * sum_x_squared - sum_x ** 2)
    intercept = (sum_y - slope * sum_x) / n

    # Coeficiente de determinação (R²)
    ss_total = @frequencias.sum { |y| (y - sum_y / n) ** 2 }
    ss_residual = @frequencias.each_with_index.sum { |y, i| (y - (slope * @dados[i] + intercept)) ** 2 }
    r_squared = 1 - (ss_residual / ss_total)

    { slope: slope, intercept: intercept, r_squared: r_squared }
  end
end
