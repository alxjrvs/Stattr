module Stattr
  DICE_SIDES = 6 
  
#Classes 
# Extend these to increase the overall functionality of your app/game! 

  class Dice 
    attr_accessor :sides, :count
    def initialize(sides=DICE_SIDES, count=1)
      @sides = sides
      @count = count
    end

    def self.roll(sides=DICE_SIDES, count=1)
      new(sides, count).roll
    end  

    def rolls
      (1..count).map { |d| rand(sides) + 1 }
    end

    def roll
      rolls.inject(0) { |total, d| total += d }
    end  
  end

	class Statlist 
	  attr_accessor :str, :dex, :cha, :con, :wis, :int
    def initialize(str, dex, cha, con, wis, int) 
      @str = modstat(str)
      @dex = modstat(dex) 
      @cha = modstat(cha)
      @con = modstat(con)
      @wis = modstat(wis)
      @int = modstat(int)
    end
    def modstat(r)
      modr = ((r-10)/2).to_int
      modlist = [r, modr]
      modlist
    end
  end

	class Charactersheet 
  	attr_accessor :stats, :name

  	def initialize(name) 
    	@name = name
    	@stats = Statlist.new(0,0,0,0,0,0)
  	end
		
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
		end
	end

  class Player 
    attr_accessor :fname, :lname, :characters
    
    def initialize(fname, lname)
      @fname = fname
      @lname = lname 
      @characters = []
    end
  
    def roll_char(name)
      new_char = Charactersheet.roll_char(name)
      self.characters << new_char 
    end
  end
      
end 


