require 'mini_magick'
require 'securerandom'

def convert_all_jpgs(dir)
  files = Dir.glob(dir)

  files.each do |file|
    filename = File.basename(file, '.*')
    directory = File.dirname(file)
    puts "Converting #{file}..."
    image = MiniMagick::Image.open(file)
    image.resize "#{500*500}@>"
    image.format "png"

    out_filename = "#{directory}/#{filename}.png"
    puts "Writing #{out_filename}"
    image.write out_filename
    File.delete(file)
  end

  return files
end

def create_rotated_image(path, degrees)
  temp_file = File.join('/tmp', SecureRandom.uuid )
  image = MiniMagick::Image.open(path)
  image.rotate degrees
  puts "creating temp file #{temp_file} with rotation #{degrees}"
  image.write(temp_file)
  return temp_file
end

def rotate_in_place(path, degrees)
  image = MiniMagick::Image.new(path)
  image.rotate degrees
end