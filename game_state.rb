module Irrgarten
  class GameState
    
    def initialize(labyrinth, players, monsters, currentPlayer, winner, log)
      @labyrinth = labyrinth
      @players = players
      @monsters = monsters
      @currentPlayer = currentPlayer
      @winner = winner
      @log = log
    end

    attr_reader :labyrinth,
                :players,
                :monsters,
                :currentPlayer,
                :winner,
                :log

  end
end