
=begin NOTES

- analogos a 'closures' em outras linguagens
- sao definidos por '{ |args; local args| code }' para blocos de 1 linha e 'do |args| code end' para blocos com varias linhas
- sao definidos depois da chamada a algum metodo, depois do ultimo argumento passado, sendo que os argumentos |args| sao opcionais
- 'yield' dentro do metodo executa o bloco que foi definido, podendo passar parametros na chamada
- o escopo que o bloco carrega é relativo o objeto no qual é declarado

=end


def custom_method s1, s2

	puts 'Hi ' + s1

	if block_given?		# metodo que verifica se algum bloco foi passado na chamada do metodo, caso contrario seria lancado um erro ao chamar 'yield'
		yield('world')
		yield
	end

	puts 'Bye ' + s2
end

custom_method('Django', 'bla') { puts 'bla' }   # definicao de bloco sem argumentos
custom_method('Maria', 'everybody') { |who| puts 'hello ' + who.to_s } # ao definir um bloco desse forma é necessario colocar () na chamada do metodo
custom_method 'Josep', 'bye'



# CLOSURES - escopo

list = ['a', 'b']
i = 'ihaa'

[1, 2, 3, 4].each { |i| list << i * 2 }			# o bloco carrega o escopo no qual foi declarado (list), mas tambem tem seu proprio escopo (i)

puts list.to_s
puts i


x = 10
5.times { |x| puts "x inside the block #{x}" }		# o escopo das variaveis do bloco é local

puts "x outside the block #{x}"

4.times do |y|
	x = y
	puts "x inside the block #{x}"					# mas ele tem acesso as variaveis no local de onde é declarado
end

puts "x outside the block #{x}"

x = 10
4.times do |y; x|									# essa sintaxe permite definir variaveis que serao sempre locais (logo apos o ';')
	x = y
	puts "x inside the block #{x}"					# mas ele tem acesso as variaveis no local de onde é declarado
end

puts "x outside the block #{x}"



## CRIANDO METODOS QUE RECEBEM BLOCKS

## Adicionando comportamento na classe Array
class Array

	def pares

		i = 0

		while i < self.size

			yield(self[i]) if self[i] % 2 == 0			# executa o bloco passado junto com o metodo 'pares'
			i += 1
		end

	end

	def impares &bloco 									# explicita que o metodo precisa receber um bloco como argumento
														# o '&' converte explicitamente o bloco em um 'Proc' para assim poder ser executado (ver p10.rb)
		i = 0

		while i < self.size

			bloco.call(self[i]) if self[i] % 2 == 1 	# chama o metodo 'call' da classe 'Proc' (ver p10.rb)
			i += 1
		end

	end

end

arr = [0,1,2,3,4,5,6,7,8,9,10]

arr.pares { |x| puts x }
arr.impares { |x| puts x }

