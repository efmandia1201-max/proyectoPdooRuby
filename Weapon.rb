require_relative "dice.rb"

module Irrgarten
  class Weapon

    def initialize (power, uses)
      @power = power.to_f
      @uses = uses
    end

    def attack
      if(@uses > 0)
        @uses -= 1
        return @power
      end

      0.0
    end

    def discard
      Dice.discard_element(@uses)
    end

    def to_s
      "W[#{@power}, #{@uses}]"
    end
  end
end