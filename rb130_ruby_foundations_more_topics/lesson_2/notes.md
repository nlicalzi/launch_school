### RB130/Lesson_2: Introduction to Testing

Context: Learning unit testing!



**Summary**:

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

* 



**Vocab**:

* Domain Specific Language
* Test Suite
  * The entire set of tests that accompany a program or application.
* Test
  * A situation or context in which tests are run. A test can contain multiple assertions.
* Assertion
  * The actual verification step to confirm that the data returned by your program or application is indeed what is expected. One or more assertions may make up a test.



**Card questions**:

