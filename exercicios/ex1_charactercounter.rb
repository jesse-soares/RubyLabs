=begin
	
1) Criar um método que receba 2 parâmetros, 1 texto e 1 caracter e retorne a quantidade de vezes que o caracter é encontrado no texto

2) Criar um método que receba 2 parâmetros, 1 texto e 1 array de caracteres e retorne a quantidade de vezes que os caracteres são encontrados no texto

=end

def contaCaracter texto, caracter
	str = texto.scan(caracter)
	puts "Exercício 1: A quantidade de vezes que o caracter '" + str[0] +"' apareceu foram " + str.size.to_s + " vezes." 
end

contaCaracter('kadu kadu kaduk', 'k')	

def contaCaracterComArray texto, array

	array.each { |c| 
				 str = texto.scan(c)
				 puts "Exercício 2: A quantidade de vezes que o caracter '" + c + "' apareceu foram " + str.size.to_s + " vezes."}	
end

contaCaracterComArray 'kadu kadu kaduk', ['u', 'a']
