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
    return (@@generator.rand < @@RESURRECT_PRO)
  end

  def self.weaponReward
    @@generator.rand(@@WEAPON_REWARD + 1)
  end

  def self.shieldsReward
    @@generator.rand(@@MAX_SHIELD + 1)
  end

  def self.healthReward
    @@generator.rand(@@HEALTH_REWARD + 1)
  end

  def self.weaponPower
    @@generator.rand(@@MAX_ATTACK)
  end

  def self.shieldPower
    @@generator.rand(@@MAX_SHIELD)
  end

  def self.useLeft
    @@generator.rand(@@MAX_USES + 1)
  end

  def self.intensity(competence)
    @@generator.rand(competence)
  end

  def self.discardElement(usesLeft)
    probabily = (@@MAX_USES - usesLeft) / @@MAX_USES;
    @@generator.rand < probabily
  end
end