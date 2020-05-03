#!/usr/bin/env ruby

require 'optparse'
require 'rubygems'
require 'bundler/setup'
require "open-uri"

require 'securerandom'

require_relative 'lib/instruction'
require_relative 'lib/image'
require_relative 'lib/convert_files'

options = {}
OptionParser.new do |parser|

  parser.on("-f", "--filename=FILENAME", "source filename") do |file|
    options[:file] = file
  end

  parser.on("-u", "--url=URL", "source url") do |url|
    options[:url] = url
  end

  parser.on("-i", "--instructions=INSTRUCTIONS", Array, "instructions") do |instructions|
    options[:instructions] = instructions
  end
  
end.parse!

def get_random_filename
  adj = RandomWord.adjs.next
  noun = RandomWord.nouns.next
  return "#{adj}-#{noun}"
end

def generate_random_instructions
  num_instructions = rand(3) + 1

  instructions = []

  while num_instructions > 0
    num_instructions = num_instructions - 1 
      instructions.push(Glitch::Instruction.random_instruction)
  end

  return instructions
end

def glitch_image(png_file)
  instructions = generate_random_instructions

  image = Glitch::Image.new(png_file, instructions, '/tmp')

  image.glitch
  image.save
  image.close
  return image.outfile
end

if (options[:url])
  base_filename = SecureRandom.uuid
  outfile = "/tmp/#{base_filename}"
  p "downloading image to #{outfile}"

  URI.open(options[:url]) {|f|
    File.open(outfile ,"wb") do |file|
      file.puts f.read
    end
  }
  p "download complete"

  image = MiniMagick::Image.open(outfile)
  image.format "png"
  converted_image_path = "#{outfile}.png"
  image.write converted_image_path
  p "converted image"

  glitched_file = glitch_image(converted_image_path)

  p "we did it! here it is! #{glitched_file}"


end
