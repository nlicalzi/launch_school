require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "redcarpet"

configure do
  enable :sessions
  set :session_secret, "super secret"
end

root = File.expand_path("..", __FILE__)

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
    render_markdown(content)
  end
end

# load index page w/ all files
get "/" do
  @files = Dir.glob(root + "/data/*").map { |path| File.basename(path) }
  erb :index
end

# return individual plaintext file resources
get "/:resource" do
  file_path = root + "/data/" + params[:resource]

  # File.extname("filepath")
  if File.file?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:resource]} does not exist."
    redirect "/"
  end
end