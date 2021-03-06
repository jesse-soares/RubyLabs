
s = 'hello'     # não precisa declarar a variável
puts s.class

s = 154
puts s.class    # é possível alterar o tipo


puts 'I am in class=' + self.class.to_s
puts 'I am an object=' + self.to_s
print 'The object methods are = '
puts self.private_methods.sort

puts self   # objeto 'main' criado pelo ruby que representa o programa em execução (self é similar ao this do java)
			# todo metodo precisa de um objeto, entao o metodo 'puts' pertence ao objeto 'main' criado implicitamente



# CONVENSOES

PI = 3.1416            # contante. Basta colocar a primeira letra do nome da variável em maiúsculo.
puts PI

PI = 'hi'              # alterar o valor de uma constante gera um warning mas é permitido. =/
puts PI

## VARIÁVEIS

# local - nome_variavel
# instância - @nome_variavel
# classe (static) - @@nome_variavel
# globais - $nome_variavel
# constantes - Nome_variavel ou NOME_VARIAVEL


## MÉTODOS

# devem começar com letra minúscula ou '_'.
# existem 3 sufixos permitidos '?', '!', '='. Ex.: :equals?, :reverse!, :nome=

## CLASSES

# CamelCase



## TIPOS BÁSICOS EM RUBY

# Numeric (Fixnum, Integer e Float)
# String
# Array
# Hash
# Object
# Symbol
# Range
# RegExp