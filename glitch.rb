require 'pnglitch'

infile = 'me.png'
outfile = 'test.png'

def wrong_filter scanline
  scanline.register_filter_encoder do |data, prev|
    data.size.times.reverse_each do |i|
      x = data.getbyte(i)
      v = prev ? prev.getbyte((i - 5).abs) : 0
      data.setbyte(i, (x - v) & 0xff)
    end
    data
  end
end

def write_random_data scanline
  byte = Random.new.bytes(1)
  data = scanline.data
  scanline.replace_data(data.gsub(/\d/, byte))
end

def light_corrupt data
  #byte = Random.new.bytes(1)
  byte = 'x'
  data.gsub(/\d/, byte )
end

def heavy_corrupt data
  #byte = Random.new.bytes(1)
  byte = 'x'
  data.gsub(/\w/, byte )
end


`say "glitching..."`
PNGlitch.open(infile) do |png|
  puts "4"
  png.each_scanline do |scanline|
    scanline.change_filter 4
    #write_random_data scanline
    byte = Random.new.bytes(2)
    scanline.gsub! /\d/, byte 
  end

  puts "1"
  png.each_scanline do |scanline|
    scanline.change_filter 1
    #write_random_data scanline
    scanline.gsub! /\d/, 'x'
  end

  puts "3"
  png.each_scanline do |scanline|
    scanline.change_filter 3
    #write_random_data scanline
    scanline.gsub! /\d/, 'x'
  end

  puts "glitch"
  png.glitch do |data|
    light_corrupt data
  end

  puts "2"
  png.each_scanline do |scanline|
    scanline.change_filter 2
    #write_random_data scanline
    scanline.gsub! /\d/, 'p'
  end

  png.save outfile
end

`say "glitching complete"`
