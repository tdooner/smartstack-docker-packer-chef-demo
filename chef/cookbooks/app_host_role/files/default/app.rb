require 'sinatra'

get '/' do
  sleep 5

  'Hello!'
end
