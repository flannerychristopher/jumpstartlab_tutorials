require 'sinatra'
require 'sinatra/reloader' if development?

num = rand(100) + 1

get '/' do
  "The SECRET NUMBER is #{num}"
end
