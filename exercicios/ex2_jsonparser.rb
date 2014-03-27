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

	def initialize nome, idade, filhos, pai
		@nome = nome
		@idade = idade
		@filhos = filhos
		@pai = pai
	end
end	

def toJson obj

	json = ""

	if obj.kind_of? NilClass
		json += "null" 
	elsif obj.kind_of? String
		json += '"' + obj + '"'
	elsif ((obj.kind_of? Numeric) || (obj.kind_of? TrueClass) || (obj.kind_of? FalseClass))
		json += obj.to_s 
	elsif obj.kind_of? Array
		json += toArray obj
	else
		json += toObj obj
	end	

	return json
end

def toArray obj

	json = obj.map { | value | toJson(value) }

	return "[ " + json.join(", ") + " ]"

end	

def toObj obj

	json = obj.instance_variables.map do | value | 

		prefixoJson =  value.to_s.delete "@"

		'"' + prefixoJson + '": ' + toJson(obj.instance_variable_get(value))

	end	

	return "{ " + json.join(", ") + " }"

end	

def toVariables key, instance_variables

	
end	



pessoa1 = Pessoa.new "Joao", 80, [ "Maria", "Pedro", 90 ], nil
pessoa2 = Pessoa.new "Joaozinho", 20, [], pessoa1

pessoas = []
pessoas.push pessoa1 
pessoas.push pessoa2 

puts toJson pessoas
