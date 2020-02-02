require 'csv'
require_relative 'Jogadas.rb'
require_relative 'Campeonato.rb'
require_relative 'Resultados.rb'
require_relative 'Partidas.rb'

jogadas = Jogadas.new('jogadas.txt')
jogadas_array = jogadas.read_file

partidas = Partidas.new(jogadas_array)
partidas_array = partidas.agrupa_jogadas

resultados = Resultados.new(partidas_array)
resultados_array = resultados.resultado_partida

campeonato = Campeonato.new(resultados_array)
campeonato_array = campeonato.gerar_classificao