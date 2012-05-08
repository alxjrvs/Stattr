$statlist = ['STR', 'DEX', 'CHA', 'INT', 'WIS', 'CON'] 

# Roll a D(sides) size die. 
def rollD(sides)
return rand(sides) + 1  
end


# Rolls a number of dice of particular sizes.
def rollmanyD(dice, sides) 
    rolls = 0 
    #for i in (1..dice)
        #rolls = rolls + rollD(sides)
    #end
    (1..dice).each do |i|
        rolls = rolls + rollD(sides)
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
        $statlist.each do |stat|
            stathash[stat] = modstat(rollmanyD(3,6))
        end
    stathash
end

