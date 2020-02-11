#recebe o arquivo de texto e transforma em array
class Jogadas

    def initialize(filename)
        file = File.open(filename)
        file_read = file.readlines[1..-1].map(&:chomp)
        @jogadas = file_read
    end

    #SET
    def read_file
        @jogadas_array = []
        @jogadas.each_with_index do |lines, index|
            @lines =  lines.gsub("\n", ' ').squeeze(' ').split(' ')
            @jogada = [
				"mandante" 		=> @lines[0], 
				"visitante" 		=> @lines[2], 
				"mandante_pulos" 	=> @lines[3], 
				"visitante_pulos" 	=> @lines[5]
			]
            @jogadas_array << @jogada
        end
		@jogadas_array
    end

end
