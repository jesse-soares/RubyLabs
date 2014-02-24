=begin NOTES

- Blocks não são objetos, mas podem ser convertidos em objetos da classe 'Proc'.
  Isso é feito chamando o método 'lambda' da classe Object passando o bloco desejado

- Um objeto da classe 'Proc' funciona de forma similar a de um método. É executado através do método 'call' que pode ou não ter argumentos.

- Não é possível passar métodos como argumentos para outros métodos, nem retornar métodos!!
  Porém é possível passar 'Procs' e retornar 'Procs'

=end

pr = lambda { |x| puts "Hello #{x}!!" }				# uso do metodo 'lamba' para converter o bloco em um Proc (pr)
pr2 = Proc.new { |y| puts "Aooooooooo #{y}!!" }		# lambda == Proc.new

def test_proc proc
	puts 'Teste!!'
	puts proc.call 'honey'
end

test_proc pr
test_proc pr2


# Inserindo comportamento na classe Array
class Array

	def multiplo_de_5 proc 					# recebe um proc explicitamente

		i = 0

		while i < self.size

			proc.call(self[i]) if self[i] % 5 == 0	# executa o proc
			i += 1
		end

	end
end

# converte o bloco para um 'proc' usando o metodo 'lambda'
[0,1,2,4,5,8,10,17,28,50,1092,2024,3075,4000].multiplo_de_5(lambda do |x|
	puts x
end)