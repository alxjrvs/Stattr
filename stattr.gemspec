# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "lorem/version"


Gem::Specification.new do |s|
  s.name        = 'stattr'
  s.version     = Stattr::VERSION
  s.summary     = "Stattr; Because rolling dice is hard."
  s.description = "Stattr is a Gem that includes a number of useful functions for rolling dice in a game like Dungeons and Dragons."
  s.authors     = ["Alex Jarvis"]
  s.email       = ['alxjrvs@gmail.com']
  s.files       = `git ls-files`.split("\n")
  s.homepage    =
    'https://github.com/alxjrvs/Stattr'
end
