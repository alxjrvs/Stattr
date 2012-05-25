require './lib/stattr.rb'
include Stattr

Technoir = Game

class Technoir
  def self.dice_sides
    20
  end

  def self.stats
    ["foo","bar","baz"]
  end
end

a = Player.new("Alex", "Jarvis") 
puts a.fname
puts a.lname

a.new_char("karlorr")
puts a.characters.inspect
