### RB130/Lesson_2: Introduction to Testing

Context: Learning unit testing!



**Lesson summary**:

- Minitest is the default testing library that comes with Ruby.
- Minitest tests come in 2 flavors: assert-style and spec-style. Unless you really like RSpec, use assert-style.
- A test suite contains many tests. A test can contain many assertions.
- Use `assert_equal` liberally, but don't be afraid to look up other assertions when necessary. Remember that `assert_equal` is for asserting value equality as determined by the `==` method.
- Use the SEAT approach to writing tests.
- Use code coverage as a metric to gauge test quality. (But not the only metric.)
- Practice writing tests -- it's easy!

**Midway Summary**:

* Minitest:

  * Minitest is an intuitive test library that comes with Ruby.

  * How to create a test file in Minitest

  * Create a test class by subclassing `MiniTest::Test`.

  * Create a test by creating an instance method that starts with `test_`.

  * Create assertions with `assert_equal`, and pass it the expected value and the actual value. (`refute` is the opposite of `assert`)

  * Colorize Minitest output with `minitest-reporters`

  * You can skip tests with `skip`.

  * Minitest comes in two syntax flavors: assertion style and expectation style. The latter is to appease RSpec users, but the former is far more intuitive for beginning Ruby developers.

  * Sample of Minitest assertions:

    * | Assertion                          | Description                                 |
      | :--------------------------------- | :------------------------------------------ |
      | `assert(test)`                     | Fails unless `test` is truthy.              |
      | `assert_equal(exp, act)`           | Fails unless `exp == act`.                  |
      | `assert_nil(obj)`                  | Fails unless `obj` is `nil`.                |
      | `assert_raises(*exp) { ... }`      | Fails unless block raises one of `*exp`.    |
      | `assert_instance_of(cls, obj)`     | Fails unless `obj` is an instance of `cls`. |
      | `assert_includes(collection, obj)` | Fails unless `collection` includes `obj`.   |

* 



**Notes**:

* Two popular options for testing libraries in Ruby: RSpec and Mintiest

* Import another file from the current file's directory with: `require_relative 'name'`

* Test classes subclass from `MiniTest::Test` 

  * Within those classes, we can define test methods by prepending instance methods with `test_`: `def test_wheels`.
  * our `assert_*` methods are inherited from up the chain

* If we wish to temporarily skip a given test, we can use the keyword `skip` as the first line of the test method.

  * ```ruby
    def test_bad_wheels
      skip
      car = Car.new
      assert_equal(3, car.wheels)
    end
    ```

* The Minitest syntax we've been using so far is the *assertion / assert-style* syntax

  * There's also an *expectation / spec-style* syntax (closer to Rspec)

* **SEAT Approach** (usually 4 steps to writing a test):

  1. **Set up** the necessary objects.
  2. **Execute** the code against the object we're testing.
  3. **Assert** the results of the execution.
  4. **Tear down** and clean up any lingering artifacts.

  * E/A (steps 2 and 3) are the bare minimum required to succesfully test.

  



**Vocab**:

* Domain Specific Language
* Test Suite
  * The entire set of tests that accompany a program or application.
* Test
  * A situation or context in which tests are run. A test can contain multiple assertions.
* Assertion
  * The actual verification step to confirm that the data returned by your program or application is indeed what is expected. One or more assertions may make up a test.



**Card questions**:

* What is the difference between using `assert_equal` (value equality) and `assert_same` (object equality)?
* What instance method do we have to implement in our custom class before we are able to successfully call `assert_equal` on objects of that class?
  * Custom `==` 
* What MiniTest assertion method will fail unless a passed argument `test` is a true value?
  * `#assert(test, msg = nil)`
* What MiniTest assertion method will fail unless a passed argument `obj` is empty?
  * `#assert_empty(obj, msg = nil)`
* What MiniTest assertion method will fail unless passed arguments `exp` and `act` are equal? (using `==`)
  * `#assert_equal(exp, act, msg = nil)`
* What MiniTest assertion method will fail unless a `collection` includes `obj`?
  * `#assert_includes(collection, obj, msg = nil)`
* What MiniTest assertion method will fail unless `obj` is an instance of `cls`?
  * `#assert_instance_of(cls, obj, msg = nil)`
* What MiniTest assertion method will fail unless `obj` has `cls` in its inheritance lookup path?
  * `#assert_kind_of(cls, obj, msg = nil)`
* What MiniTest assertion method will fail unless `obj` is `nil`?
  * `#assert_nil(obj, msg = nil)`
* What MiniTest assertion method will fail unless a passed block raises exception(s) `*exp`?
  * `#assert_raises(*exp) { || ... }`
* What MiniTest assertion method will fail unless `exp` and `act` are `equal?` (in terms of `object_id`)?
  * `#assert_same(exp, act, msg = nil)`
* How can we reverse the output of any given MiniTest assertion?
  * Replace `assert` in the method call with `refutes`: `#refute_empty`, `refute_nil`, etc.