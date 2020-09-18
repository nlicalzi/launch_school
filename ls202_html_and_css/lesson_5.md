## LS202/Lesson 5: Forms

### Resources

* MDN HTML Forms guide: https://developer.mozilla.org/en-US/docs/Learn/Forms

### What to Focus On

* Use the `form` tag
* Know the differences between checkboxes, radio buttons, and selection lists
* Use `input` and `textarea` text tags
* Understand the `type` attribute on `input` tags
  * `checkbox`, `radio`
  * `text`, `email`, `tel`, `password`
  * `submit`, `reset`
  * `hidden`
* Construct `select` lists
* Use labels in a form with both container and `for` formats
* Use description lists to help format forms

### Summary
### Notes

* Forms are the point where front-end and back-end concerns come together. A form displays information to the user, solicits updates, performs some optional rudimentary validation, and then sends the form data back to the server.

* The `form` tag is the parent for all form-related tags, telling the browser how and where to send data. The most important attributes are `action` and `method`.

  * `action`: provides the URL to which the browser sends requests. 
  * `method`: tells the browser whether to use HTTP GET or HTTP post when sending the data to the server-- `method="get"` or `method="post"`

* A form should contain at least one `input`, `textarea`, or `select` tag; the form is useless without one

  * Also known as a **control**, **widget**, or **input**

* `fieldset`: an optional tag that groups together form content as a set of related data. Most browsers will automatically draw a border around the content (which can be/commonly is removed with CSS), and it provides useful semantic data to the browser

  * ```html
    <form action="/login" method="post">
    	<fieldset>
        <input type="text" name="username" />
        <input type="password" name="password" />
      </fieldset>
      <fieldset>
        <input type="submit" value="Save" />
        <input type="submit" value="Forgot Password" formaction="/forgot" />
      </fieldset>
    </form>
    ```

* `input`: describes a control/widget-- a mechanism that lets the user supply information or a request to the application on the server.

  * Each `input` requires a `type` attribute, which has many default options, and most require a `name` attribute to idenfity each data item in the form:

  * ```html
    <input type="text" name="city" />
    <input type="password" name="password" />
    <input type="submit" value="Save" />
    ```

* `label`: provides a way to associate some identifying text with an input field

  * ```html
    <label for="phone">Phone</label>
    <input type="text" id="phone" name="phone_number" />
    ```

  * ```html
    <!-- Labels can also be used as containers -->
    <label>
      Phone
      <input type="text" name="phone" />
    </label>
    ```

* A complete `form` example:

  * ```html
    <style>
      fieldset {
        border: none;
      }
    </style>
    
    <form action="#" method="post">
      <fieldset>
        <h1>Log in</h1>
        <fieldset>
          <label for="username">Username</label>
          <input type="text" name="username" id="username" />
        </fieldset>
        
        <fieldset>
          <label for="password">Password</label>
          <input type="password" name="password" id="password" />
        </fieldset>
        
        <fieldset>
          <input type="submit" value="Log In" />
          <input type="submit" value="Delete account"
                 formaction="/account/delete" />
          <input type="submit" value="Forgot password"
                 formaction="/account/password" />
          <input type="reset" value="Reset" />
        </fieldset>
      </fieldset>
    </form>
    ```

* **Input Types**

  * `type`: start with the `type` attribute when creating an `input` element. The most common types are:

    * Type `text`: creates a simple text entry field 

      * Use the `maxlength` attribute to specify the input's maximum length

    * Type `password`: creates a single-line text field with an obscured value

      * Use the `maxlength` attribute to specify the input's maximum length

    * Type `email`: allows entry of an email address in the form `username@domain`

    * Type `tel`: allows entry of a telephone number

    * Type `checkbox`: lets the user choose one or more items from a series of yes/no-type options.

      * The boolean attribute `checked` marks a box as checked by default.

      * You can select checked elements in CSS with the `:checked` pseudo-class.

      * The browser sends a `name=value` pair for each *selected* checkbox and *no value* for *unselected* ones. The code below will send `google=on` and `recent=on` to the server:

        * ```html
          <form action="#" method="post">
            <fieldset>
              <label>
                <input type="checkbox" name="choice" value="search" />
                Sort search results
              </label>
              
              <label>
                <input type="checkbox" name="choice" value="google" checked />
                Search on Google
              </label>
              
              <label>
                <input type="checkbox" name="choice" value="recent" checked />
                Recent results (within last year)
              </label>
            </fieldset>
          </form>
          ```

    * Type `radio`: lets the user choose zero or one item from a list of options. 

      * Use the `value` attribute to define the value submitted by this item.

      * Use the `checked` attribute to mark the default radio button.

      * Use the `required` attribute on all buttons to enforce selection if there is no default button

      * ```html
        <form action="#" method="post">
          <fieldset>
            <label>
              <input type="radio" name="color" value="red" />
              Red
            </label>
        
            <label>
              <input type="radio" name="color" value="green" checked />
              Green
            </label>
        
            <label>
              <input type="radio" name="color" value="blue" />
              Blue
            </label>
          </fieldset>
        </form>
        ```

    * Type `submit`: creates a button that the user can click to submit the contents of a form to the server.

      * The `action` attribute on the `form` tag typically provides the URL of the server

      * ```html
        <form action="#" method="post">
          <fieldset>
            <input type="submit" value="Save" />
          </fieldset>
        </form>
        ```

      * 

    * Type `reset`: creates a button that the user can click to reset the contents of a form to its default values. Clicking a `reset` button does not send a request to the server

      * ```html
        <form action="#" method="post">
          <fieldset>
            <input type="reset" value="Clear Form" />
          </fieldset>
        </form>
        ```

      * 

### Vocab
