arr1 = [1, 'bla', [true, 'eta']]	# ducktype items

puts arr1[2]
puts arr1[5].class					# permite, retorna 'nil'

arr1.each do |value|					# iterador usando o metodo 'each' e bloco de execucao
	puts " => #{value.to_s}"
end

i0, i1 = 4, 5, '6'				# atribuicao dos valores de array as 2 variaveis ; e forma de constuir array sem '[]'.

puts i0
puts i1


# RANGES

r = (1..10)
puts r.include? 5
puts r.max
puts r.to_a.to_s				# conversao de ranga para array


# HASHES (map) - sao arrays onde os indices podem ser objetos de qualquer tipo. Em arrays os indices sao apenas inteiros

hash = { 'name' => 'Jesse', 'age' => '20' }
puts hash

hash2 = { :name => 'Aline', :age => '15' }   # usando simbolos como chave dos hashes
puts hash2


#NOTE - Symbols: sao identificadores de variaveis, metodos, etc e que ao serem declarados referenciam o mesmo objeto durante toda a execucao do ruby