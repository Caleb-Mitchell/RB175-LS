require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

before do
  @user_file = YAML.load_file('data/users.yaml')
end

helpers do
  def count_interests
    @interest_count = 0
    @user_file.values.each do |info|
      @interest_count += info[:interests].count
    end
    @interest_count
  end
end

get '/' do
  redirect '/user_list'
end

get '/user_list' do
  @title = "user list"

  erb :user_list
end

get '/user_list/:user' do
  @name = params[:user]
  @title = @name

  @email = @user_file[@name.to_sym][:email]
  @interests = @user_file[@name.to_sym][:interests]

  @user_list = @user_file.keys.reject { |name| name == @name.to_sym }

  erb :user
end
