puts `dir`             # um string com o caracter especial '`' é executada no terminal do sistema

puts "In which city do you stay?"
STDOUT.flush

city = gets.chomp         # le entrada do teclado

puts 'How old are you?'
age = gets.chomp

puts 'The city is ' + city + ' and you have ' + age + ' years old'