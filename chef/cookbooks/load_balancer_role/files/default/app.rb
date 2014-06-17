require 'sinatra'
require 'open-uri'

get '/' do
  open('http://localhost:10000').read
end
