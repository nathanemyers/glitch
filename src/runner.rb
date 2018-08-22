#!/usr/bin/env ruby

require_relative 'instruction'
require_relative 'image'

def generate_random_instructions
  num_instructions = rand(3) + 1

  instructions = []

  while num_instructions > 0
    num_instructions = num_instructions - 1 
      instructions.push(Glitch::Instruction.random_instruction)
  end

  return instructions
end

def random_png
  files = Dir.glob("../source_images/**/*.png")
  return files[rand(files.length)]
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
    instructions = generate_random_instructions
    png_file = random_png
    image = Glitch::Image.new(png_file, instructions)

    puts "Selecting #{png_file}"
    puts "Using Instructions:"
    puts "Writing to #{image.outfile}"
    puts instructions

    image.glitch
    image.save
    image.close
    image.show
  when "q"
    puts "😢 Goodbye"
    break
  else
    puts "😩 I don't know what that command is!"
  end

  puts ""
end
