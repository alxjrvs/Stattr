=begiinrdoc

module Stattr
  #
  # = A Constant that holds the number of sides of this games common die. 
  #
  DICE_SIDES = 6 
  #
  # = This is the Dice object, meant to simulate a physical Die, and the outcome of said die. 
  #
  class Dice 
    # @sides [Fixnum] Each Dice has sides, defaulting to the unviersal DICE_SIDES number.
    # 
    # @count [Fixnum] Each Dice has a number of 'die', defalting to one.
    attr_accessor :sides, :count
    #
    # new Diceclass, using DICE_SIDES for default _sides_, and 1 for default _count_ . 
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
    # parameter rand rolls a die once per [count]
    # @since 05-15-2012
    # 
    def rolls
      (1..count).map { |d| rand(sides) + 1 }
    end #rolls

    ## 
    # roll is a method that totals out the result of rolls.  
    #
    # @since 05-15-2012
    # 
    def roll
      rolls.inject(0) { |total, d| total += d }
    end #roll
  end #Dice

  ## 
  # Statlist is a class that holds the stats and modifiers of a character
  # in an array. param[0] is the Stat, and param[1]is the modifier.
  #
  # @since 05-15-2012
  # 
  # @params: These params are the standard D+D stats. This will
  # eventually be replaced with dynamic generation. 
  #
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
    ##
    # modstat passes a freshly generated/given stat (r) and creates
    # the D+D standard modifier for it. 
    #
    # @since 05-15-2012
    # 
    def modstat(r)
      modr = ((r-10)/2).to_int
      modlist = [r, modr]
      modlist
    end #modstat
  end #StatList
  ##
  # Character sheet is currently a class that holds the relevant information 
  # about a player character - right now, just their name and stats. 
  #
  # @since 05-15-2012
  # 
  # @name - Player Character nam
  #
  # @stats - The Stats for a given character. Currently it assumes a D+D standard
  # for stats, and a newly generated character will have universal stats of 10. 
  # For random stat generation, use self.roll_char. 
  #
	class Charactersheet 
  	attr_accessor :stats, :name

  	def initialize(name) # :notnew:
    	@name = name
    	@stats = Statlist.new(10,10,10,10,10,10)
  	end #initialize 
		
  ##
  # self.roll_char is out random character stat generator. It creates a new 
  # Statlist object, which rolls the DICE_SIZE number of dice three times 
  # (currently modeled after D+D.) 
  #
  # @since 05-15-2012
  #
  # @name - the Name parameter passes the name of the new character. 
  #
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

  ##
  # The Player class is a class representing the person playing the game, 
  # as opposed to the characters a player may have. 
  #
  # @since 05-15-2012
  #
  # @fname - The players first name
  #
  # @lname - The players last name 
  #
  # @characters - an array of the charactersheets owned by a player. 
  #
  class Player 
    attr_accessor :fname, :lname, :characters
    
    def initialize(fname, lname) # :notnew:
      @fname = fname
      @lname = lname 
      @characters = []
    end #initialize
  
    ##
    # new_char is an instance variable concering the player class. 
    # It creates a new random character and assigns it to the 
    # player.
    #
    # @since 05-15-2012
    #
    # @name - the Characters name 
    #
    def new_char(name)
      new_char = Charactersheet.roll_char(name)
      self.characters << new_char 
    end #roll_char
  end #Player
      
end #Stattr
