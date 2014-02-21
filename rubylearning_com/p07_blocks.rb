
=begin NOTES

- analogos a 'closures' em outras linguagens
- sao definidos por '{ |args; local args| code }' para blocos de 1 linha e 'do |args| code end' para blocos com varias linhas
- sao definidos depois da chamada a algum metodo, depois do ultimo argumento passado, sendo que os argumentos |args| sao opcionais
- 'yield' dentro do metodo executa o bloco que foi definido, podendo passar parametros na chamada
- o escopo que o bloco carrega é relativo o objeto no qual é declarado

=end


def customMethod s1, s2

	puts 'Hi ' + s1

	if block_given?		# metodo que verifica se algum bloco foi passado na chamada do metodo, caso contrario seria lancado um erro ao chamar 'yield'
		yield('world')
		yield
	end

	puts 'Bye ' + s2
end

customMethod('Django', 'bla') { puts 'bla' }   # definicao de bloco sem argumentos
customMethod('Maria', 'everybody') { |who| puts 'hello ' + who.to_s } # ao definir um bloco desse forma é necessario colocar () na chamada do metodo
customMethod 'Josep', 'bye'


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