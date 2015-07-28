require 'simplecov'
require 'codeclimate-test-reporter'
require 'digest'
require 'chunky_png'
require 'digest/md5'
SimpleCov.add_filter 'vendor'
SimpleCov.add_filter 'examples'
SimpleCov.formatter = CodeClimate::TestReporter::Formatter
SimpleCov.start CodeClimate::TestReporter.configuration.profile

require 'gnuplotrb'

include ChunkyPNG::Color
include GnuplotRB
$RSPEC_TEST = true

def same_images?(*imgs)
  images = imgs.map { |img| Digest::MD5.digest(ChunkyPNG::Image.from_file(img).pixels.to_s) }
  images.all? { |img| img == images[0] }
end

# may be errorneuos in comparing images
def same_files?(*files)
  images = files.map { |fname| Digest::MD5.digest(File.binread(fname)) }
  images.all? { |img| img == images[0] }
end

def awesome?
  # sure!
  true
end
