require './lib/stattr.rb'
include Stattr

class Game
  def self.dice_sides
    20
  end

  def self.stats
    ["go","fuck","yourself"]
  end
end

a = Player.new("Alex", "Jarvis") 
puts a.fname
puts a.lname

a.new_char("karlorr")
puts a.characters.inspect
