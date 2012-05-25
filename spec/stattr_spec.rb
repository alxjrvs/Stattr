# encoding: utf-8

require "spec/spec_helper"

# Stubbed Kernel#rand
#
# Always return the highest possible value
# in order to write a few simple expectations.
#
def rand(max)
  max-1
end

# The Stattr model
#
describe Stattr do

  # The DiceRoll class
  #
  describe Stattr::DiceRoll do
    subject { Stattr::DiceRoll }

    it "should default to 6 sides" do
      s.sides.must_equal 6
    end

    it "should default to 3 die" do
      s.count.must_equal 3
    end

    it "should return a list or rolls" do
      s.rolls.must_equal [6, 6, 6]
      s(20,2).rolls.must_equal [20,20]
    end

    it "should roll the maximum value when Kernel#rand() is stubbed" do
      subject.new_roll.must_equal 18
      subject.new_roll(6,2).must_equal 12
      subject.new_roll(20,2).must_equal 40
    end
  end

  # The Stat class
  #
  describe Stattr::Stat do
    subject { Stattr::Stat }

    it "should be able to modstat" do
      list = s(10)

      list.modstat(10).must_equal 0
      list.modstat(15).must_equal 2
    end
  end

  # The CharacterSheet class
  #
  describe Stattr::CharacterSheet do
    subject { Stattr::CharacterSheet }

    it "should be initialized with a name" do
      s('Gimli').name.must_equal 'Gimli'
    end

    it "should have stat values with only 10" do
      frodo = s('Frodo')
      frodo.stats.set_stat("str", 10)
      frodo.stats.set_stat("dex", 10)
      frodo.stats.set_stat("cha", 10)
      frodo.stats.set_stat("con", 10)
      frodo.stats.set_stat("wis", 10)
      frodo.stats.set_stat("int", 10)

      frodo.stats.str.val.must_equal 10
      frodo.stats.dex.val.must_equal 10
      frodo.stats.cha.val.must_equal 10
      frodo.stats.con.val.must_equal 10
      frodo.stats.wis.val.must_equal 10
      frodo.stats.int.val.must_equal 10
    end

    it "should be able to roll a character" do
      gandalf = subject.roll_char('Gandalf')

      gandalf.stats.str.val.must_equal 18
      gandalf.stats.dex.val.must_equal 18
      gandalf.stats.cha.val.must_equal 18
      gandalf.stats.con.val.must_equal 18
      gandalf.stats.wis.val.must_equal 18
      gandalf.stats.int.val.must_equal 18
    end
  end

  # The Player class
  #
  describe Stattr::Player do
    subject { Stattr::Player }

    it "should be initialized with a first and last name" do
      player = s('John', 'Doe')

      player.fname.must_equal 'John'
      player.lname.must_equal 'Doe'

      player.characters.count.must_equal 0

      player.new_char('Aragon')

      player.characters.count.must_equal 1

      player.characters[0].name.must_equal 'Aragon'
    end
  end
end

