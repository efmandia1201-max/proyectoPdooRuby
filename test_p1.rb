#encoding:utf-8

require_relative "dice"
require_relative "directions"
require_relative "game_character"
require_relative "game_state"
require_relative "orientation"
require_relative "shield"
require_relative "weapon"

module Irrgarten
  class TestP1
    def self.main
      seccion("ENUMERADOS")
      pruebaEnumerados

      seccion("WEAPON")
      pruebaWeapon

      seccion("SHIELD")
      pruebaShield

      seccion("GAME STATE")
      pruebaGameState

      seccion("DICE (100 llamadas por método)")
      pruebaDice


    end

    def self.seccion(titulo)
      puts "\n===== #{titulo} ====="
    end

    def self.pruebaEnumerados
      puts "Directions:"
      Directions.constants.each do |direction|
        puts "#{direction} = #{Directions.const_get(direction).inspect}"
      end
      puts "Orientation:"
      Orientation.constants.each do |orientation|
        puts "#{orientation} = #{Orientation.const_get(orientation).inspect}"
      end
      puts "Game Character:"
      GameCharacter.constants.each do |gameCharacter|
        puts "#{gameCharacter} = #{GameCharacter.const_get(gameCharacter).inspect}"
      end
    end

    def self.pruebaWeapon
      armas = [Weapon.new(2, 3), Weapon.new(1, 1), Weapon.new(0, 0)]

      armas.each_with_index do |weapons, index|
        puts "Arma: #{index}\n#{weapons.to_s}"
      end

      w1 = Weapon.new(2, 3)
      attack1 = w1.attack
      attack2 = w1.attack
      attack3 = w1.attack

      sinUsos = w1.attack

      puts "Poder del primer ataque: #{attack1}, poder del segundo ataque: #{attack2}, 
      poder de attack3: #{attack3} y cuando se queda sin usos: #{sinUsos}\n"

      w2 = Weapon.new(2, 5)
      i = 0
      acabar = false
      while (i < 5 && !acabar)
        if(!w2.discard)
          puts "En el uso #{i}: El arma no se descarta"
        else
          puts "En el uso #{i}: El arma se descarta"
          acabar = true
        end
        w2.attack
        i = i + 1
      end
    end

    def self.pruebaShield
      shields = [Shield.new(2, 3), Shield.new(1, 1), Shield.new(0, 0)]
      
      shields.each_with_index do |shield, index|
        puts "Shield: #{index}\n#{shield.to_s}"
      end

      s1 = Shield.new(2, 3)
      protect1 = s1.protect
      protect2 = s1.protect
      protect3 = s1.protect
      
      sinUsos = s1.protect

      puts "\nPoder de la primera defensa: #{protect1}, poder de la segunda defensa: #{protect2}
      poder de la tercera defensa: #{protect3} y cuando se queda sin usos: #{sinUsos}\n"
      
      s2 = Shield.new(2, 5)
      i = 0
      acabar = false
      while (i < 5 && !acabar)
        if(!s2.discard)
          puts "En el uso #{i}: El escudo no se descarta"  
        else
          puts "En el uso #{i}: El escudo se descarta"
          acabar = true
        end
        s2.protect
        i = i + 1
      end
    end

    def self.pruebaGameState
      myGame = GameState.new("Mi laberinto", "player 1", "monster 1", 1, false, "log")
      puts "#{myGame.labyrinth}, #{myGame.players}, #{myGame.monsters}, #{myGame.current_player}, #{myGame.winner.inspect} y #{myGame.log}"
    end

    def self.pruebaDice
      contador = 0
      fueraRango = false
      while contador < 100
        valor = Dice.random_pos(4)
        if valor < 0 || valor >= 4
          fueraRango = true
        end
        contador = contador + 1
      end
      puts "randomPos(4) fuera de rango 0..3: #{fueraRango} (esperado false)"

      contador = 0
      fueraRango = false
      while contador < 100
        valor = Dice.who_starts(4)
        if valor < 0 || valor >= 4
          fueraRango = true
        end
        contador = contador + 1
      end
      puts "whoStart(4) fuera de rango 0..3: #{fueraRango} (esperado false)"

      contador = 0
      fueraRango = false
      suma = 0.0
      while contador < 100
        valor = Dice.random_intelligence
        if valor < 0 || valor >= 10
          fueraRango = true
        end
        suma = suma + valor
        contador = contador + 1
      end
      puts "randomIntelligence fuera de rango [0,10): #{fueraRango} (esperado false), media #{suma / 100} (esperado ~5)"

      contador = 0
      fueraRango = false
      suma = 0.0
      while contador < 100
        valor = Dice.random_strength
        if valor < 0 || valor >= 10
          fueraRango = true
        end
        suma = suma + valor
        contador = contador + 1
      end
      puts "randomStrength fuera de rango [0,10): #{fueraRango} (esperado false), media #{suma / 100} (esperado ~5)"

      contador = 0
      resurrecciones = 0
      while contador < 100
        if Dice.resurrect_player
          resurrecciones = resurrecciones + 1
        end
        contador = contador + 1
      end
      puts "resurrectPlayer: #{resurrecciones} true de 100 (esperado ~30)"

      contador = 0
      fueraRango = false
      while contador < 100
        valor = Dice.weapons_reward
        if valor < 0 || valor > 2
          fueraRango = true
        end
        contador = contador + 1
      end
      puts "weaponReward fuera de rango 0..2: #{fueraRango} (esperado false)"

      contador = 0
      fueraRango = false
      while contador < 100
        valor = Dice.shields_reward
        if valor < 0 || valor > 3
          fueraRango = true
        end
        contador = contador + 1
      end
      puts "shieldsReward fuera de rango 0..3: #{fueraRango} (esperado false)"

      contador = 0
      fueraRango = false
      while contador < 100
        valor = Dice.health_reward
        if valor < 0 || valor > 5
          fueraRango = true
        end
        contador = contador + 1
      end
      puts "healthReward fuera de rango 0..5: #{fueraRango} (esperado false)"

      contador = 0
      fueraRango = false
      while contador < 100
        valor = Dice.weapon_power
        if valor < 0 || valor >= 3
          fueraRango = true
        end
        contador = contador + 1
      end
      puts "weaponPower fuera de rango 0..2: #{fueraRango} (esperado false)"

      contador = 0
      fueraRango = false
      while contador < 100
        valor = Dice.shield_power
        if valor < 0 || valor >= 2
          fueraRango = true
        end
        contador = contador + 1
      end
      puts "shieldPower fuera de rango 0..2: #{fueraRango} (esperado false)"

      contador = 0
      fueraRango = false
      while contador < 100
        valor = Dice.uses_left
        if valor < 0 || valor > 5
          fueraRango = true
        end
        contador = contador + 1
      end
      puts "useLeft fuera de rango 0..5: #{fueraRango} (esperado false)"

      contador = 0
      fueraRango = false
      while contador < 100
        valor = Dice.intensity(7.5)
        if valor < 0 || valor >= 7.5
          fueraRango = true
        end
        contador = contador + 1
      end
      puts "intensity(7.5) fuera de rango [0,7.5): #{fueraRango} (esperado false)"

      usos = 0
      while usos <= 5
        contador = 0
        descartes = 0
        while contador < 100
          if Dice.discard_element(usos)
            descartes = descartes + 1
          end
          contador = contador + 1
        end
        puts "discardElement(#{usos}): #{descartes} true de 100 (esperado ~#{(5 - usos) * 20})"
        usos = usos + 1
      end
    end
  end
end

Irrgarten::TestP1.main