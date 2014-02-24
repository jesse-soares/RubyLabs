class Dog

	def initialize breed, name		# metodo default do ruby para inicializacao. Nao é um contrutor, mas sim é chamado pelo construtor
									# o construtor do objeto é o metodo de classe <Class>.new
		@name = name				# variaveis de instancia. Não é preciso declarar.
		@breed = breed
	end

	def bark
		'Ruff! Ruff!'
	end

	def display
		"Hello, Im a #{@breed} named #{@name}!"
	end

	def method_missing(m, *args, &block)		# caso o metodo nao exista é lancado um NoMethodError, a nao ser que seja implementado o metodo utilitario 'method_missing'
		puts "No method named '#{m}' founded on this class!!"
	end
end

d = Dog.new('Border Collie', 'Bacardi')

puts d.display

(d.respond_to? 'talk') ? (puts d.talk) : (puts 'Doesnt talk!')
(d.respond_to? 'bark') ? (puts d.bark) : (puts 'Doesnt bark!')

d.aeeta

=begin NOTES

- É melhor usar :respond_to? ao inves de :instance_of? pois é melhor verificar um comportamento desejado do que o tipo

- Nomenclaturas de metodos:
	Dog#bark	- metodo de instancia
	Dog.color	- metodo da classe (static)
	Dog::color	- metodo da classe (static)

=end