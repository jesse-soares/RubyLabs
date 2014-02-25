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
	obj.instance_variables.each do | key |
		
		json += ", \n" if json.length > 0

		if obj.instance_variable_get(key).kind_of?(Array)
			json += key + " : " +  obj.instance_variable_get(key).to_s	
		elsif obj.instance_variable_get(key).kind_of?(String)
			json += key + " : '" +  obj.instance_variable_get(key) + "'"
		else
			json += key + " : " +  obj.instance_variable_get(key).to_s
		end		
	end	
	puts "{\n" + json + "\n}" 
end	

pessoa = Pessoa.new "Joao", 80, [ "Maria", "Pedro" ]

toJson pessoa