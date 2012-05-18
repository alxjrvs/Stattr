module Stattr

  ##
  # A universal holder for the default die used in rolling
  #
  # @since 05-15-2012
  #
  DICE_SIDES = 6 

  class Dice 
    attr_accessor :sides, :count
    ##
    # This is the Dice object, meant to simulate a physical Die, and the outcome of said 
    # die.
    #
    # @since 05-15-2012
    #
    # @sides [Fixnum] Each Dice has sides, defaulting to the unviersal DICE_SIDES number.
    # 
    # @count [Fixnum] Each Dice has a number of 'die', defalting to one.
    #
    def initialize(sides=DICE_SIDES, count=1)
      @sides = sides
      @count = count
    end #initialize

    ##
    # The self.roll method, which rolls the die with SIDES and DIE input. 
    #
    # A brief explanation: we pass sides and count. Roll creates a new instance of 
    # Dice with those attributes, and then calls the instance method roll. 
    # this roll method then calls the instance method rolls, which rolls the die
    # [count] times. 
    #
    # @since 05-15-2012
    #
    # @sides [Fixnum]  Each Dice has sides, defaulting to the unviersal DICE_SIDES number.
    # 
    # @count [Fixnum] Each Dice has a number of 'die', defalting to one.
    #
    def self.roll(sides=DICE_SIDES, count=1)
      new(sides, count).roll
    end #self.roll
    
    ## 
    # rolls, which is used in the roll instance method. This takes the 'count  
    #
    # @since 05-15-2012
    # 
    # @param [Fixnum] Each Dice has sides, defaulting to the unviersal DICE_SIDES number.
    # 
    # @param [Fixnum] Each Dice has a number of 'die', defalting to one.
    #
    def rolls
      (1..count).map { |d| rand(sides) + 1 }
    end #rolls

    def roll
      rolls.inject(0) { |total, d| total += d }
    end #roll
  end #Dice

	class Statlist 
	  attr_accessor :str, :dex, :cha, :con, :wis, :int
    def initialize(str, dex, cha, con, wis, int) 
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

  	def initialize(name) 
    	@name = name
    	@stats = Statlist.new(0,0,0,0,0,0)
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
    
    def initialize(fname, lname)
      @fname = fname
      @lname = lname 
      @characters = []
    end #initialize
  
    def roll_char(name)
      new_char = Charactersheet.roll_char(name)
      self.characters << new_char 
    end #roll_char
  end #Player
      
end #Stattr


