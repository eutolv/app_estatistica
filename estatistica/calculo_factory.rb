class CalculoFactory
  def self.realizar_calculo(opcao, estatistica)
    case opcao
    when 1
      agrupar_em_classes(estatistica)
    when 2
      agrupar_discreto(estatistica)
    when 3
      calcular_distribuicao_normal(estatistica)
    when 4
      calcular_distribuicao_exponencial(estatistica)
    when 5
      calcular_distribuicao_binomial(estatistica)
    when 6
      calcular_distribuicao_uniforme(estatistica)
    when 7
      calcular_distribuicao_poisson(estatistica)
    when 8
      calcular_regressao_linear(estatistica)
    when 9
      puts "\033[32mSaindo...\033[0m"
      exit
    else
      puts "\033[31mOpção inválida. Por favor, escolha uma opção válida.\033[0m"
    end
  end

  def self.agrupar_em_classes(estatistica)
    puts "\033[33mInsira o número de classes:\033[0m"
    num_classes = gets.chomp.to_i
    intervalos = []

    min = estatistica.dados.min
    max = estatistica.dados.max
    amplitude_total = max - min
    amplitude_classe = amplitude_total / num_classes.to_f

    num_classes.times do |i|
      intervalo_inicio = min + i * amplitude_classe
      intervalo_fim = intervalo_inicio + amplitude_classe
      intervalos << [intervalo_inicio, intervalo_fim]
    end

    puts "\033[34mClasses formadas:\033[0m"
    intervalos.each_with_index do |intervalo, index|
      puts "\033[35mClasse #{index + 1}: #{intervalo[0].round(2)} - #{intervalo[1].round(2)}\033[0m"
    end
  end

  def self.agrupar_discreto(estatistica)
    frequencias = Hash.new(0)
    estatistica.dados.each_with_index do |dado, index|
      frequencias[dado] += estatistica.frequencias[index]
    end

    puts "\033[34mDistribuição de Frequências Discretas:\033[0m"
    frequencias.each do |dado, frequencia|
      puts "\033[35mDado: #{dado.round(2)}, Frequência: #{frequencia}\033[0m"
    end
  end

  def self.calcular_distribuicao_normal(estatistica)
    puts "\033[33mDeseja calcular a distribuição normal para um valor específico? (s/n)\033[0m"
    resposta = gets.chomp.downcase
    if resposta == 's'
      puts "\033[33mPor favor, insira o valor para calcular a distribuição normal:\033[0m"
      valor = gets.chomp.to_f
      z = (valor - estatistica.media) / estatistica.desvio_padrao
      puts "\033[36mO valor Z para #{valor} é: #{z.round(2)}\033[0m"
    end
  end

  def self.calcular_distribuicao_exponencial(estatistica)
    puts "\033[33mInsira o valor de λ (taxa de ocorrência):\033[0m"
    lambda = gets.chomp.to_f
    puts "\033[33mInsira o valor para calcular a distribuição exponencial:\033[0m"
    x = gets.chomp.to_f
    resultado = 1 - Math.exp(-lambda * x)
    puts "\033[36mA probabilidade acumulada para x=#{x} é: #{resultado.round(4)}\033[0m"
  end

  def self.calcular_distribuicao_binomial(estatistica)
    puts "\033[33mInsira o número de tentativas (n):\033[0m"
    n = gets.chomp.to_i
    puts "\033[33mInsira a probabilidade de sucesso (p) em uma única tentativa:\033[0m"
    p = gets.chomp.to_f
    puts "\033[33mInsira o número de sucessos desejados (k):\033[0m"
    k = gets.chomp.to_i

    coef_binomial = (factorial(n) / (factorial(k) * factorial(n - k)))
    probabilidade = coef_binomial * (p**k) * ((1 - p)**(n - k))
    puts "\033[36mA probabilidade de obter exatamente #{k} sucessos em #{n} tentativas é: #{probabilidade.round(4)}\033[0m"
  end

  def self.calcular_distribuicao_uniforme(estatistica)
    puts "\033[33mVocê gostaria de usar o intervalo definido pelos seus dados (mínimo e máximo)? (s/n)\033[0m"
    resposta = gets.chomp.downcase

    if resposta == 's'
      a = estatistica.dados.min
      b = estatistica.dados.max
      puts "\033[34mIntervalo automaticamente definido: [#{a}, #{b}]\033[0m"
    else
      puts "\033[33mInsira o valor mínimo (a):\033[0m"
      a = gets.chomp.to_f
      puts "\033[33mInsira o valor máximo (b):\033[0m"
      b = gets.chomp.to_f
    end

    puts "\033[33mInsira o valor para calcular a distribuição uniforme:\033[0m"
    x = gets.chomp.to_f

    if x < a || x > b
      puts "\033[31mO valor está fora do intervalo.\033[0m"
    else
      probabilidade = 1.0 / (b - a)
      puts "\033[36mA probabilidade para x=#{x} dentro do intervalo [#{a}, #{b}] é: #{probabilidade.round(4)}\033[0m"
    end
  end


  def self.calcular_distribuicao_poisson(estatistica)
    puts "\033[33mInsira o valor de λ (número médio de ocorrências):\033[0m"
    lambda = gets.chomp.to_f
    puts "\033[33mInsira o número de ocorrências (k):\033[0m"
    k = gets.chomp.to_i

    probabilidade = (lambda**k * Math.exp(-lambda)) / factorial(k)
    puts "\033[36mA probabilidade de obter exatamente #{k} ocorrências é: #{probabilidade.round(4)}\033[0m"
  end

  def self.calcular_regressao_linear(estatistica)
    puts "\033[33mInsira os dados x (separados por espaço):\033[0m"
    dados_x = gets.chomp.split.map(&:to_f)
    puts "\033[33mInsira os dados y (separados por espaço):\033[0m"
    dados_y = gets.chomp.split.map(&:to_f)

    raise "\033[31mO número de dados x e y deve ser o mesmo.\033[0m" if dados_x.size != dados_y.size

    n = dados_x.size
    soma_x = dados_x.sum
    soma_y = dados_y.sum
    soma_xy = dados_x.zip(dados_y).map { |x, y| x * y }.sum
    soma_x2 = dados_x.map { |x| x**2 }.sum
    soma_y2 = dados_y.map { |y| y**2 }.sum

    # Calculando a inclinação (m) e a interseção (b) da linha de regressão
    m = (n * soma_xy - soma_x * soma_y) / (n * soma_x2 - soma_x**2)
    b = (soma_y - m * soma_x) / n

    # Coeficiente de Determinação (R²)
    r2 = (n * soma_xy - soma_x * soma_y)**2 / ((n * soma_x2 - soma_x**2) * (n * soma_y2 - soma_y**2))

    puts "\033[36mEquação da linha de regressão: y = #{m.round(2)}x + #{b.round(2)}\033[0m"
    puts "\033[36mCoeficiente de Determinação (R²): #{r2.round(4)}\033[0m"
  end

  def self.factorial(n)
    (1..n).reduce(1, :*)
  end
end
