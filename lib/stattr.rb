module Stattr
  Normstats = ['STR', 'DEX', 'CHA', 'INT', 'WIS', 'CON'] 
  
  class Dice 
    attr_accessor :sides, :count
    def initialize(sides=6, count=1)
      @sides = sides
      @count = count
    end

    def self.roll(sides=6, count=1)
      new(sides, count).roll
    end  

    def rolls
      (1..count).map { |d| rand(sides) + 1 }
    end

    def roll
      rolls.inject(0) { |total, d| total += d }
    end  
  end

#This iterates through the Stat list and turns each stat into a key. It then rolls 3 d6's to get the starting value for that stat.
	def statroll 
  	stathash = {} 
    	Normstats.each do |stat|
      	stathash[stat] = modstat(Stattr::Dice.roll(6,3))
    	end
  	stathash
	end


#Classes 
# Extend these to increase the overall functionality of your app/game! 


	class Statlist 
		attr_accessor :str, :dex, :cha, :con, :wis, :int
		@@sides = 6 
		@@dicenum = 3 
    def initialize(str, dex, cha, con, wis, int) 
        @str = str
        @dex = dex
        @cha = cha 
        @con = con
        @wis = wis
        @int = int
    end
    def self.rand_stats
				Statlist.new(
				modstat(Stattr::Dice.roll(@@sides,@@dicenum)),
				modstat(Stattr::Dice.roll(@@sides,@@dicenum)),
				modstat(Stattr::Dice.roll(@@sides,@@dicenum)),
				modstat(Stattr::Dice.roll(@@sides,@@dicenum)),
				modstat(Stattr::Dice.roll(@@sides,@@dicenum)),
				modstat(Stattr::Dice.roll(@@sides,@@dicenum)))
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
   		else 
        puts "nothing"
    end
		modlist
	end
end

	class Playerchar
  	attr_accessor :stats, :name

  	def initialize(name) 
    	@name = name
    	@stats = Statlist.new
  	end
		
		def self.roll_char(name)
			 Stattr::Playerchar.create(:name => name, :stats => Stattr::Statlist.rand_stats)
		end
	end
end 


