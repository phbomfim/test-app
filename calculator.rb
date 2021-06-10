# Programa criado para a análise e modificação de valores pré definidos.
# A ideia principal é modificar multiplos de 5, 7 e 35 de acordo as regras
# fazendo uso de testes. Neste código foi utilizado Rspec como base.
class Calculator
  # Foi definida uma classe simples que "simula" uma calculadora.
  # A ideia principal foi definir os métodos que utilizaremos com os valores
  # em questão.

  # Este metódo retornará true caso o número seja divisível por 5.
  # A comparação é feita entre 0 e o resto da divisão do valor/5.
  def divisibleByFive(num1)
    num1.remainder(5) == 0
  end

  # Este método realiza uma simples verificação se o valor é menor que 100 (quantidade
  # máxima definida para o programa).
  def validToArraySize(num1)
    100 > num1
  end

  # Este método verifica se o valor em questão é um inteiro.
  def isInteger(value)
    value.is_a?(Integer)
  end
end

# Código abaixo definido para a realização principal do programa.
# Iremos criar um vetor de tamanho 100 e de inicio armazenaremos os valores de 1 a 100.
# Devemos também criar uma variável do tipo Calculator para que possamos realizar os testes definidos.
x = Array.new(100) { |i| i + 1 }
calc = Calculator.new

# A partir da alimentação do vetor, devemos percorrer o mesmo, atribuindo cada
# valor atual à variável value.
(0...x.size).each do |i|
  value = x.at(i)

  # Verificamos se na posição atual existe um inteiro e se ele é divisível por 5.
  # Caso seja, devemos substituir o seu valor ao texto Nama.
  # Aproveitamos este número para já alterarmos o próximo múltiplo de 7:
  #   1) O quocioente da divisão do valor atual por 5 retornará o multiplicador
  #   2) A diferença entre 5 e 7 é de 2
  #   3) Logo, a diferença entre o valor atual(múltiplo de 5) e o próximo múltiplo
  #      de 7, será igual a 2 * o multiplicador encontrado.
  if calc.isInteger(value) && calc.divisibleByFive(value)
    x[i] = 'Nama'
    next_seven = value + (value / 5) * 2
    x[next_seven - 1] = 'Team' if calc.validToArraySize(next_seven)

  # Existe o caso onde o valor é múltiplo de 5 e 7 simultaneamente.
  # Este é o caso dos múltiplos de 35 e portanto, devemos alterar o texto.
  # A diferença do caso acima é a existência de uma String já alocada naquela
  # posição, portanto, não utilizaremos o método isInteger.
  # A atribuição ao próximo múltiplo de 7 ocorre da mesma maneira.
  elsif value == 'Team' && calc.divisibleByFive(i + 1)
    x[i] = 'Nama Team'
    value = i + 1
    next_seven = value + (value / 5) * 2
    x[next_seven - 1] = 'Team' if calc.validToArraySize(next_seven)
  end
end

# Por fim o programa deve ser impresso com os valores separados por vírgula.
# A função .join() foi utilizada para evitar a impressão desnecessária.
$stdout.print x.join(', ')
