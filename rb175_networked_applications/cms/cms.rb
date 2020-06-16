require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"

root = File.expand_path("..", __FILE__)

configure do
  enable :sessions
  set :session_secret, "super secret"
end

# load index page w/ all files
get "/" do
  @files = Dir.glob(root + "/data/*").map { |path| File.basename(path) }
  erb :index
end

# return individual plaintext file resources
get "/:resource" do
  file_path = root + "/data/" + params[:resource]

  if File.file?(file_path)
    headers["Content-Type"] = "text/plain"
    File.read(file_path)
  else
    session[:message] = "#{params[:resource]} does not exist."
    redirect "/"
  end
end