=begin NOTES

- Modulos tem o mesmo comportamento de classes, porem não podem ser instanciados nem herdados.

=end

# Modules como NAMESPACES - Agrupamento de classes em um mesmo escopo

module Secure						# módulo como namespace (CamelCase)

	ROLE_ACESSO_SISTEMA = 'Role+AcessoSistema'

	class User

		attr_accessor :roles, :login, :pwd

		def initialize
			self.roles = [ROLE_ACESSO_SISTEMA]		# não é necessário declarar o namespace dentro do mesmo escopo
		end
	end

end

user = Secure::User.new 			# fora do escopo é obrigatório declarar o namespace para acessar os componentes
puts user.roles.inspect

puts 'User1 autorizado!' if user.respond_to?('authorize?') && user.authorize?



# Modules como MIXINS - reaproveitamento de código

module Authorizable					# mixin a ser reaproveitado por outras classes

	def authorize?
		self.roles.member? Secure::ROLE_ACESSO_SISTEMA			# a classe que fizer o include deve ter o atributo 'roles'
	end

end


class Secure::User

	include Authorizable			# Alterando o comportamento da classe 'User' incluindo o codigo do mixin

end

user2 = Secure::User.new
puts 'User2 autorizado!' if user2.authorize?

puts 'User1 autorizado novamente!' if user.respond_to?('authorize?') && user.authorize?

puts 'User é um Authorizable' if user.is_a? Authorizable	# ao fazer o include em um mixin, o modulo se torna um ancestral da classe



# MIXINS com Extend - insere os metodos a nivel de classe, não de instancia

module Builder

	def build attributes={}

		new_object = new

		attributes.each do |name, value|

			new_object.send "#{name}=", value		# mesmo que: 'new_object.name = value'
		end

		new_object
	end
end

class Secure::User

	extend Builder			# adiciona os metodo do modulo a nivel de classe

end


user3 = Secure::User.build({:login => 'jesse', :pwd => '123456'})
puts user3.login