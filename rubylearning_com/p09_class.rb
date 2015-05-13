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


# ACCESSORS (getters e setters)

puts d.name							# nao é possivel acessar diretamente uma variavel de instancia

class Dog							# adicionando comportamento na classe 'Dog'

	attr_accessor :age				# cria a variavel '@age', e os metodos accessors 'age' (getter) e 'age=' (setter)

	def name 						# criando attr_reader (getter)
		@name
	end

	def name= name 					# criando attr_writer (setter; sufixo '=')
		@name = name
	end

	def voice
		puts "Au Au"
		uivo
	end

	def Dog.create_default					# metodo de classe (static)

		dog = new 'Vira-lata', 'Rex'		# contrutor é um metodo que pertence a classe
		dog.age = 1

		dog
	end

	private									# a partir daqui tudo é privado. Métodos privados são acessiveis de subclasses!

	def uivo
		puts 'Auuuuuuuuu'
	end

end

puts d.name

d.age = 5
d.name = 'Raika'
puts d.name + d.age.to_s

d1 = Dog.create_default
puts d1.name
d1.voice
d1.uivo										# metodo privado


=begin NOTES

- É melhor usar :respond_to? ao inves de :instance_of? pois é melhor verificar um comportamento desejado do que o tipo

- Nomenclaturas de metodos:
	Dog#bark	- metodo de instancia
	Dog.color	- metodo da classe (static)
	Dog::color	- metodo da classe (static)

=end