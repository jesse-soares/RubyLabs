=begin
	
Criar um método que receba um objeto em ruby e retorne seu valor em 1 string no formato JSON.

Ex.: 

ENTRADA
pessoa = Pessoa
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

	def initialize nome, idade, filhos
		@nome = nome
		@idade = idade
		@filhos = filhos
	end
end	

def toJson obj

	json = "" 

	if obj.kind_of?(Array)
		obj.each do | value |

			json += ", \n" if json.length > 0

			if value.kind_of?(NilClass)
				json += "null"
			else	
				json += "'" + value + "'"
			end
		end
	end

	obj.instance_variables.each do | key |
		
		prefixoJson = key.delete "@"

		json += ", \n" if json.length > 0

		if obj.instance_variable_get(key).kind_of?(Array)
			array = toJson obj.instance_variable_get(key)
			json += prefixoJson + " : " +  array.to_s
		elsif obj.instance_variable_get(key).kind_of?(String)
			json += prefixoJson + " : '" +  obj.instance_variable_get(key) + "'"
		else
			json += prefixoJson + " : " +  obj.instance_variable_get(key).to_s
		end	
	end	

	if obj.kind_of?(Array)
		"[\n" + json + "\n]" 
	else	
		"{\n" + json + "\n}" 	
	end	
end	

pessoa = Pessoa.new "Joao", 80, [ "Maria", "Pedro" ]

puts toJson pessoa