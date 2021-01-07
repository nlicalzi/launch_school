## 230/Lesson 5: Putting it All Together

### Summary

### Notes

* **Chrome Debugging Tools for Front End Development**
  * Good to use `console.log({pets})` instead of `console.log(pets)` -- **object shorthand syntax**
    * Difference between logging `(3) [{...}, {...}, {...}]` and `{pets: Array(3)}`
    * `console.table(pets)` will print a properly formatted table of your object/values
  * Learn to debug with the `Sources` panel
    * Better suited for tricky bugs
    * Keeping track of code execution order
      * Code stepping
      * Call stack
      * Code Folding
    * Keeping track of values
      * Values printed inline after a line of code executes
      * Scope pane
      * Run JS contextually in the Drawer
      * [Live Expressions](https://developers.google.com/web/tools/chrome-devtools/console/live-expressions)
      * [Logpoints](https://developers.google.com/web/tools/chrome-devtools/javascript/breakpoints): `DOM`, `XHR`, `Event-listener`, `Function`, all in addition to normal `line-of-code`
      * Storing the output of Logpoints as global variables

______

* **HTML Data Attributes**

  * With the arrival of HTML5 came the ability to create custom data attributes: you can create your own attributes and set their values to match custom attributes on content blocks.

    * Custom data attributes can be added to any HTML element

    * Data attributes always start with the prefix `data-[...]`

    * ```html
      <ul>
        <li><a href="#" data-block="gold">Gold Sponsors</a></li>
        <li><a href="#" data-block="silver">Silver Sponsors</a></li>
        <li><a href="#" data-block="bronze">Bronze Sponsors</a></li>
      </ul>
      
      <article data-block="gold">
        <h1>Gold Sponsors</h1>
      </article>
      
      <article data-block="silver">
        <h1>Silver Sponsors</h1>
      </article>
      
      <article data-block="bronze">
        <h1>Bronze Sponsors</h1>
      </article>
      ```

  * In jQuery, there are two main ways to query these custom data attributes:

    * the `.attr` method: specifies attribute name and value of the attribute

      * Use this as a getter/setter for HTML data attributes

      * ```javascript
        var $a = $('a[data-block=gold]');
        
        console.log($a.attr('data-block')); // gold
        console.log($a.data('block')); 			// gold
        
        $a.data('block', 'silver');	// retrievable value using data, but not attr
        
        console.log($a.attr('data-block')); // still logs 'gold'
        console.log($a.data('block'));			// changed to 'silver'
        ```

    * the `.data` method

      * Use this to set and retrieve custom data on an element after page rendering
  * As a setter, `data` stores the value on a node, but doesn't update HTML markup
    
  * A DOM element containing a custom data attribute will have a property called `dataset` that represents a specialized object of key-value pairs: keys as attribute names/vals as vals:

    * ```html
    <div id="gold" data-block="gold">
        <h1>Gold Sponsors</h1>
      </div>
      ```
  
    * ```javascript
    var gold = document.getElementById('gold');
      
      console.log(gold.dataset); // { block: "gold" }
      
      gold.dataset.block = 'silver'; 					// we can overwrite and update the HTML
      gold.dataset.sponsor = 'Newman\'s Own'; // we can add data attributes
      delete gold.dataset.block; 							// we can delete data attributes
      
      // remember to remove hyphens and camelcase our names
      // <div data-date-of-birth="28-02-1981"></div> becomes...
      div.dataset.dateOfBirth;
      ```

_____

* Readings:
  * [Moving from jQuery to Vanilla JS](https://tobiasahlin.com/blog/move-from-jquery-to-vanilla-javascript/) 
  * [Removing jQuery from Github frontend](https://github.blog/2018-09-06-removing-jquery-from-github-frontend/)

### Concepts/Vocab

