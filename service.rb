require 'RMagick'
require 'sinatra'

configure do
  set :image_path, File.expand_path('../images', __FILE__)
end

get '/*' do |path|
  file_path = File.join(settings.image_path, path)

  begin
    img = Magick::Image.read(file_path)[0]
    img.auto_orient!

    content_type img.mime_type
    img.to_blob
  rescue Magick::ImageMagickError
    send_file file_path
  end
end
