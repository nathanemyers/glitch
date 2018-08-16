#!/usr/bin/env ruby

module Glitch

  class Image

    attr_reader :outfile

    def initialize(png_path)
      filename = File.basename(png_path)
      directory = File.dirname(png_path)
      out_directory = directory.sub('source_images', 'output')
      adj = RandomWord.adjs.next

      @png = png
      @outfile = "#{out_directory}/#{adj}-#{filename}"
    end

    def glitch_layer(layer, size=1)
      @png.each_scanline do |scanline|
        scanline.change_filter num 
        byte = Random.new.bytes(size)
        scanline.gsub!(/\d/, byte) 
      end
    end

    def save
      @png.save(@outfile)
    end

    def to_s
      return @outfile
    end

  end

end

