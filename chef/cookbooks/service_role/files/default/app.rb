require 'sinatra'

get '/' do
  sleep 1

  'Hello'
end

get '/health' do
  'OK'
end
