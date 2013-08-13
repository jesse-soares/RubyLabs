puts "Hello World"
puts 'Hello World'   # mais eficiente

puts 'I like' + 'Ruby' # concatenar
puts 'It\'s my Ruby'   # '\' para escapar caracteres
puts 'Hello ' * 3      # escreve 3 vezes

PI = 3.1416            # contante. Basta colocar o nome da variável em maiúsculo.
puts PI

PI = 'hi'              # alterar o valor de uma constante gera um warning mas é permitido. =/
puts PI

# Alguns métodos úteis
puts '123456'.length
puts '123456'.size
puts '123456.789'.to_i
puts '123456.789'.to_f
puts ''.empty?
puts 'oi tiao'.upcase
puts 'AbAcAxI'.downcase
puts 'bacana'.reverse


puts `dir`             # um string com o caracter especial '`' é executada no terminal do sistema

### NOTES

# String é uma sequência de caracteres
# Strings são mutáveis