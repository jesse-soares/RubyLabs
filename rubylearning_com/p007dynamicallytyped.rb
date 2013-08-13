
s = 'hello'     # não precisa declarar a variável
puts s.class

s = 154
puts s.class    # é possível alterar o tipo


puts 'I am in class=' + self.class.to_s
puts 'I am an object=' + self.to_s
print 'The object methods are = '
puts self.private_methods.sort

puts self   # objeto 'main' criado pelo ruby que representa o programa em execução


## VARIÁVEIS

# local - nome_variavel
# instância - @nome_variavel
# classe (static) - @@nome_variavel
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