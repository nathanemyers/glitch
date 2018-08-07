require 'mini_magick'

def get_all_jpgs
  return Dir["source_images/*.jpg"]
end

files = get_all_jpgs()

files.each do |file|
  filename = File.basename(file, '.jpg')
  directory = File.dirname(file)
  puts "Converting #{file}..."
  image = MiniMagick::Image.open(file)
  image.format "png"
  out_filename = "#{directory}/#{filename}.png"
  puts "Writing #{out_filename}"
  image.write out_filename
  File.delete(file)
end
