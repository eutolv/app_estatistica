require_relative 'estatistica/base_estatistica'
require_relative 'estatistica/calculo_factory'

class EstatisticaApp
  def exibir_banner
    puts <<-'ASCII'
    _____                                                                                         _____        _____        _____
 __|___  |__  ______  ____    __    __    _ ____  ____   _  _____   _____    ____    _____     __|_    |__  __|___  |__  __|___  |__  ___
|      >    ||   ___||    \  /  |  \  \  //|    ||    \ | ||     \ /     \  |    \  /     \   |    |      ||   ___|    ||   ___|    ||   |
|     <     ||   ___||     \/   |   \  \// |    ||     \| ||      \|     |  |     \ |     |  _|    |      ||   |__     | `-.`-.     ||___|
|______>  __||______||__/\__/|__|    \__/  |____||__/\____||______/\_____/  |__|\__\\_____/ |______|    __||______|  __||______|  __||___|
   |_____|                                                                                       |_____|      |_____|      |_____|
    ASCII
  end

  def exibir_opcao(titulo)
    largura = 80  # Ajuste conforme o tamanho da tela ou necessidade
    espacos = (largura - titulo.length - 6) / 2
    linha = "-" * espacos + "+ #{titulo} +" + "-" * espacos
    puts linha
  end

  def iniciar
    exibir_banner
    puts "\033[32mIniciando o programa de estatísticas...\033[0m"
    estatistica = EstatisticaBase.new

    loop do
      dados, frequencias = obter_dados_e_frequencias

      estatistica.dados = dados
      estatistica.frequencias = frequencias

      estatistica.calcular_estatisticas_basicas

      puts "\033[0mDados inseridos:\n"
      puts "Dados: #{estatistica.dados}, Frequências: #{estatistica.frequencias}"
      puts "\033[36mMédia: #{estatistica.media}\033[0m"
      puts "\033[36mVariância: #{estatistica.variancia.round(2)}\033[0m"
      puts "\033[36mDesvio Padrão: #{estatistica.desvio_padrao.round(2)}\033[0m"
      puts "\033[36mCoeficiente de Variação: #{estatistica.coeficiente_variacao.round(2)}%\033[0m"

      exibir_opcao("Escolha a operação desejada")
      puts "1. Agrupamento em Classes"
      puts "2. Agrupamento Discreto"
      puts "3. Distribuição Normal para um valor específico"
      puts "4. Distribuição Exponencial"
      puts "5. Distribuição Binomial"
      puts "6. Distribuição Uniforme"
      puts "7. Distribuição de Poisson"
      puts "8. Regressão Linear e Coeficiente de Determinação"
      puts "9. Sair"

      opcao = gets.chomp.to_i

      CalculoFactory.realizar_calculo(opcao, estatistica)

      exibir_opcao("Deseja realizar outro cálculo?")
      puts "1. Realizar cálculo com os mesmos dados"
      puts "2. Inserir novos dados e realizar cálculo"

      opcao = gets.chomp.to_i
      if opcao == 1
        puts "Realizando cálculo com os mesmos dados..."
      elsif opcao == 2
        break
      end
    end
  end

  private

  def obter_dados_e_frequencias
    dados = []
    frequencias = []

    loop do
      dados = obter_numeros("\033[31mInsira os dados (separados por espaço):\033[0m") # Vermelho
      frequencias = obter_numeros("\033[33mInsira as frequências correspondentes (separadas por espaço):\033[0m", tipo: :inteiro) # Amarelo

      if dados.length != frequencias.length
        puts "\033[31mErro: O número de dados não corresponde ao número de frequências. Tente novamente.\033[0m"
      else
        break
      end
    end

    return dados, frequencias
  end

  def obter_numeros(mensagem, tipo: :decimal)
    loop do
      print "#{mensagem} "
      entrada = gets.chomp.split

      numeros = if tipo == :inteiro
                  entrada.map { |e| Integer(e) rescue nil }
                else
                  entrada.map { |e| Float(e) rescue nil }
                end

      if numeros.all?
        return numeros
      else
        puts "Entrada inválida! Insira apenas números válidos separados por espaço."
      end
    end
  end

  def obter_numero(mensagem, tipo: :inteiro)
    loop do
      print "#{mensagem} "
      entrada = gets.chomp

      numero = if tipo == :inteiro
                 Integer(entrada) rescue nil
               else
                 Float(entrada) rescue nil
               end

      return numero if numero
      puts "Entrada inválida! Digite um número válido."
    end
  end
end

app = EstatisticaApp.new
app.iniciar
