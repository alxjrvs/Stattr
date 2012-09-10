# Stattr includes some basic functions that could be used in a Tabletop RPG application
#
# @author Alex Jarvis

module Stattr

  # The Class that defines, in other applications, the "rules" of that game - the stats, the  sides of a given die, and so on.
  #
  class System
    @dice_num = 3
    @stats = ["str", "con", "wis", "int", "cha", "dex"]

    # The math for generating a stat.
    #
    # @return [Object]
    #
    def self.make_stat(val=1)
      Stat.new(Rollr::D6.roll(3))
    end #make_stat

    # The list of stats for this game.
    #
    # @return [Array]
    #
    def self.stats
      @stats
    end #self.stats
  end #System

  
  class StatList

    # Creates an attr_accessor for each stat in STAT
    #
    # @attribute STATS [Integer] any number of Stats.
    #
    attr_accessor *System.stats

    # Creates a new StatList object. each stat in STAT is an attribute, with the result of makestat assigned to it
    #
    def initialize
       System.stats.each { |s| instance_variable_set("@#{s}", System.make_stat) }
    end #initialize

    # Allow manual setting of stats.
    #
    # @param [Attribute] stat
    # @param [Integer] val
    #
    def set_stat(stat, value)
      send "#{stat}=", Stat.new(value)
    end #set_stat
  end #StatList

  #  Representing a stat in a game.
  #
  class Stat

    # @attribute val [Integer] The value of the stat
    # @attribute mod [Integer] The Calculated modifier of the stat
    #
    attr_accessor :val, :mod

    def initialize(value)
      @val= value
      @mod= modstat(value)
    end
    # Creates stat/mod array.
    #
    # @return [Integer] modlist. Returns the modifier.
    #
    def modstat(r)
      modr = ((r-10)/2).to_int
    end #modstat

    # makes a Stat/mod combination
    #
    # @return [Array]
    #
  end #Stat

  # CharacterSheet of a given PlayerCharacter.
  #
  class CharacterSheet

    # @attribute stats [Object] A StatList object
    # @attribute name [String] The Player Character's name
    #
    attr_accessor :stats, :name

    # new instance of CharacterSheet
    # @param [String] name
    #
    def initialize(name)
      @name = name
      @stats = StatList.new
    end #initialize

    # This is how you roll a brand new random character.
    #
    # @param [String] name
    # @return [Object] New Charactersheet
    #
    def self.roll_char(name)
      char = CharacterSheet.new(name)
      char.stats = StatList.new
      char
    end # self.roll_char
  end #CharacterSheet

  # Player class represents a human, who may have multiple character sheets.
  #
  class Player

  # @attribute fname [String] The First Name of the Player
  # @attribute lname [String] The last Name of the Player
  # @attribute characters [Array] An array containing Charactersheet objects
  #
  attr_accessor :fname, :lname, :characters

    # Create new Player object
    #
    # @param [String] fname
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

  # DM class extends player, fresh for modifying.
  #
  class DM < Player
  end #DM
end #Stattr
