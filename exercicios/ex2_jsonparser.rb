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

		return "null" if self.nil?

		return self if self.is_primitive?

		return '"' + self + '"' if self.is_a? String

		return self.array_to_json if self.is_a? Array

		return self.hash_to_json if self.is_a? Hash
	end


	def object_to_json	

		properties = []

		self.instance_variables.map do |var|

			properties

			[var, self.instance_variable_get(var)].join(":")
		end

		return properties.join(', ')
	end

	def array_to_json
		
		json_array = []

		self.each { |value| json_array << value.to_json }

		return '[' + json_array.join(', ') + ']'
	end


end


class Pessoa

	@nome = "Eduardo"

end
	
b = Pessoa.new

puts [1, 2, 3, 4, "5", "Caraca Muleke"].to_json
