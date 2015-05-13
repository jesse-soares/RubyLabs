=begin

Criar 3 métodos na classe Array:

1) 'each_num': Deve receber um bloco. Itera sobre cada elemento do array e repassa para a execução
 do bloco (call) apenas os elementos que forem numéricos ou conversíveis para um valor numérico.
	Ex: [1, 'a', Pessoa.new, "4.4"].each_num { |n| puts n }		# saida: 1 4.4

2) 'to_num': retorna um novo array que contenha apenas os valores numéricos ou conversíveis para um valor numérico.
	Ex: [1, 'a', Pessoa.new, "4.4"].to_num 						# saida: [1, 4.4]

3) 'to_num!': altera o próprio array, no qual deve ficar apenas os valores numéricos ou conversíveis para um valor numérico.
	Ex: [1, 'a', Pessoa.new, "4.4"].to_num!						# saida: [1, 4.4]

=end