=begin
	
Criar um método que receba um objeto em ruby e retorne seu valor em 1 string no formato JSON.

Ex.: 

ENTRADA
pessoa = Pessoa.new
pessoa.nome = "Joao"
pessoa.idade = 80
pessoa.filhos = [ "Maria", "Pedro" ]

SAIDA
{
	"nome": "Joao",
	"idade": 80,
	"filhos": [
		"Maria",
		"Pedro"
	]
}

=end

class Pessoa

	attr_accessor :nome, :idade, :filhos, pai

	def initialize nome, idade, filhos, pai
		@nome = nome
		@idade = idade
		@filhos = filhos
		@pai = pai
	end
end	

class Object

	def toJson 

		return "null"  if self.kind_of? NilClass

		return '"' + self + '"' if self.kind_of? String
			
		return self.to_s  if ((self.kind_of? Numeric) || (self.kind_of? TrueClass) || (self.kind_of? FalseClass))
			
		return toArray if self.kind_of? Array
			
		toObj
	end

	private

	def toArray 

		json = self.map { | value | value.toJson}

		"[ " + json.join(", ") + " ]"

	end	

	def toObj 

		json = self.instance_variables.map do | value | 

			prefixoJson =  value.to_s.delete "@"

			'"' + prefixoJson + '": ' + (self.instance_variable_get(value)).toJson

		end	

		"{ " + json.join(", ") + " }"
	end	

end	

pessoa1 = Pessoa.new "Joao", 80, [ "Maria", "Pedro", 90 ], nil
pessoa2 = Pessoa.new "Joaozinho", 20, [], pessoa1

pessoa1.nome = "Kadu"

pessoas = []
pessoas.push pessoa1 
pessoas.push pessoa2 

puts pessoas.toJson

puts "nome".toJson 

puts nil.toJson 

puts true.toJson 

puts 90.toJson 