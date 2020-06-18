require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "redcarpet"

configure do
  enable :sessions
  set :session_secret, "super secret"
end

root = File.expand_path("..", __FILE__)

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
    erb render_markdown(content)
  end
end

# load index page w/ all files
get "/" do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map { |path| File.basename(path)}
  erb :index
end

get "/users/signin" do
  erb :signin
end

post "/users/signin" do
  if params[:username] == "admin" && params[:password] == "secret"
    session[:message] = "Welcome!"
    session[:username] = params[:username]
    redirect "/"
  else
    session[:message] = "Invalid Credentials"
    status 422
    erb :signin
  end
end

post "/users/signout" do
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect "/"
end

# load page for creating a new document
get "/new" do
  erb :new
end

# create new document
post "/create" do
  filename = params[:filename]
  # if file name was provided...
  if filename.size > 0
    file_path = File.join(data_path, filename)

    File.write(file_path, "")
    session[:message] = "#{params[:filename]} was created."

    redirect "/"
  else
    session[:message] = "A name is required."
    status 422
    erb :new
  end
end

# load individual documents
get "/:filename" do
  file_path = File.join(data_path, params[:filename])

  if File.file?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end

# load page to edit a document
get "/:filename/edit" do
  @file_name = params[:filename]
  file_path = File.join(data_path, @file_name)

  if File.file?(file_path)
    @content = File.read(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end

  erb :edit
end

# delete a document
post "/:filename/delete" do
  filename = params[:filename]
  file_path = File.join(data_path, filename)

  if File.exist?(file_path)
    File.delete(file_path)
    session[:message] = "#{filename} was deleted."
  else
    session[:message] = "#{filename} not found."
  end
  redirect "/"
end

# send edits to a document
post "/:filename" do
  file_path = File.join(data_path, params[:filename])
  File.write(file_path, params[:content])

  session[:message] = "#{params[:filename]} has been updated."
  redirect "/"
end