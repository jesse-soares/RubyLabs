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

			json += ", " if json.length > 0

			if value.kind_of?(NilClass)
				json += "null"
			elsif value.kind_of?(Fixnum) || value.kind_of?(Bignum)
				json += value.to_s
			elsif value.kind_of?(String)
				json += '"' + value + '"'						
			else				
				json += toJson value
			end
		end
	end

	obj.instance_variables.each do | key |
		
		prefixoJson = key.to_s.delete "@"

		json += ", \n" if json.length > 0

		if obj.instance_variable_get(key).kind_of?(NilClass)
			json += '"' + prefixoJson + '" : null'  
		elsif obj.instance_variable_get(key).kind_of?(Array)
			array = toJson obj.instance_variable_get(key)
			json += '"' + prefixoJson + '" : ' +  array.to_s
		elsif obj.instance_variable_get(key).kind_of?(String)
			json += '"' + prefixoJson + '" : "' +  obj.instance_variable_get(key) + '"'
		elsif obj.instance_variable_get(key).kind_of?(Fixnum) || obj.instance_variable_get(key).kind_of?(Bignum)
			json += '"' + prefixoJson + '" : ' +  obj.instance_variable_get(key).to_s		
		else			
			json += '"' + prefixoJson + '" : ' + toJson(obj.instance_variable_get(key))
		end	
	end	

	if obj.kind_of?(Array)
		"[" + json + "]" 
	else	
		"{\n" + json + "\n}" 	
	end	
end	

pessoa1 = Pessoa.new "Joao", 80, [ "Maria", "Pedro", 80 ]
pessoa2 = Pessoa.new "Joaozinho", 20, []

pessoas = []
pessoas.push(pessoa1)
pessoas.push(pessoa2)

puts toJson pessoas