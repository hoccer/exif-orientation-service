require 'sinatra'

get '*' do |path|
  "Hello #{path}"
end
