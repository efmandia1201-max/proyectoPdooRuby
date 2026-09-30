require 'random/formatter'

module Irrgarten
  class Dice
    @@MAX_USES = 5
    @@MAX_INTELLIGENCE = 10.0
    @@MAX_STRENGTH = 10.0
    @@RESURRECT_PROB = 0.3
    @@WEAPON_REWARD = 2
    @@HEALTH_REWARD = 3
    @@MAX_ATTACK = 3
    @@MAX_SHIELD = 3

    @@generator = Random.new
  end

  def self.randomPos(max)
    @@generator.rand(max)
  end

  def self.whoStart(nplayer)
    @@generator.rand(nplayer)
  end

  def self.randomIntelligence
    @@generator.rand(@@MAX_INTELLIGENCE)
  end

  def self.randomStrength
    @@generator.rand(@@MAX_STRENGTH)
  end

  def self.resurrectPlayer
    if(@@generator.rand < @@RESURRECT_PROB)
      return true
    else
      return false
    end
  end
end