require 'sinatra'
require 'sinatra/reloader' if development?

number = rand(100) + 1

get '/' do
  erb :index, :locals => {:number => number}
end
