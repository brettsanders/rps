require 'sinatra'
require_relative 'rps'

get '/' do
  erb :index
end