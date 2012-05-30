require './lib/stattr.rb'

module Technoir
  include Stattr

  class System < Stattr::System
    @stats = ["coax","fight","detect","hack", "move", "operate", "prowl", "shoot", "treat"]
    @dice_sides = 6

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

    end
  end

  class StatList
    attr_accessor *System.stats
    def initialize(val=1, list)
      System.stats.each  { |s|
        if list.include?(s)
          instance_variable_set("@#{s}", System.make_stat(val + list.count(s)))
        else
          instance_variable_set("@#{s}", System.make_stat(val))
        end
      }
    end
  end

  class Push < DiceRoll
  end

  class Stat < Stattr:: Stat
  end

  class CharacterSheet

    attr_accessor :push, :verbs, :programs, :adj

    def initialize (name, tp1, tp2, tp3, *adj)
      @push = 2
      @adj = adj.map { |a| Adjective.new(a, true, 0)}
      @programs = [tp1, tp2, tp3]
      list = @programs.map { |p| p.verbs}.flatten
      @verbs = StatList.new(1, list)
    end

    def use_push(r)
      self.push -= 1
      r.push += 1
    end

    def add_adj(a,pos,status)
      @adj << Adjective.new(a,pos,status)
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
    def initialize(name, positive = true, status=0)
      @name = name
      @positive = positive
      @status = status
    end
  end
end
