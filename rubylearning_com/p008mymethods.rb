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




def mtd(arg1="Maria", arg2="Jósé", arg3="Teofilo")  # é possível atribuir valores default aos argumentos
  "#{arg1}, #{arg2}, #{arg3}"
end

puts mtd
puts mtd "Rosana"



alias helloman hello      # com 'alias' é possível criar apelidos para os métodos

def hello
  'Hello updated'
end

puts helloman
puts hello