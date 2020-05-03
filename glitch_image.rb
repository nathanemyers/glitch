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
  image.write "#{outfile}.png"
  p "converted image"
end
