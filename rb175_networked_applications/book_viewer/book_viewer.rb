require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @title = "The (mis)Adventures of Sherlock Holmes"
  erb :home
end
