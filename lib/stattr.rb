Normstats = ['STR', 'DEX', 'CHA', 'INT', 'WIS', 'CON'] 

# Roll a D(sides) size die. 
def rolld(sides)
rand(sides) + 1  
end


# Rolls a number of dice of particular sizes.
def rollmanyd(sides, dice)
    rolls = 0 
    (1..dice).each do |i|
        rolls = rolls + rolld(sides)
    end
rolls
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

    

#This iterates through the Stat list and turns each stat into a key. It then rolls 3 d6's to get the starting value for that stat.
def statroll 
    stathash = {} 
        Normstats.each do |stat|
            stathash[stat] = modstat(rollmanyd(6,3))
        end
    stathash
end


#Classes 
# Extend these to increase the overall functionality of your app/game! 


class Statlist 
attr_accessor :str, :dex, :cha, :con, :wis, :int
@@sides = 6 
@@dicenum = 3 
    def initialize 
        @str = modstat(rollmanyd(@@sides, @@dicenum))
        @dex = modstat(rollmanyd(@@sides, @@dicenum))
        @cha = modstat(rollmanyd(@@sides, @@dicenum))
        @con = modstat(rollmanyd(@@sides, @@dicenum))
        @wis = modstat(rollmanyd(@@sides, @@dicenum))
        @int = modstat(rollmanyd(@@sides, @@dicenum))
    end
end

class Playerchar
attr_accessor :stats, :name

    def initialize(name) 
        @name = name
        @stats = Statlist.new
    end
end
