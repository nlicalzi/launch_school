ENV["RACK_ENV"] = "test" # tell Sinatra not to start a web server

require "minitest/autorun"
require "rack/test"

require_relative "../cms"

class CmsTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get "/"
    assert_equal 200, last_response.status                                # status code
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"] # content type header
    
    files = %w(about.txt changes.txt history.txt)
    assert files.all? { |file| last_response.body.include?(file) }        # content body
  end

  def test_viewing_text_document
    get "/history.txt"

    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "Ruby 0.95 released"
    assert_includes last_response.body, "2015 - Ruby 2.3 released"
  end
end