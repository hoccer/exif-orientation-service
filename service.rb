require 'rmagick'
require 'sinatra'

get '/*' do |path|
  begin
    img = Magick::Image.read(path)[0]
    img.auto_orient!

    content_type img.mime_type
    img.to_blob
  rescue Magick::ImageMagickError
    send_file path
  end
end
