## Code snippets discussed in RB130/Lesson_1



* Custom implementation of `#times`:

  * ```ruby
    # method implementation
    def times(number)
      counter = 0
      while counter < number do
        yield(counter)
        counter += 1
      end
    
      number # return original method argument
    end
    
    # method invocation
    times(5) do |num|
      puts num
    end
    ```

* Custom implementation of `#each`:

  * ```ruby
    def each(array)
      counter = 0
    
      while counter < array.size
        yield(array[counter])
        counter += 1
      end
      
      array # return the calling array
    end
    ```

* Custom implementation of `#select`

  * ```ruby
    # Implicit block
    
    def select(array)
      out = []
      counter = 0
    
      while counter < array.size
        el = array[counter]
        out << el if yield(el)
        counter += 1
      end
    
      out
    end
    
    array = [1, 2, 3, 4, 5]
    
    p select(array) { |num| num.odd? }      # => [1, 3, 5]
    p select(array) { |num| puts num }      # => []
    p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5]
    ```

* Custom implementation of `#reduce`

  * ```ruby
    def reduce(array, start_val=0)
      counter = 0
      acc = start_val
    
      while counter < array.size
        el = array[counter]
        acc = yield(acc, el) if yield(acc, el)
        counter += 1
      end
    
      acc
    end
    
    array = [1, 2, 3, 4, 5]
    
    puts reduce(array) { |acc, num| acc + num } == 15
    puts reduce(array, 10) { |acc, num| acc + num } == 25
    puts reduce(array) { |acc, num| acc + num if num.odd? } == 9
    ```

* 

