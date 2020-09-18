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

  * 

### Vocab
