require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"
require "yaml"

helpers do
  def count_interests(x)
    interests = @users.map do |usr|
                  usr[1][:interests]
                end.flatten
    interests.uniq.size
  end
end

before do
  @users = YAML.load_file("users.yaml")
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/:username" do
  @user = params[:username]

  erb :user
end