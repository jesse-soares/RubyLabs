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

class Array

	def each_num &block

		self.each { |x| block.call to_numeric x if to_numeric x }
	end

	def to_num

		new_arr = []

		self.each { |x| new_arr << (to_numeric x) if to_numeric x }

		new_arr
	end

	def to_num!
		self.replace to_num
	end

	private

	def to_numeric value

		return value if value.is_a? Numeric

		return value.to_f if (value.respond_to? 'to_f') && (value.to_f != 0)

		return value.to_i if (value.respond_to? 'to_i') && (value.to_i != 0)

		false
	end

end

# Teste
arr1 = [1, 'a', Exception.new, "4.4", '1031']

arr1.each_num { |x| puts x }

puts arr1.to_num.inspect
puts arr1.inspect

puts arr1.to_num!.inspect
puts arr1.inspect