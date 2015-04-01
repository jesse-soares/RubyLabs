=begin
1) Criar um método que receba 2 parâmetros, 1 texto e 1 caracter e retorne a quantidade de vezes que o caracter é encontrado no texto

2) Criar um método que receba 2 parâmetros, 1 texto e 1 array de caracteres e retorne a quantidade de vezes que os caracteres são encontrados no texto
=end

def numero_de_ocorrencias(caracter="", texto="")	
	return texto.count(caracter)	
end

texto = "asdasdSs"

puts "Ocorrencias de \'s\' em #{texto}: " + numero_de_ocorrencias("s", "asdasdSs").to_s

texto = 'Eduardo Assis da Silva'
array_de_caracteres = ["a", "a", "A", "s", "d", '']

def numeros_de_ocorrencias_por_caracter_no_texto(caracteres=[], texto="")
	
	ocorrencias = Hash.new

	caracteres.each do |caracter|
			
		if ocorrencias[caracter].nil?
			ocorrencias[caracter] = numero_de_ocorrencias(caracter, texto)
		end
	end

	return ocorrencias
end

puts "Número de ocorrencias de cada caracter do array #{array_de_caracteres.to_s} no texto \'#{texto}\': \n" + numeros_de_ocorrencias_por_caracter_no_texto(array_de_caracteres, texto).to_s