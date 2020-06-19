ENV['RACK_ENV'] = 'test' # tell Sinatra not to start a web server

require 'minitest/autorun'
require 'rack/test'
require 'fileutils'

require_relative '../cms'

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

  def session
    last_request.env['rack.session']
  end

  def create_document(name, content = '')
    File.open(File.join(data_path, name), 'w') do |file|
      file.write(content)
    end
  end

  def admin_session
    { 'rack.session' => { username: 'admin' } }
  end

  def test_index
    # set up necessary data
    create_document 'about.md'
    create_document 'changes.txt'

    # execute the code being tested
    get '/'

    # assert the results of the execution
    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, 'about.md'
    assert_includes last_response.body, 'changes.txt'
  end

  def test_signin_form
    get '/users/signin'

    assert_equal 200, last_response.status
    assert_includes last_response.body, '<input'
    assert_includes last_response.body, %q(<button type="submit)
  end

  def test_signin
    post '/users/signin', username: 'admin', password: 'secret'
    assert_equal 302, last_response.status
    assert_equal 'Welcome!', session[:message]
    assert_equal 'admin', session[:username]

    get last_response['Location']
    assert_includes last_response.body, 'Signed in as admin'
  end

  def test_signin_with_bad_credentials
    post '/users/signin', username: 'guest', password: 'shhhh'
    assert_equal 422, last_response.status
    assert_nil session[:username]
    assert_includes last_response.body, 'Invalid credentials'
  end

  def test_signout
    get '/', {}, {'rack.session' => { username: 'admin' } }
    assert_includes last_response.body, 'Signed in as admin'

    post '/users/signout'
    assert_equal 'You have been signed out.', session[:message]

    get last_response['Location']
    assert_nil session[:username]
    assert_includes last_response.body, 'Sign In'
  end

  def test_view_new_document_form
    get '/new', {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, '<input'
    assert_includes last_response.body, 'Add a new'
  end

  def test_view_new_document_form_signed_out
    get '/new'

    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that.', session[:message]
  end

  def test_create_new_document
    post '/new', { filename: 'test_doc.txt' }, admin_session

    assert_equal 302, last_response.status
    assert_equal 'test_doc.txt was created.', session[:message]

    get '/'
    assert_includes last_response.body, 'test_doc.txt'
  end

  def test_create_new_document_signed_out
    post '/new', { filename: 'test.txt' }

    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that.', session[:message]
  end

  def test_create_new_document_without_filename
    post '/new', { filename: '' }, admin_session
    assert_equal 422, last_response.status # error
    assert_includes last_response.body, 'A name is required'
  end

  def test_viewing_text_document
    create_document 'history.txt', 'Ruby 0.95 released'
    
    get '/history.txt'

    assert_equal 200, last_response.status
    assert_equal 'text/plain', last_response['Content-Type']
    assert_includes last_response.body, 'Ruby 0.95 released'
  end

  def test_document_not_found
    get '/notafile.txt'                     # nonexistent file
    
    assert_equal 302, last_response.status  # assert redirection
    assert_equal 'notafile.txt does not exist.', session[:message]
  end

  def test_viewing_markdown_document
    create_document 'about.md', '# Building a CMS'

    get '/about.md'

    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, '<h1>Building a CMS'
  end

  def test_editing_document
    create_document 'changes.txt'

    get '/changes.txt/edit', {}, admin_session

    # successful response code issued
    assert_equal 200, last_response.status
    # form populated properly
    assert_includes last_response.body, '<textarea'
    # submit button appears
    assert_includes last_response.body, %q(<input type="submit)
  end

  def test_editing_document_signed_out
    create_document 'changes.txt'

    get '/changes.txt/edit'

    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that.', session[:message]
  end

  def test_updating_document
    # post edits to file
    post '/changes.txt', { content: 'new content' }, admin_session

    assert_equal 302, last_response.status # 302: redirect from POST route in Sinatra
    # ensure that the session message properly flashed
    assert_equal 'changes.txt has been updated.', session[:message]

    get '/changes.txt'
    # ensure file properly loads
    assert_equal 200, last_response.status
    # ensure edits are present
    assert_includes last_response.body, 'new content'
  end

  def test_updating_document_signed_out
    post '/changes.txt', { content: 'new content' }

    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that.', session[:message]
  end

  def test_deleting_document
    create_document 'test.txt'

    post '/test.txt/delete', {}, admin_session
    assert_equal 302, last_response.status
    assert_equal 'test.txt was deleted.', session[:message]

    get '/'
    refute_includes last_response.body, %q(href="/test.txt)
  end

  def test_deleting_document_signed_out
    create_document 'test.txt'

    post '/test.txt/delete'
    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that.', session[:message]
  end
end