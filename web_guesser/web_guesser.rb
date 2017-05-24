require 'sinatra'
require 'sinatra/reloader' if development?

NUMBER = rand(100) + 1


def check_guess(dif)
  if dif.between?(1,5)
    message = "a little too high."
  elsif dif.between?(-5,-1)
    message = "a little too low."
  elsif dif >= 6
    message = "way too high!"
  elsif dif <= -6
    message = "way too low!"
  else
    message = "Correct! You got it right! The secret number is #{NUMBER}"
  end

end

get '/' do

  guess = params['guess']
  dif = guess.to_i - NUMBER
  message = check_guess(dif)
  erb :index, :locals => {:number => NUMBER, :message => message}

end
