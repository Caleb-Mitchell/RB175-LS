require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @title = 'The Adventures of Sherlock Holmes'
  @contents = File.readlines('data/toc.txt')

  erb :home
end

get '/chapters/:number' do
  @contents = File.readlines('data/toc.txt')

  number = params[:number].to_i

  # want to change the title displayed to the chapter name
  # instead of the chapter number
  # @title = "Chapter #{number}"

  @title = "Chapter #{number}: #{@contents[number - 1]}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

get '/show/:name' do
  params[:name]
end
