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
	attr_accessor :aposentado
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

	variables = obj.instance_variables.map{ |x| parse_object_instance_variable obj, x }

	return '{ ' + variables.join(', ') + ' }'

end


def parse_object_instance_variable obj, instance_variable

	return '' if !obj || !instance_variable

	var_name = instance_variable.to_s
	var_name = '"' + var_name[1, var_name.size] + '"' # remover first char '@'

	var_value = parse_json obj.instance_variable_get instance_variable

	return var_name + ': ' + var_value

end



filho1 = Pessoa.new
filho1.nome = "Maria"
filho1.idade = 40

filho2 = Pessoa.new
filho2.nome = "Jose"
filho2.idade = 38

pessoa = Pessoa.new
pessoa.nome = "Joao"
pessoa.idade = 80
pessoa.aposentado = true
pessoa.filhos = [filho1, filho2]


puts parse_json [1, 2, "Oxi", pessoa]
