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

	class StatList 

	  attr_accessor :str, :dex, :cha, :con, :wis, :int

    def initialize(str=10, dex=10, cha=10, con=10, wis=10, int=10)  # :notnew:
      @str = modstat(str)
      @dex = modstat(dex) 
      @cha = modstat(cha)
      @con = modstat(con)
      @wis = modstat(wis)
      @int = modstat(int)
    end #initialize
      
    def modstat(r)
      modr = ((r-10)/2).to_int
      modlist = [r, modr]
      modlist
    end #modstat
  end #StatList

	class Charactersheet 
  	attr_accessor :stats, :name

  	def initialize(name) # :notnew:
    	@name = name
    	@stats = StatList.new(10,10,10,10,10,10)
  	end #initialize 
		
		def self.roll_char(name)
      char = Charactersheet.new(name) 
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

  class Player 
    attr_accessor :fname, :lname, :characters
    
    def initialize(fname, lname) # :notnew:
      @fname = fname
      @lname = lname 
      @characters = []
    end #initialize
  
    def new_char(name)
      new_char = Charactersheet.roll_char(name)
      self.characters << new_char 
    end #roll_char
  end #Player
      
end #Stattr
