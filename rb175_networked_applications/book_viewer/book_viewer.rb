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
    text.split("\n\n").each_with_index.map do |line, idx|
      "<p id=graf#{idx}>#{line}</p>"
    end.join
  end
end

not_found do    # if a user tries a bad path...
  redirect "/"  # redirect to homepage
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]

  redirect "/" unless (1..@contents.size).cover? number

  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

def each_chapter
  @contents.each_with_index do |name, idx|
    number = idx + 1
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end

def chapters_matching(query)
  results = []

  return results unless query

  each_chapter do |number, name, contents|
    matches = {}
    contents.split("\n\n").each_with_index do |graf, idx|
      matches[idx] = graf if graf.include?(query)
    end
    results << {number: number, name: name, grafs: matches} if matches.any?
  end

  results
end