require './lib/stattr.rb'
include Stattr

Technoir = Game


class Technoir

  def self.stats
    ["coax","fight","detect","hack", "move", "operate", "prowl", "shoot", "treat"]
  end

  def self.make_stat(val)
    Stat.new(val)
  end
  def self.training_programs
    [
    TrainingProgram.new('Bodyguard', 'coax', 'fight', 'treat'),
    TrainingProgram.new('Courier', 'fight', 'move', 'prowl'),
    TrainingProgram.new('Criminal', 'hack', 'prowl', 'shoot'),
    TrainingProgram.new('Bodyguard', 'coax', 'fight', 'treat'),
    TrainingProgram.new('Doctor', 'detect', 'operate', 'treat'),
    TrainingProgram.new('Engineer', 'coax', 'hack', 'operate'),
    TrainingProgram.new('Escort', 'coax', 'move', 'treat'),
    TrainingProgram.new('Investigator', 'detect', 'hack', 'prowl'),
    TrainingProgram.new('Pilot', 'detect', 'operate', 'shoot'),
    TrainingProgram.new('Soldier', 'fight', 'move', 'shoot'),
    ]

# Remember this part for later
# Technoir.training_programs.detect { |p| p.name == "Bodyguard" }
  end
end

class StatList
  attr_accessor *Technoir.stats
  def initialize(val=1, list)
    Technoir.stats.each  { |s| 
      if list.include?(s)
        instance_variable_set("@#{s}", Technoir.make_stat(val + list.count(s)))
      else
        instance_variable_set("@#{s}", Technoir.make_stat(val))
      end
    }
  end
end

class Push < DiceRoll
end


class CharacterSheet

  attr_accessor :push, :verbs, :programs, :adj

  def initialize (name, tp1, tp2, tp3, *adj)
    @push = 2
    @adj = adj.map { |a| PosAdj.new(a, true, 0)}
    @programs = [tp1, tp2, tp3]
    list = self.programs.map { |p| p.verbs}.flatten
    @verbs = StatList.new(1, list)
  end

  def self.make_stat
    list = self.programs.map { |p| p.verbs}.flatten
  end
end

class Stat

  def initialize(value)
    @val = value
  end
end

class TrainingProgram

  attr_accessor :name, :verbs
    def initialize(name, verb1, verb2, verb3)
      @name = name
      @verbs = [verb1, verb2, verb3]
    end

end

class Adjective
  attr_accessor :name, :positive, :status
end

class NegAdj < Adjective
  def initialize(name, positive = neg, status=0)
    @name = name
    @positive = positive
    @status = status
  end
end
class PosAdj < Adjective
  def initialize(name, positive = true,status=0)
    @name = name
    @positive = positive
    @status = status
  end
end
