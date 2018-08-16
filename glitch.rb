require 'pnglitch'
require 'random-word'

def select_file
  files = Dir.glob("source_images/**/*.png")
  return files[rand(files.length)]
end

def wrong_filter(scanline)
  scanline.register_filter_encoder do |data, prev|
    data.size.times.reverse_each do |i|
      x = data.getbyte(i)
      v = prev ? prev.getbyte((i - 5).abs) : 0
      data.setbyte(i, (x - v) & 0xff)
    end
    data
  end
end

def write_random_data(scanline)
  byte = Random.new.bytes(1)
  data = scanline.data
  scanline.replace_data(data.gsub(/\d/, byte))
end

def light_corrupt(data)
  #byte = Random.new.bytes(1)
  byte = 'x'
  data.gsub(/\d/, byte )
end

def heavy_corrupt(data)
  #byte = Random.new.bytes(1)
  byte = 'x'
  data.gsub(/\w/, byte )
end

def glitch_layer(png, num, size)
  puts "glitching layer #{num}, size #{size}"
  png.each_scanline do |scanline|
    scanline.change_filter num 
    byte = Random.new.bytes(size)
    scanline.gsub!(/\d/, byte) 
  end
end

def garble(png, chance)
  stash = []
  buf = 2 ** 18
  png.glitch_as_io do |io|
    until io.eof? do
      d = io.read(buf)
      puts "got #{d.size} amount of data"
      io.pos -= d.size

      if rand(chance) == 0
        puts "stashing"
        if not stash.empty?
          puts "popping"
          io.print(stash.pop)
        else
          stash.push(d)
        end
      else
        io.print(d)
      end

    end
  end
end

def all_filter_two(png)
  p.change_all_filters(2)
  p.each_scanline do |l|
    l.register_filter_encoder do |data, prev|
      data.size.times.reverse_each do |i|
        x = data.getbyte(i)
        v = prev ? prev.getbyte(i) : 0
        data.setbyte(i, (x - v) & 0xfe)
      end
      data
    end
  end
end

# file management
if ARGV[0]
  file = ARGV[0]
else
  file = select_file
end


puts "selecting #{file}"
filename = File.basename(file)
directory = File.dirname(file)
out_directory = directory.sub('source_images', 'output')
adj = RandomWord.adjs.next
outfile = "#{out_directory}/#{adj}-#{filename}"

# 0 - blocky
# 1 - horizontal lines
# 2 - vertical lines
# 3 - average
# 4 - peath
begin
  `say "glitching..."`
  PNGlitch.open(file) do |png|
    iterations = rand(3) + 1
    puts "using #{iterations} iterations"
    (1..iterations).each do |n|
      layer = rand(5)
      size = 1
      glitch_layer png, layer, size
    end
    
    #all_filter_two(png)

    #garble(png, 10)

    #puts "glitch"
    #png.glitch do |data|
    #light_corrupt data
    #end

    # save this bad boy
    unless Dir.exist? out_directory
      puts "creating directory #{out_directory}"
      Dir.mkdir(out_directory)
    end
    puts "saving to #{outfile}"
    png.save(outfile)

    `say "glitching complete"`
  end
rescue => error
  `say "Fuck!"`
  puts error
end

`open #{outfile}`
