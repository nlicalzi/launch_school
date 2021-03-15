class Post < BaseModel
  attr_reader :id, :title, :body, :author, :created_at, :errors
  
  def initialize(attributes={})
    set_attributes(attributes)

    @errors = {}
  end

  def set_attributes(attributes)
    @id = attributes['id'] if new_record?
    @title = attributes['title']
    @body = attributes['body']
    @author = attributes['author']
    @created_at ||= attributes['created_at']
  end

  def self.connection
    db_connection = SQLite3::Database.new('db/development.sqlite3')
    db_connection.results_as_hash = true
    db_connection
  end

  def connection
    self.class.connection
  end

  def new_record?
    id.nil?
  end

  def valid?
    @errors['title']  = "can't be blank" if title.blank?
    @errors['body']   = "can't be blank" if body.blank?
    @errors['author'] = "can't be blank" if author.blank?

    @errors.empty?
  end

  def build_comment(attributes)
    Comment.new(attributes.merge!('post_id' => id))
  end

  def create_comment(attributes)
    comment = build_comment(attributes)
    comment.save
  end

  def delete_comment(comment_id)
    Comment.find(comment_id).destroy
  end

  def comments
    comment_hashes = connection.execute 'SELECT * FROM comments WHERE comments.post_id = ?', id
    comment_hashes.map do |comment_hash|
      Comment.new(comment_hash)
    end
  end

  def save
    return false unless valid?

    if new_record?
      insert
    else
      update
    end

    true
  end

  def insert
    insert_query = <<-SQL
      INSERT INTO posts (title, body, author, created_at)
      VALUES (?, ?, ?, ?)
    SQL

    connection.execute insert_query,
      title,
      body,
      author,
      Date.current.to_s
  end

  def update
    update_query = <<-SQL
      UPDATE posts
      SET title      = ?,
          body       = ?,
          author     = ?
      WHERE posts.id = ?
    SQL

    connection.execute update_query,
      title,
      body,
      author,
      id
  end
end