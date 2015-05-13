#!/usr/bin/env ruby

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

class Object

	def is_primitive?
		return ((self.is_a? Numeric) || (self.is_a? TrueClass) || (self.is_a? FalseClass))
	end

	def to_json

		return '"' + "null" + '"' if self.nil?

		return self if self.is_primitive?

		return '"' + self + '"' if self.is_a? String

		return self.array_to_json if self.is_a? Array

		return self.hash_to_json if self.is_a? Hash

		return object_to_json
	end

	def object_to_json	

		properties = []

		self.instance_variables.map do |var|

			property_name = '"'+ var.to_s.gsub!(/@/, '') + '"'

			property_value = self.instance_variable_get(var)

			properties << [property_name, property_value.to_json].join(":")
		end

		return '{ ' + properties.join(', ') + ' }'
	end

	def array_to_json
		
		json_array = []

		self.each { |value| json_array << value.to_json }

		return '[' + json_array.join(', ') + ']'
	end

	def hash_to_json

		properties = []

		self.each do|key,value|

			property_name = '"' + key + '"'
			property_value = value.to_json

  			properties << [property_name, property_value].join(":")
		end

		return '{ ' + properties.join(', ') + ' }'
	end

end


class Pessoa

	attr_accessor :nome, :idade, :aposentado, :filhos
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
arr = [1, 2, nil, "Oxi", pessoa, {"oplas" => pessoa}]
puts arr.to_json
puts arr.to_s
