require 'random-word'
require 'pnglitch'
require_relative 'convert_files'

module Glitch

  class Image
    attr_reader :outfile, :filename

    def initialize(png_path, instructions=[])
      filename = File.basename(png_path)
      directory = File.dirname(png_path)
      @out_directory = directory.sub('source_images', 'output')
      adj = RandomWord.adjs.next

      @instructions = instructions

      # @rotation = [0, 90, 180, 270].sample
      @rotation = rand(0..359)

      if @rotation != 0
        puts "rotating #{@rotation} degrees"
        rotated_image = create_rotated_image(png_path, @rotation)
        @png = PNGlitch.open(rotated_image)
      else
        @png = PNGlitch.open(png_path)
      end
      @outfile = "#{@out_directory}/#{adj}-#{filename}"
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

      if @rotation != 0
        rotate_in_place(@outfile, 360 - @rotation)
      end

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

