=begin
	
1) Criar um método que receba 2 parâmetros, 1 texto e 1 caracter e retorne a quantidade de vezes que o caracter é encontrado no texto

2) Criar um método que receba 2 parâmetros, 1 texto e 1 array de caracteres e retorne a quantidade de vezes que os caracteres são encontrados no texto

=end

def char_count text, char
	(text.count char).to_s + " ocorrência(s) do caracter '#{char}' encontrada(s)"
end

puts 'Digite o caracter que deseja buscar: '
char = gets.chomp

puts char_count 'Garçom, aqui nessa mesa de bar, voce já cansou de escutar, centenas de casos de amor...', char
