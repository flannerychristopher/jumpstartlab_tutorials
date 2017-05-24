require 'sinatra'
require 'sinatra/reloader' if development?

NUMBER = rand(100) + 1
@@limit = 6

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

def change_color(message)
  case message
  when "a little too high.", "a little too low." then '#ff9999'
	when "way too high!", "way too low!" then '#ff3333'
	else "#33cc33"
	end
end

get '/' do

  guess = params['guess']
  dif = guess.to_i - NUMBER
  message = check_guess(dif)
  background = change_color(message)
  @@limit -= 1

  if @@limit == 0 && message != "Correct! You got it right! The secret number is #{NUMBER}"
    message = "Sorry you ran out of guesses. There is a new number"
    @@limit = 5
    NUMBER = rand(100) + 1
  elsif message == "Correct! You got it right! The secret number is #{NUMBER}"
    @@limit = 5
    NUMBER = rand(100) + 1
  end

  erb :index, :locals => {:number => NUMBER, :message => message, :background => background}

end
