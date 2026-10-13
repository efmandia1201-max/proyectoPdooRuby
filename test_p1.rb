require_relative "dice"
require_relative "direction"
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
        puts "Arma: #{index}\n"
        puts "#{weapons.to_s}"
      end

      w1 = Weapon.new(2, 3)
      attack1 = w1.attack
      attack2 = w1.attack
      attack3 = w1.attack

      sinUsos = w1.attack

      puts "\nPoder del primer ataque: #{attack1}, poder del segundo ataque: #{attack2}, 
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
        i = i + 1;
      end
    end

  end
end

Irrgarten::TestP1.main