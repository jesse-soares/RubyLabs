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

	def each_num &bloco
		i = 0

		while i < self.size
			
			if self[i].kind_of? Numeric 
				bloco.call(self[i])
			elsif self[i].kind_of?(String) && self[i].to_f > 0.0
				bloco.call(self[i].to_f)			
			end

			i += 1
		end	
	end

	def to_num

		new_array = []

		self.each do  |x| 

			if x.kind_of? Numeric
				new_array.push x 
			elsif (x.respond_to? 'to_f') && (x.to_f != 0)
				new_array.push x.to_f 
			elsif (x.respond_to? 'to_i') && (x.to_f != 0)
				new_array.push x.to_i
			end	
		end

		new_array
	end

	def to_num!
		self.replace to_num
	end

end

#[1, 'a', "4.4", "0.0", ["5"]].each_num { |n| puts n }

arr1 = [1, 'a', Exception.new, "4.4", '1031']

arr1.each_num { |x| puts x }

#puts arr1.to_num.inspect

puts arr1.to_num!.inspect

puts arr1.inspect
