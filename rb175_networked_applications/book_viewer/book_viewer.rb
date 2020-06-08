require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  @chapters = File.read("data/toc.txt").split("\n")

  erb :home
end
