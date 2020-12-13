## 230 Lesson 4: JavaScript Libraries

### Summary

### Notes

* Introduction

  * Historically, lack of cross-browser support/differences in the implementation of some of the APIs we have used made it difficult to ensure that the same front-end code worked across browsers.
  * jQuery was developed in response to these browser compatibility issues, and abstracted away the complexities of working around the inconsistencies, providing an API for DOM manipulations, event handling, AJAX, and other things.

* [Douglas Crockford Lecture: The Metamorphosis of Ajax](https://www.youtube.com/watch?v=Fv9qT9joc0M)

* jQuery

  * **jQuery** is a JavaScript library that provides a convenient API to manipulate elements, handle events, make AJAX requests, and more. It works consistently across browsers and platforms.

  * Adherence to standards and modern browser APIs mean that we can now accomplish most of what jQuery does with vanilla JS, without complex hacks or workarounds (original motive for it).

  * The jQuery Function

    * At its core, jQuery is a **function** that *wraps a collection of DOM elements* and some *convenience methods* into an *object*.

      * If the argument passed to it is a string or DOM element, it wraps a collection of jQuery objects and returns them.

      * If the argument passed to it is a function, jQuery uses that function as a callback when the *document is ready*.

      * It is standard to use the alias `$` instead of using `jQuery` when calling the function:

        * ```javascript
          var $content = jQuery('#content');
          var $sameContent = $('#content');
          ```

        * Both forms of the function return an object representing a collection of elements.

    * Collections

      * When using an ID selector, the collection holds one element, any size for other selectors.

      * ```javascript
        var $lis = $('li');
        $lis.length; // 3
        ```

    * The `jquery` property

      * Check the jQuery property to confirm if a variable/property references a jQuery object.

      * ```javascript
        console.log($content.jquery);
        ```

  * The DOM Ready Callback

    * Since most of jQuery acts on DOM elements, we wait for the page to load before we execute our code. jQuery has implemented that functionality in a very simple way:

    * ```javascript
      $(function() {
        // DOM is now loadded
      });
      ```

  * jQuery Object Methods

    * Getters and Setters

      * ```javascript
        console.log($content.css('font-size')); // getter
        $content.css('font-size', '18px');			// setter
        ```

      * ```javascript
        var width = $content.width(); 	// 800 (getter)
        $content.width(width / 2); 			// sets to 400
        console.log($content.width());	// now 400 (getter)
        ```

    * Object Argument ([link](https://api.jquery.com/css/#css-properties))

      * ```javascript
        $content.css({
          'font-size': '18px',
          color: '#b00b00'
        });
        ```

    * Property Name Syntax

      * In the above code, we put `font-size` in quotes because `-` represents substitution in JS. jQuery accepts camel case properties that replace hyphenated ones:

      * ```javascript
        $content.css({
          fontSize: '18px',
          color: 'b00b00',
        });
        ```

  * Convenience Methods

    * Check the type of an object using methods like `$.isArray`, `$.isFunction`
    * Most important method: `$.ajax`, for making AJAX requests-- more to come...

  * Explore the Documentation

    * [jQuery Learning Centre](https://learn.jquery.com/)
    * [jQuery API reference](https://api.jquery.com/)
    * Focus: [the jQuery Object](https://learn.jquery.com/using-jquery-core/jquery-object/)

* jQuery DOM Traversal

  * Looking Outwards from an Object (`parent`, `parents`, `closest`)

    * ```javascript
      // to get the parent element of a paragraph
      var $p = $('p');
      $p.parent().css('color', 'blue');
      ```

    * ```javascript
      // to get only the parent elements of 'p' that have class `highlight`
      var $p = $('p');
      $p.parent('.highlight').css('color', 'blue');
      ```

    * The `closest` method is useful for finding the first ancesor element that matches a criteria:

      * ```javascript
        $('#javascript').closest('ul').addClass('categories');
        ```

  * Looking Inwards from an Object

    * You can call `find` on `$` to traverse one of its child elements using a CSS-like selector:

      * ```javascript
        $('ul#navigation').find(li);
        ```

    * You can use `children` to get immediate children elements that match the specification:

      * ```javascript
        $('#navigation').children();
        ```

  * Finding Sibling Elements

    * `nextAll` will return all siblings after the current one, with an optional selector passed in:

      * ```javascript
        // find all list items after the CSS list item and hide them
        var $css = $('css').closest('li');
        $css.nextAll().hide();
        
        // find all list items before the CSS list item and hide them
        $css.prevAll().hide();
        
        // find all sibling lis and show them
        $css.siblings().show();
        ```

    * `next()` and `prev()` get a single sibling element each.

  * Futher Reading

    * [jQuery documentation on Traversing](https://api.jquery.com/category/traversing/)

* Using jQuery Selectors

  * Element selectors: `$('element')`
    * Element at index 3: `$('element:eq(3)')`
    * Last element: `$('table td').last()`
  * ID selectors: `$('#id')`
  * Class selector: `$('.class')`
    * Negative class selector: `$('td').not(".protected")`
  * Descendent selectors: `$('ancestor descendent')`
  * Even/odd index selector: `$('li:even')` / `$('li:odd')`

* jQuery Events

  * A Simple Click Handler

    * ```html
      <ul>
        <li><a href="#">Apples</a></li>
        <li><a href="#">Bananas</a></li>
        <li><a href="#">Oranges</a></li>
      </ul>
      
      <p>Choose your favorite fruit!</p>
      ```

    * ```javascript
      $(function() { // syntax for executing after DOM loads
        $('a').on('click', function(event) { // when any A link is clicked
          event.preventDefault(); // don't load the link/reload page
        });
      });
      ```

  * Do Something With The Click

    * Since in the above code, we've bound the click event to every anchor tag on the page, how do we know which one the user clicked?

      * Use the `target` or `currentTarget` attribute on the event object (same val. in this case)
      * Use the value of `this` within the callback.

    * ```javascript
      var $p = $('p'); // get the paragram element
      
      $('a').on('click', function(event) {
        event.preventDefault();
        var $anchor = $(this); // `this` is a DOM element, so we pass thru jQuery func
        $p.text('Your favorite fruit is ' + $anchor.text()); // fill p tag w/ choice
      });
      ```

  * Adding More Fruits Dynamically

    * ```html
      <ul>
        <li><a href="#">Apples</a></li>
        <li><a href="#">Bananas</a></li>
        <li><a href="#">Oranges</a></li>
      </ul>
      
      <form action="#" method="post">
        <fieldset>
          <input type="text">
          <input type="submit" value="Choose">
        </fieldset>
      </form>
      
      <p>Choose your favorite fruit!</p>
      ```

    * ```javascript
      $('form').on('submit', function(event) { // listen for form submissions
          event.preventDefault(); // prevent a reload
          let $input = $(this).find('input[type=text]'); // grab submitted form input
          $p.text(OUTPUT + $input.val()); // modify p element's text
      });
      ```

  * Refactoring / Convenience Methods

    * ```javascript
      $(function() { // on DOM load
        let $p = $('p'); // select paragraph element
        const OUTPUT = 'Your favorite fruit is ';
        
        $('a').click(function(e) { // use the click method
          e.preventDefault(); // prevent new page load
          let $anchor = $(this);	// get clicked anchor tag & pass thru jQuery func
          $p.text(OUTPUT + $anchor.text()); // modify p element's text
        });
        
        $('form').submit(function(e) { // use submit method to listen on form submit
          e.preventDefault(); // prevent a reload
          let $input = $(this).find('input[type=text]'); // grab submitted form input
          $p.text(OUTPUT + $input.val()); // modify p element's text
        });
      });
      ```

  * jQuery Event Delegation

    * When an event handler is bound to a large number of elements in the same container, it's more performant to delegate event handling to the parent element.

      * ```html
        <ul>
          <li>
            <p>Bananas</p>
            <a href="#">Remove</a>
          </li>
          <!-- 29 more list items, each with a remove anchor -->
        </ul>
        ```

      * ```javascript
        // WRONG WAY TO DO IT (bind to each anchor)
        $('a').click(function(e) {
          e.preventDefault();
          $(this).closest('li').remove();
        });
        
        // RIGHT WAY TO DO IT (bind to ul, the parent element)
        $('ul').on('click', 'a', function(e) {
          e.preventDefault();
          $(e.target).closest('li').remove();
        });
        ```

  * Further Reading

    * [Event Binding in jQuery](https://medium.com/@sak1986/event-binding-in-jquery-daf902be7c58)

* HTML Templating with JavaScript

* Handlebars Basics

* AJAX Requests

### Concepts/Vocab