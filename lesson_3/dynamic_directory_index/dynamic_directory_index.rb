require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @title = 'Dynamic Directory Index'
  @files = Dir.glob("public/*").map { |file| File.basename(file) }.sort

  erb :index
end
