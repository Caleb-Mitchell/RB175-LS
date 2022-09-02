require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @title = 'Dynamic Directory Index'
  # @file1 = File.read('public/path')

  # erb :index
end

