#receber o array de partidas calcula as bonificacoes de cada jogada, soma as jogadas e calcula o resultado geral da partida
class Resultados
	
	def initialize(value)
        @partidas = value
    end

    def resultado_partida

        @resultado_array = []

        @partidas.each_with_index do |lines, index|
            @mandante					= lines[0]['partida'][0][0]['mandante']
            @visitante					= lines[0]['partida'][0][0]['visitante']
            @mandante_pulos_j1			= lines[0]['partida'][0][0]['mandante_pulos'].to_i
            @visitante_pulos_j1			= lines[0]['partida'][0][0]['visitante_pulos'].to_i
            @mandante_pulos_j2			= lines[0]['partida'][1][0]['mandante_pulos'].to_i
            @visitante_pulos_j2			= lines[0]['partida'][1][0]['visitante_pulos'].to_i
            @mandante_pulos_j3			= lines[0]['partida'][2][0]['mandante_pulos'].to_i
            @visitante_pulos_j3			= lines[0]['partida'][2][0]['visitante_pulos'].to_i

            #soma pontuacao da partida
            @mandante_soma_pulos_pertida		= @mandante_pulos_j1 + @mandante_pulos_j2 + @mandante_pulos_j3
            @visitante_soma_pulos_pertida		= @visitante_pulos_j1 + @visitante_pulos_j2 + @visitante_pulos_j3

            #bonificacao por pontuacao superior a 10 na partida
            @mandante_bonus_1			= @mandante_soma_pulos_pertida > 10 ?  2 : 0
            @visitante_bonus_1			= @visitante_soma_pulos_pertida > 10 ? 2 : 0

			#bonificacao por pulos iguais nas tres jogadas
			@visitante_bonus_2	= 0
			@mandante_bonus_2 	= 0
			if (@mandante_pulos_j1 == @mandante_pulos_j2) and (@mandante_pulos_j2 == @mandante_pulos_j3)
				@mandante_bonus_2 	= (@mandante_soma_pulos_pertida * 1.1).round
			end

			if (@visitante_pulos_j1 == @visitante_pulos_j2) and (@vistante_pulos_j2 == @visitante_pulos_j3)
				@visitante_bonus_2	= (@visitante_soma_pulos_pertida * 1.1).round
			end

            #pontuacao final
			@mandante_placar_final    = @mandante_soma_pulos_pertida + @mandante_bonus_1 + @mandante_bonus_2
			@visitante_placar_final   = @visitante_soma_pulos_pertida + @visitante_bonus_1 + @visitante_bonus_2

			@vencedor = ""
			if @mandante_soma_pulos_pertida != @visitante_soma_pulos_pertida
				@vencedor =  @mandante_soma_pulos_pertida > @visitante_soma_pulos_pertida ? @mandante : @visitante
			end

			@jogadores_punidos = []
			if @mandante_soma_pulos_pertida < 3
				@jogadores_punidos<<@mandante
			end
			if @visitante_soma_pulos_pertida < 3
				@jogadores_punidos<<@visitante
			end
				
			
			@resultado = [
				"mandante" 					=> @mandante, 
				"visitante" 				=> @visitante,
				"mandante_placar_final" 	=> @mandante_placar_final,
				"visitante_placar_final"	=> @visitante_placar_final,
				"vencedor" 					=> @vencedor == "" ? "null" : @vencedor,
				"punicao" 					=> @jogadores_punidos == "" ? "null" : @jogadores_punidos,
			]
			@resultado_array << @resultado
        end
        @resultado_array
	end
	
end