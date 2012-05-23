# Stattr includes some basic functions that could be used in a Tabletop RPG application
#
# @author Alex Jarvis

module Stattr
  # How many sides the most common die has 
  DICE_SIDES = 6 
    
  # Represents a single instance of the result of a dice roll  
  class Dice 

    attr_accessor :sides, :count

    def initialize(sides=DICE_SIDES, count=1)
      @sides = sides
      @count = count
    end #initialize

    def self.roll(sides=DICE_SIDES, count=1)
      new(sides, count).roll
    end #self.roll
    
    def rolls
      (1..count).map { |d| rand(sides) + 1 }
    end #rolls

    def roll
      rolls.inject(0) { |total, d| total += d }
    end #roll
  end #Dice

	class Statlist 

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
    	@stats = Statlist.new(10,10,10,10,10,10)
  	end #initialize 
		
		def self.roll_char(name)
      char = Charactersheet.new(name) 
      char.stats = Statlist.new(
      Dice.roll(DICE_SIDES, 3),
      Dice.roll(DICE_SIDES, 3),
      Dice.roll(DICE_SIDES, 3),
      Dice.roll(DICE_SIDES, 3),
      Dice.roll(DICE_SIDES, 3),
      Dice.roll(DICE_SIDES, 3)
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
