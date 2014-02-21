arr1 = [1, 'bla', [true, 'eta']]	# ducktype items

puts arr1[2]
puts arr1[5].class					# permite, retorna 'nil'

arr1.each do |value|					# iterador usando o metodo 'each' e bloco de execucao
	puts " => #{value.to_s}"
end

i0, i1 = 4, 5, '6'				# atribuicao dos valores de array as 2 variaveis ; e forma de constuir array sem '[]'.

puts i0
puts i1


