def hello        # cria método
  'Hello'        # a última linha do método sempre é o retorno  
end

puts hello       # executa o método



def hello1(name)          # pode ter parênteses na declaração do método
  'Hello ' + name
end

puts( hello1('Jessé') )   # pode ter parênteses para executar



def hello2 name          # pode ser sem parênteses a declaração do método
  'Hello again ' + name
end

puts hello2 'Jessé'      # também não precisa de parênteses para executar


## valores DEFAULT

def mtd(arg1="Maria", arg2="Jósé", arg3="Teofilo")  # é possível atribuir valores default aos argumentos
  "#{arg1}, #{arg2}, #{arg3}"
end

puts mtd
puts mtd "Rosana"


## ALIAS

alias helloman hello      # com 'alias' é possível criar apelidos para os métodos

def hello
  'Hello updated'
end

puts helloman
puts hello


# VAR-ARG metodo com numero variavel de argumentos

def varArgTest *variables
	puts variables.class
	variables.inspect
end

puts varArgTest 'hello', 'world' # nao ha limites de qntde de argumentos a serem chamados
puts varArgTest()


def varArgTest2 var1, *variables, var2, var3     # o var-arg pode estar presente em qualquer ordem na lista de argumentos
	variables.inspect
end

#puts varArgTest2 'a', 'b'             			# erro pois o metodo precis de pelo menos 3 argumentos
puts varArgTest2 'a', 'b', 'c'
puts varArgTest2 'a', 'b', 'c', 'd', 'e'
puts varArgTest2 'a', 'b', 'c', 'd', 'e', 'f'


# BANG (!) METHODS metodo que altera o valor do proprio objeto. Se nao for bang, ele faz alteracao e a retorna em um novo objeto

minha_var = 'TeStE dE cAmEl CaSe'

puts minha_var.downcase
puts minha_var

puts minha_var.downcase!
puts minha_var

# metodos terminados com (?): por convensao sao metodos que respondem a uma pergunta, geralmente retornam true ou false.