require 'RMagick'
require 'sinatra'

configure do
  set :image_path, File.expand_path('../images', __FILE__)
end

configure :production do
  log = File.new(File.expand_path('../log/exif-orientation-service.log', __FILE__), 'a+')
  log.sync = true
  STDOUT.reopen(log)
  STDERR.reopen(log)
end

get '/*' do |path|
  file_path = File.join(settings.image_path, path)

  begin
    img = Magick::Image.read(file_path)[0]
    img.auto_orient!

    content_type img.mime_type
    body img.to_blob

    img.destroy!
  rescue Magick::ImageMagickError
    send_file file_path
  end
end
