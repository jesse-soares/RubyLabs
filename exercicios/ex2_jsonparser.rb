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

	attr_accessor :nome
	attr_accessor :idade
	attr_accessor :filhos

end



def parse_json obj

	is_primitive = ( (obj.is_a? Numeric) ||
		 			(obj.is_a? TrueClass) ||
		 			(obj.is_a? FalseClass) )

	return obj.to_s if is_primitive

	return '"' + obj + '"' if (obj.is_a? String)

	if (obj.is_a? Array)

		obj.map!{ |x| parse_json x }

		return '[ ' + obj.join(', ') + ' ]'
	end

	#obj.instance_variables
	#obj.instance_variable_get :@nome

	return "{}"

end

puts parse_json [ 2, 3, "Oxi", Pessoa.new ]