require 'pnglitch'
require 'securerandom'

module Glitch

  class Image
    attr_reader :outfile, :filename

    def initialize(png_path, instructions=[], out_dir)
      @out_directory = out_dir
      new_filename = "#{SecureRandom.uuid}.png"

      @instructions = instructions
      @png = PNGlitch.open(png_path)
      @outfile = "#{@out_directory}/#{new_filename}"
    end

    def manual_glitch(layer, size=1)
      @png.each_scanline do |scanline|
        scanline.change_filter layer 
        byte = Random.new.bytes(size)
        scanline.gsub!(/\d/, byte) 
      end
    end

    def glitch
      @instructions.each do |instruction|
        manual_glitch(instruction.layer, instruction.corruption_rate)
      end
    end

    def save
    unless Dir.exist? @out_directory
      puts "creating directory #{@out_directory}"
      Dir.mkdir(@out_directory)
    end
      @png.save(@outfile)
    end

    def close
      @png.close
    end

    def show
      `open #{@outfile}`
    end

    def to_s
      return @outfile
    end

  end

end

