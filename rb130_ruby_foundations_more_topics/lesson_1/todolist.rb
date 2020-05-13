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

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.
class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end
end
