require 'pnglitch'
require 'random-word'

infile = 'source_images/'
outfile = 'test.png'

def select_file
  files = Dir["source_images/*.png"]
  return files[rand(files.length)]
end

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

def glitch_layer png, num, size
  puts "glitching layer #{num}, size #{size}"
  png.each_scanline do |scanline|
    scanline.change_filter num 
    byte = Random.new.bytes(size)
    scanline.gsub! /\d/, byte 
  end
end

# 0 - blocky
# 1 - horizontal lines
# 2 - vertical lines
# 3 - average
# 4 - peath
begin
  `say "glitching..."`
  file = select_file
  puts "selecting #{file}"
  PNGlitch.open(file) do |png|
    iterations = rand(3) + 1
    puts "using #{iterations} iterations"
    (1..iterations).each do |n|
      layer = rand(5)
      size = 1
      glitch_layer png, layer, size
    end

    #puts "glitch"
    #png.glitch do |data|
    #light_corrupt data
    #end

    # save this bad boy
    filename = File.basename(file)
    adj = RandomWord.adjs.next
    outfile = "output/#{adj}-#{filename}"
    puts "saving to #{outfile}"
    png.save outfile

    `say "glitching complete"`
  end
rescue => error
  `say "Oh! Fuck!"`
  puts error
end

`open #{outfile}`
