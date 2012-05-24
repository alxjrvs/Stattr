# Stattr includes some basic functions that could be used in a Tabletop RPG application
#
# @author Alex Jarvis

module Stattr

  # How many sides the most common die has - rewrite to fit your game.
  #
  DICE_SIDES = 6

  # Represents a single instance of the result of a dice roll
  #
  class DiceRoll

    # @attribute sides [Integer] The number of sides the dice in this roll have.
    #
    # @attribute count [Integer] The number of die being rolled.
    #
    attr_accessor :sides, :count

    # New instance of DiceRoll.
    #
    # @param [Integer] sides
    #
    # @param [Integer] count
    #
    # @return [Object] DiceRoll object
    #
    def initialize(sides=DICE_SIDES, count=1)
      @sides = sides
      @count = count
    end #initialize

    # Roll a new die.
    #
    # @param [Integer] sides
    #
    # @param [Integer] count
    #
    # @return [Object] DiceRoll object
    #
    def self.new_roll(sides = DICE_SIDES, count=1)
      # make a new dice object, then roll it.
      new(sides, count).roll
    end #self.roll

    # From 1 to count, that many [sides] sided die.
    #
    # @return [Integer] Gives each outcome to Roll.
    #
    def rolls
      (1..count).map { |d| rand(sides) + 1 }
    end #rolls

    # Adds the rolls from rolls together.
    #
    # @return [Integer] combined rolls
    #
    def roll
      rolls.inject(0) { |total, d| total += d }
    end #roll
  end #DiceRoll

  # Represents the list of Statistics that a player has.
  #
  class StatList

    # A list of all stats. Currently locked into D+D style stats.
    #
    attr_accessor :str, :dex, :cha, :con, :wis, :int

    # Create a new Statlist.
    #
    # @param [Array] str
    #
    # @param [Array] dex
    #
    # @param [Array] cha
    #
    # @param [Array] con
    #
    # @param [Array] wis
    #
    # @param [Array] int
    #
    def initialize(str=10, dex=10, cha=10, con=10, wis=10, int=10)
      @str = modstat(str)
      @dex = modstat(dex)
      @cha = modstat(cha)
      @con = modstat(con)
      @wis = modstat(wis)
      @int = modstat(int)
    end #initialize

    # Takes a given value of a stat and creates a D+D style modifier.
    #
    # @return [Array] modlist. [0] is the stat, [1] is the modifier.
    #
    def modstat(r)
      modr = ((r-10)/2).to_int
      modlist = [r, modr]
      modlist
    end #modstat
  end #StatList

  # CharacterSheet of a given PlayerCharacter.
  #
  class CharacterSheet

    # @attribute stats [Object] A StatList object
    #
    # @attribute name [String] The Player Character's name
    #
    attr_accessor :stats, :name

    # new instance of CharacterSheet
    #
    # @param [String] name
    #
    def initialize(name)
      @name = name
      # creates StatList object with '10' as a default for each.
      @stats = StatList.new(10,10,10,10,10,10)
    end #initialize

    # This is how you roll a brand new random character.
    #
    # @param [String] name
    #
    # @return [Object] New Charactersheet
    #
    def self.roll_char(name)
      char = CharacterSheet.new(name)
      char.stats = StatList.new(
      DiceRoll.new_roll(DICE_SIDES, 3),
      DiceRoll.new_roll(DICE_SIDES, 3),
      DiceRoll.new_roll(DICE_SIDES, 3),
      DiceRoll.new_roll(DICE_SIDES, 3),
      DiceRoll.new_roll(DICE_SIDES, 3),
      DiceRoll.new_roll(DICE_SIDES, 3)
      )
      char
    end # self.roll_char
  end #CharacterSheet

  # Player class represents a human, who may have multiple character sheets.
  #
  class Player

  # @attribute fname [String] The First Name of the Player
  #
  # @attribute lname [String] The last Name of the Player
  #
  # @attribute characters [Array] An array containing Charactersheet objects
  #
  attr_accessor :fname, :lname, :characters

    # Create new Player object
    #
    # @param [String] fname
    #
    # @param [String] lname
    #
    def initialize(fname, lname)
      @fname = fname
      @lname = lname
      @characters = []
    end #initialize

    # Creates a new randomly generated character associated with Player
    #
    # @param [String] name
    #
    def new_char(name)
      new_char = CharacterSheet.roll_char(name)
      self.characters << new_char
    end #roll_char
  end #Player

end #Stattr
