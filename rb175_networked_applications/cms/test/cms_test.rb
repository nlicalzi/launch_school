ENV["RACK_ENV"] = "test" # tell Sinatra not to start a web server

require "minitest/autorun"
require "rack/test"
# require "fileutils"
require_relative "../cms"

class CmsTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def test_index
    # set up necessary data
    create_document "about.md"
    create_document "changes.txt"
    
    # execute the code being tested
    get "/"
    
    # assert the results of the execution
    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
  end

  def test_viewing_text_document
    create_document "history.txt", "Ruby 0.95 released"
    
    get "/history.txt"

    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "Ruby 0.95 released"
  end

  def test_document_not_found
    get "/notafile.txt"                     # nonexistent file
    
    assert_equal 302, last_response.status  # assert redirection

    get last_response["Location"]           # request redirection page

    assert_equal 200, last_response.status
    assert_includes last_response.body, "notafile.txt does not exist"

    get "/" 
    refute_includes last_response.body, "notafile.txt does not exist"
  end

  def test_viewing_markdown_document
    create_document "about.md", "# Building a CMS"

    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Building a CMS"
  end

  def test_editing_document
    create_document "changes.txt"

    get "/changes.txt/edit"

    # successful response code issued
    assert_equal 200, last_response.status
    # form populated properly
    assert_includes last_response.body, "<textarea"
    # submit button appears
    assert_includes last_response.body, %q(<input type="submit)
  end

  def test_updating_document
    # post edits to file
    post "/changes.txt", content: "new content"

    assert_equal 302, last_response.status # 302: redirect from POST route in Sinatra
    
    # load the redirected page
    get last_response["Location"]
    # ensure that the session message properly flashed
    assert_includes last_response.body, "changes.txt has been updated"

    get "/changes.txt"
    # ensure file properly loads
    assert_equal 200, last_response.status
    # ensure edits are present
    assert_includes last_response.body, "new content"
  end
end