#Stattr#
======

[Stattr](https://rubygems.org/gems/stattr "Stattr") is a Gem that looks to help people who are writing programs and apps based on Tabletop Role-playing games like Dungeons and Dragons, Pathfinder, and more! It includes a number of classes and functions to assist you in your app-building. 

Stattr is Creative Commons, BY-SA. 

##Functions##
=============

 ###rolld(sides) 
---
Fairly self explanatory, this lets you roll a die with (sides) number of sides. So, for instance, if you wanted to roll a d6, you coulld rolld(6) and it would get it for you! 

rollmanyd(sides, dice) 
---
Functionally the same as rolld, execpt it allows you to roll multiples of the same sided die. So, if you wanted to roll 3 d20's, you'd rollmanyd(20, 3). 

 modstat(r) 
---
Not incredibly useful outside of the upcoming 'statroll', this lets you change the modifier for a given roll of a twenty sided die. 
    
 statroll 
---
The cut-and-dry original focus of this gem, statroll generates a hash, with traditional D&D stats (CON, WIS, DEX, STR, INT, CHA) as keys, and an array as the value, with [0] being the skill number and [1] being the modifier. 

##Classes 
============

These are made to be extended, so feel free to! 

> Statlist
---
Statlist is your one-stop shop for generating Stats. Yes, I know I included statroll above - but that was incase you wanted to seriously mess with the gritty. Statlist does this more beautifully as a class, allowing a simple Statlist.new callout to invoke a new list of stats, values, and modifiers. 

> Playerchar 
---
A fairly blank player character class, Playerchar asks for a characters name and then generates a Statlist.new. 

##ToDo 
========
Not sure yet - what do you think, Internet? 

-- By [Alxjrvs](http://alxjrvs.com "Alxjrvs") -- 
