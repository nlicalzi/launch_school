# Source: RB130/Lesson_1, several assignments

# This class represents a todo item and its associated data:
# `name` and `description`. There's also a "done" flag to
# show whether this todo item is done or not.

class Todo
  DONE_MARKER = 'X'.freeze
  UNDONE_MARKER = ' '.freeze

  attr_accessor :title, :description, :done

  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(other)
    title == other.title &&
      description == other.description &&
      done == other.done
  end
end

todo1 = Todo.new('Buy milk')
todo2 = Todo.new('Clean room')
todo3 = Todo.new('Go to gym')

puts todo1 # calls Todo#to_s automatically => [ ] Buy Milk
puts todo2 # calls Todo#to_s automatically => [ ] Clean room
puts todo3 # calls Todo#to_s automatically => [ ] Go to gym

puts ''

puts 'Doing task 1...'
todo1.done!

puts ''

puts todo1 # => [X] Buy Milk
puts todo2 # => [ ] Clean room
puts todo3 # => [ ] Go to gym
