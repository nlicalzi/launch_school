require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../lesson_1/todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new('Buy milk')
    @todo2 = Todo.new('Clean room')
    @todo3 = Todo.new('Go to gym')
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?) # none done => false

    @todos.each(&:done!)
    assert_equal(true, @list.done?)  # all done  => true

    @todo2.undone!
    assert_equal(false, @list.done?) # one undone  => false
  end

  def test_add_wrongtype
    assert_raises(TypeError) { @list.add('foo') }
    assert_raises(TypeError) { @list.add(123) }
  end

  def test_add_shovel_alias
    @todo4 = Todo.new('test')
    assert_includes(@list << @todo4, @todo4)
  end

  def test_add
    @todo4 = Todo.new('test')
    assert_includes(@list.add(@todo4), @todo4)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(999) }
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(999) }

    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(999) }

    @todos.each(&:done!)
    assert_equal(true, @todo1.done?)

    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
  end

  def test_done_bang
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_equal(nil, @list.remove_at(999))
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
             ---- Today's Todos ----
             [ ] Buy milk
             [ ] Clean room
             [ ] Go to gym
             OUTPUT

    assert_equal(output, @list.to_s)

    @list.mark_done_at(1)

    output_2 = <<~OUTPUT.chomp
               ---- Today's Todos ----
               [ ] Buy milk
               [X] Clean room
               [ ] Go to gym
               OUTPUT

    assert_equal(output_2, @list.to_s)
  end

  def test_to_s_done
    output = <<~OUTPUT.chomp
             ---- Today's Todos ----
             [X] Buy milk
             [X] Clean room
             [X] Go to gym
             OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    assert_equal(false, @list.done?)

    @todos.each(&:done!)
    assert_equal(true, @list.done?)
  end

  def test_each_return
    assert_equal(@todos, @todos.each { |todo| next })
  end

  def test_select
    @todo1.done!
    list = TodoList.new('Selected')
    list.add(@todo1)
  
    assert_equal(list.title, 'Selected')
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end
end