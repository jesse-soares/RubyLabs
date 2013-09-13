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


# definicao da funcao na classe Object
class Object

	def to_json

		is_primitive = ( (self.is_a? Numeric) ||
			 			(self.is_a? TrueClass) ||
			 			(self.is_a? FalseClass) )

		return self.to_s if is_primitive

		return 'null' if (self.is_a? NilClass)

		return '"' + self + '"' if (self.is_a? String)

		return parse_array_to_json if (self.is_a? Array)

		parse_object_to_json
	end

	private

	def parse_array_to_json
		
		json_arr = self.map{
			|x| x.to_json
		}

		return '[ ' + json_arr.join(', ') + ' ]'
	end

	def parse_object_to_json

		variables = self.instance_variables.map{
			|x| parse_object_instance_variable_to_json x
		}

		return '{ ' + variables.join(', ') + ' }'
	end

	def parse_object_instance_variable_to_json instance_variable

		var_name = instance_variable.to_s
		var_name = '"' + var_name[1, var_name.size] + '"' # remover first char '@'

		var_value = (self.instance_variable_get instance_variable).to_json

		return var_name + ': ' + var_value
	end

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


puts "Fino!!".to_json
puts pessoa.to_json
puts
arr = [1, 2, nil, "Oxi", pessoa]
puts arr.to_json
puts arr.to_s
