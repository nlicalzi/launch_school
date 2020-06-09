require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

helpers do
  def count_interests; end # populate layout erb
end

get "/" do
  # redirect to /users/
end

get "/users" do
  # display a link to a page for each user
end

get "/users/:name" do
  # display email address
  # display interests, comma separated
  # display a link to each other user
end