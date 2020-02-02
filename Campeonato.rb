#recebe o array de resultados para calcular a pontuacao por partida, gera a classificacao final e salva no arquivo .csv criado no diretorio raiz
class Campeonato

	def initialize(value)
        @resultados = value
    end

	def gerar_classificao
		
		@pontuacao_array = []
		@resultados.each_with_index do |lines, index|
			
			unless lines[0]['vencedor'] == 'null'
				@pontuacao_array.push('jogador' => lines[0]['vencedor'], 'pontos' => 3)
			else
				@pontuacao_array.push('jogador' => lines[0]['visitante'], 'pontos' => 2)
			end
			
			if lines[0]['punicao'] != []
				@pontuacao_array.push('jogador' => lines[0]['punicao'][0], 'pontos' => -1)
				if lines[0]['punicao'][1] != nil
					@pontuacao_array.push('jogador' => lines[0]['punicao'][1], 'pontos' => -1)
				end
			end
			
		end

		@classificacao_array = []
		@participantes = @pontuacao_array.map { |h| h['jogador'] }.uniq
		@pontuacao_total = 0
		@participantes.each do |participante|
			@pontuacao_individual_array = @pontuacao_array.select {|jogador| participante == jogador['jogador'] }
			@pontuacao_individual_array.each do |key|
				@pontuacao_total = @pontuacao_total + key['pontos']
			end
			@classificacao_array<<["jogador" => participante, "pontuacao_total" => @pontuacao_total]
			@pontuacao_total = 0
		end
		
		@classificacao_array = @classificacao_array.sort_by { |hsh| hsh[0]["pontuacao_total"] }.reverse
		
		CSV.open("classificacao.csv", "wb") do |csv|
			csv << ["CLASIFICAÇÃO", "PARTICIPANTE", "PONTUAÇÃO TOTAL"]
			@classificacao_array.each_with_index do |participante, index|
				csv << [index+1, participante[0]['jogador'], participante[0]['pontuacao_total']]
			end
		end

	end

end
