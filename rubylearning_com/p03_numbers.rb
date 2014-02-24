# Numbers

puts 1_000_000     	# _ é ignorado dentro de um número
puts 1 + 1
puts 3 / 2          # operacao com inteiros retorna um inteiro
puts 1.5 / 2.6      # operacao com floats retorna um float
puts 1 + 1.5


# alguns operadores
puts 2**10          # exponencial. 2 elevado a 10
puts !30            # not
puts 11 % 3         # resto da divisão


### NOTES

# inteiros são objetos da classe Integer que herdam de Numeric. Podem ser Fixnum ou Bignum
# floats são objetos da classe Float que herdam de Numeric
# ruby não possui os operadores '++' e '--', mas possui os operadores '+=' e '-='