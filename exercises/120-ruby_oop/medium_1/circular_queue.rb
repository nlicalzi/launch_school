# Source: https://launchschool.com/exercises/1fcae291

class CircularQueue
  attr_reader :items

  def initialize(spaces)
    @items = {}
    @index = 0
    @spaces = spaces
  end

  def enqueue(value)
    items[@index] = value # add new index/value pair
    @index += 1 # increment our index
    @index %= @spaces # make sure to wrap index back around by spaces amount
  end

  def dequeue
    # select idx/val pair with lowest (oldest) idx and delete it (returning it)
    items.delete(items.select { |_,v| v == items.values.min }.keys[0])
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
