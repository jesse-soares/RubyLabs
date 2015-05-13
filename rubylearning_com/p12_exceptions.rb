=begin NOTES

- begin 	== try
- rescue	== catch
- ensure	== finally
- raise		== throw

=end

def calcula_valor_parcela preco_total, num_parcelas

	begin
		preco_total / num_parcelas

	rescue ZeroDivisionError
		"O número de parcelas não pode ser zero!"

	rescue
		"Erro ao calcular valor da parcela!"

	ensure
		puts "Calculado!"
	end
	
end

puts calcula_valor_parcela 1000, 10
puts calcula_valor_parcela 1000, 0
puts calcula_valor_parcela "", 10