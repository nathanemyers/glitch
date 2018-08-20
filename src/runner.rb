#!/usr/bin/env ruby

require_relative 'instruction'


def create_random_profile
  num_instructions = rand(3) + 1

  instructions = []

  while num_instructions > 0
    num_instructions = num_instructions - 1 
      instructions.push(Glitch::Instruction.random_instruction)
  end

  return instructions
end


def welcome
  puts ""
  puts "🤠 Welcome to Glitch Town!"
  puts ""
end

def main_menu
  puts "Menu Items:"
  puts " [C]reate Random Glitch"
  puts " [Q]uit"
end

welcome

loop do
  main_menu
  input = gets.chomp
  puts ""

  case input.downcase
  when "c"
    puts "🤪  Glitching..."
    puts create_random_profile
  when "q"
    puts "😢 Goodbye"
    break
  else
    puts "😩 I don't know what that command is!"
  end

  puts ""
end
