require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'

before do
  @contents = File.readlines('data/toc.txt')
end

helpers do
  def in_paragraphs(chapter_content)
    chapter_content.split("\n\n").map do |para|
      "<p>" << para << "</p>"
    end.join
  end
end

get '/' do
  @title = 'The Adventures of Sherlock Holmes'

  erb :home
end

get '/chapters/:number' do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]

  redirect "/" unless (1..@contents.size).cover? number

  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

not_found do
  redirect "/"
end
