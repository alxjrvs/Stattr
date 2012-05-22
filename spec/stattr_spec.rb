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

  # The Dice class
  #
  describe Stattr::Dice do
    subject { Stattr::Dice }

    it "should default to 6 sides" do
      s.sides.must_equal 6
    end

    it "should default to 1 die" do
      s.count.must_equal 1
    end

    it "should return a list or rolls" do
      s.rolls.must_equal [6]
      s(20,2).rolls.must_equal [20,20]
    end

    it "should roll the maximum value when Kernel#rand() is stubbed" do
      subject.roll.must_equal 6
      subject.roll(6,2).must_equal 12
      subject.roll(20,2).must_equal 40
    end
  end

  # The Statlist class
  #
  describe Stattr::Statlist do
    subject { Stattr::Statlist }

    it "should initialize the list of stats in the correct order" do
      list = s(1,2,3,4,5,6)

      list.str.must_equal [1, -5]
      list.dex.must_equal [2, -4]
      list.cha.must_equal [3, -4]
      list.con.must_equal [4, -3]
      list.wis.must_equal [5, -3]
      list.int.must_equal [6, -2]
    end

    it "should be able to modstat" do
      list = s(6,5,4,3,2,1)

      list.modstat(10).must_equal [10, 0]
      list.modstat(15).must_equal [15, 2]
    end
  end

  # The Charactersheet class
  #
  describe Stattr::Charactersheet do
    subject { Stattr::Charactersheet }

    it "should be initialized with a name" do
      s('Gimli').name.must_equal 'Gimli'
    end

    it "should have a default statlist with only 10's" do
      frodo = s('Frodo')

      frodo.stats.str.must_equal [10, 0]
      frodo.stats.dex.must_equal [10, 0]
      frodo.stats.cha.must_equal [10, 0]
      frodo.stats.con.must_equal [10, 0]
      frodo.stats.wis.must_equal [10, 0]
      frodo.stats.int.must_equal [10, 0]
    end

    it "should be able to roll a character" do
      gandalf = subject.roll_char('Gandalf')

      gandalf.stats.str.must_equal [18, 4]
      gandalf.stats.dex.must_equal [18, 4]
      gandalf.stats.cha.must_equal [18, 4]
      gandalf.stats.con.must_equal [18, 4]
      gandalf.stats.wis.must_equal [18, 4]
      gandalf.stats.int.must_equal [18, 4]
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
    end
  end
end

