#recebe o array de jogadas agrpa as trincas de jogadas em partidas
class Partidas

    def initialize(jogadas)
        @jogadas = jogadas
    end

    def agrupa_jogadas
        @jogadas_array = []
        @partidas_array = []
        @jogadas.each_with_index do |lines, index|
            @jogadas_array << lines
            if ( (index + 1) % 3.0) == 0 
                partida = index + 1 / 3
                @partidas_array << ["partida" => @jogadas_array]
                @jogadas_array = []
            end
        end
        @partidas_array
    end

end