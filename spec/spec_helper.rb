# encoding: utf-8

require 'rubygems'
require 'minitest/spec'
require 'minitest/pride'
require 'minitest/autorun'

require 'lib/stattr.rb'

def s(*args)
  subject.new(*args)
end
