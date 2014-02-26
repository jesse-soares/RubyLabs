puts "Hello World"   
puts 'Hello World'   # mais eficiente, pois nao faz varredura em busca de interpolacao nem de caracteres de escape

cor = 'azul'
puts "Minha cor preferida é #{cor}"  # aspa dupla permite a interpolação de variáveis

puts "O resultado de 10 * 5 é #{10 * 5}"  # a interpolacao na verdade permite executar codigos dentro da string

puts 'I like' + 'Ruby' # concatenar
puts 'It\'s my Ruby'   # '\' para escapar caracteres
puts 'Hello ' * 3      # escreve 3 vezes


# Alguns métodos úteis
puts '123456'.length
puts '123456'.size
puts '123456.789'.to_i
puts '123456.789'.to_f
puts ''.empty?
puts 'oi tiao'.upcase
puts 'AbAcAxI'.downcase
puts 'bacana'.reverse

a = 'hello '
a<<'wold.
I love this world..'  # append

puts a


# CONVERSOES

puts '12' + '3'
puts 12 + '3'.to_i
# puts 12 + '3'       ERRO pois o ruby não faz a conversão implicita de num pra string


# COMPARACAO

s1 = 'Jesse'
s2 = 'Jesse'
s3 = s1

# ':==' compara o conteudo das Strings
if s1 == s2
	puts 's1 tem o mesmo conteudo de s2'
end

# ':eql?' idem ao ':=='
if s1.eql? s2
	puts 's1 tem o mesmo conteudo de s2'
end

# ':equal?' compara se sao o mesmo objeto
if s1.equal? s2
	puts 's1 é o mesmo objeto de s2'
end

if s1.equal? s3
	puts 's1 é o mesmo objeto de s3'
end



# %w - atalho para criacao de array de Strings

puts %w{ abobrinha couve alface tomate }	# atalho. mesmo que: ['abobrinha', 'couve', 'alface', 'tomate']


### NOTES

# String é uma sequência de caracteres
# Strings são mutáveis