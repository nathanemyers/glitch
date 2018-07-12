require 'pnglitch'
require 'optparse'

#options = {}

#OptionParser.new do |opts|
  #opts.on('-f') do |filename|
    #options[:infile] = filename
  #end
#end.parse!

PNGlitch.open('olp.png') do |png|
  buf = 2 ** 18
  png.glitch_as_io do |io|
    until io.eof? do
      d = io.read(buf)
      io.pos -= d.size
      io.print(d.gsub(/\d/, 'a'))
    end
  end
  png.save 'test.png'
end
