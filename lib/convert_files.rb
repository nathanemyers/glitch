require 'mini_magick'

def convert_all_jpgs(dir)
  files = Dir.glob(dir)

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

  return files
end
