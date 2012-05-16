module Stattr
  DICE_SIDES = 6 
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
  
#Classes 
# Extend these to increase the overall functionality of your app/game! 


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
	 	  modlist = []
  	    case r
   		  when 3
      	  modlist = [r, -4]
    	  when (4..5) 
      	  modlist = [r, -3]
    	  when (6..7)
       	  modlist = [r, -2]
    	  when (8..9)
       	  modlist = [r, -1]
    	  when (10..11)
       	  modlist = [r, 0]
    	  when (12..13)
       	  modlist = [r, 1]
        when (14..15)
          modlist = [r, 2]
        when (16..17)
          modlist = [r, 3]
        when 18
          modlist = [r, 4]
      end
      modlist
    end
  end

	class Playerchar
  	attr_accessor :stats, :name

  	def initialize(name) 
    	@name = name
    	@stats = Statlist.new(0,0,0,0,0,0)
  	end
		
		def self.roll_char(name)
			char = Playerchar.new(name) 
			char.stats = Stattr::Statlist.new(
			Stattr::Dice.roll(DICE_SIDES, 3),
			Stattr::Dice.roll(DICE_SIDES, 3),
			Stattr::Dice.roll(DICE_SIDES, 3),
			Stattr::Dice.roll(DICE_SIDES, 3),
			Stattr::Dice.roll(DICE_SIDES, 3),
			Stattr::Dice.roll(DICE_SIDES, 3)
			)
		char	
		end
	end
end 


