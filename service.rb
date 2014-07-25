require 'rmagick'
require 'sinatra'

get '/*' do |path|
  img = Magick::Image.read(path)[0]
  img.auto_orient!

  content_type img.mime_type
  img.to_blob
end
