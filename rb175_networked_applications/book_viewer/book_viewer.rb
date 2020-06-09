require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

before do
  @contents = File.readlines("data/toc.txt")
end

helpers do
  def slugify(text)
    text.downcase.gsub(/\s+/, "-").gsub(/[^\w-]/, "")
  end

  def in_paragraphs(text)
    text.split("\n\n").map do |graf|
      "<p>#{graf}</p>"
    end.join
  end
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]

  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end