#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require_relative 'lib/instruction'
require_relative 'lib/image'
require_relative 'lib/convert_files'

def generate_random_instructions
  num_instructions = rand(3) + 1

  instructions = []

  while num_instructions > 0
    num_instructions = num_instructions - 1 
      instructions.push(Glitch::Instruction.random_instruction)
  end

  return instructions
end

def random_png(directory="source_images/**/*.png")
  files = Dir.glob(directory)
  file = files[rand(files.length)]
  return file
end

def get_directories
  return Dir.glob('*').select {|f| File.directory? f}
end

def welcome
  puts ""
  puts "🤠 Welcome to Glitch Town!"
  puts ""
end

def main_menu
  puts "Menu Items:"
  puts " [C]reate Random Glitch"
  puts " [M]ass Glitch 100 images"
  puts " [G]litch From Folder"
  puts " [Q]uit"
end

def init
  files = []
  files << convert_all_jpgs("source_images/**/*.jpg")
  files << convert_all_jpgs("source_images/*.jpg")
  files << convert_all_jpgs("source_images/**/*.jpeg")
  files << convert_all_jpgs("source_images/*.jpeg")

  if files.length > 0
      puts "Preprocessed #{files.length} files."
  end
end

def glitch(png_file, instructions, show)
  image = Glitch::Image.new(png_file, instructions)

  puts "Selecting #{png_file}"
  puts "Using Instructions:"
  puts "Writing to #{image.outfile}"
  puts instructions

  image.glitch
  image.save
  image.close
  if show
    image.show
  end
end

init
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

    if png_file.nil?
      puts "Couldn't find a random image, do you have any source images?"
    else
      glitch(png_file, instructions, true)
    end
  when "g"
    puts "🤔  Which folder should I use?"
    puts get_directories

    instructions = generate_random_instructions
    png_file = random_png
    glitch(png_file, instructions, true)
  when "m"
    puts "🥴 Mass Glitching..."
    for a in 1..100 do 
      instructions = generate_random_instructions
      png_file = random_png

      if png_file.nil?
        puts "Couldn't find a random image, do you have any source images?"
      else
        glitch(png_file, instructions, false)
      end
    end
  when "q"
    puts "😢 Goodbye"
    break
  else
    puts "😩 I don't know what that command is!"
  end

  puts ""
end
