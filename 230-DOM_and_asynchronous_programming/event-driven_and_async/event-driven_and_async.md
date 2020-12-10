## JS230/Lesson 2: Event Driven & Async Programming

### Summary

* `setTimeout(callback, delay)` invokes a function after the specified number of milliseconds.

* `setInterval(callback, delay)` invokes a function repeatedly in intervals of some specified number of milliseconds. `clearInterval` clears the interval and prevents future invocations of the Function.

  * ```javascript
    let interval = setInterval(callback, delay);
    clearInterval(interval);
    ```

* An **event** is an object that represents some occurrence and contains a variaety of information about what happened and where it happened.

  * The browser triggers some events as it loads a page and when it accomplishes some actions directed by an application.
  * The user also triggers events when they interact with the page.

* Code that accesses the DOM should be invoked after the `DOMContentLoaded` event fires on `document`

* User events drive most user interfaces and can result from a user interacting with the keyboard, mouse, touchscreen, window, or other devices. Examples of these user events are `click`, `mouseover`, `keydown`, and `scroll`.

* **Event listeners** are callbacks that the browser will invoke when a matching event occurs.

* `element.addEventListener` registers and event listener. You can also use specific `GlobalEventHandlers` like `element.onclick` to register an event handler.

* The `Event` object provides the useful properties `type`, `target`, and `currentTarget`.

* Keyboard events have properties like `key` (and others) that describe the keys the user pressed. Mouse events similarly provide `button`, `clientX`, `clientY`, and others.

* Events propagate in three phases: **capturing**, **target**, and **bubbling**.

* `event.preventDefault` prevents default browser behavior in response to an event. `event.stopPropagation` stops the current capturing or bubbling phase, which prevents the event from firing on containing or contained elements.

* **Event delegation** is a technique used to handle events triggered by multiple elements using a single event handler.

### Notes

* Asynchronous Execution with `setTimeout`

  * **Sequential code** is code that runs from top to bottom, with each line being executed by the JS runtime in sequence, skipping around when functions are called.

  * **Asynchronous code** is code that doesn't run continuously or even when the runtime encounters it; it can run partly now, then pause and continue after a delay of any interval.

  * `setTimeout` is a function that takes two arguments: a callback function and a waittime (in ms):

    * ```javascript
      // form: setTimeout(callback, waitTime)
      setTimeout(() => {
        console.log('!');
      }, 3000);
      
      setTimeout(() => {
        console.log('World');
      }, 1000);
      
      console.log('Hello');
      
      // the above code logs:
      // Hello 	            (immediately)
      // World 	(after 1000ms)
      // ! 			(after 3000ms)
      ```

    * Note: `setTimeout` is not part of the JS specification, but most environments (modern browsers and Node) have schedulers that make it available.

______

* Repeating Execution with `setInterval`

  * `setInterval` behaves similarly to `setTimeout`, except it will repeatedly invoke the passed callback at the specified time interval until explicitly stopped. (Also not part of the JS specification, but implemented in runtimes.)

    * ```javascript
      // initialize variable to store our interval counter
      let counterId;
      
      function startCounting() {
        let count = 0;
        // assign interval func to counter id
        counterId = setInterval(() => {
          count += 1;
          console.log(count);
        }, 1000);
      }
      
      function stopCounting() {
        // clear the interval that counterId points to (stopping it)
        clearInterval(counterId);
      }
      ```

______

* User Interfaces and Events
  * An **event** is an object that represents some occurrence, containing information about what happened and where it happened.
    * The browser can trigger events as the page loads, when the user interacts with the page, and when the browser performs some action required by the program.
  * The code that the browser runs in response to a given event is the **event listener**.
  * Since a lot of web apps consist mainly of a user interface, the code within them has two main tasks:
    * Set up the user interface and display it
    * Handle events resulting from user or browser actions

_____

* A Simple Exchange

  * The code snippet below displays a string representation of a number and a button labeled "Add One", each time the button is clicked the number increments by one.

    1. When the browser loads the page, the JS within the `script` tag is evaluated, adding an event listener for when `DOMContentLoaded` fires (i.e. the browser fully loads the HTML on the page below the `script` and uses it to build the DOM then **fire** the `DOMContentLoaded` event on `document`.
    2. This executes the code in the callback passed to `addEventListener` (the **event handler**), which gets references to 2 DOM elements (`addButton` and `output`), as well as initializing the variable `count` and adding an event listener for `click` events on `addButton`.
    3. The browser then goes back into the event loop, waiting for an event to fire.
    4. When the user clicks the button, the `click` event fires and the browser runs the handler (increasing the value of `count` and updating the `textContent` of the `#output` `span`)
    5. The browser goes back to waiting for an event to fire, etc.

  * ```html
    <!doctype html>
    <html lang="en-US">
      <head>
        <title>title</title>
        <meta charset="UTF-8">
        <script>
          document.addEventListener('DOMContentLoaded', event => {
            let addButton = document.getElementById('add');
            let output = document.getElementById('output');
            let count = 0;
    
            addButton.addEventListener('click', event => {
              count += 1;
              output.textContent = String(count);
            });
          });
        </script>
      </head>
    
      <body>
        <p>
          <span id="output">0</span>
          <button id="add">Add One</button>
        </p>
      </body>
    </html>
    ```

_____

* Page Lifecycle Events
  * What steps does a browser go through to display a website? (**MENTAL MODEL**)
    * HTML code received from server.
    * HTML parsed and JavaScript evaluated.
    * DOM constructed from parsed HTML.
    * **`DOMContentLoaded`** event fires on **document**.
      * We usually use this event when we have JS code that must access the DOM.
    * Page displayed on screen.
    * Embedded assets are loaded.
    * **load** event fires on **window**.

_____

* User Events
  * What are some examples of user events we might need to listen to based on device?
    * Keyboard: `keydown`, `keyup`, `keypress`
    * Mouse: `mouseenter`, `mouseleave`, `mousedown`, `mouseup`, `click`
    * Touch: `touchdown`, `touchup`, `touchmove`
    * Window: `scroll`, `resize`
    * Form: `submit`
  * Full list of events can be found here: https://developer.mozilla.org/en-US/docs/Web/Events

_____

* Adding Event Listeners

  * **Event listeners** / **event handlers** are functions that the JS runtime calls when a particular event occurs.

  * There are four steps needed to set up an event handler:

    1. Identify the event that you need to handle: user actions, the page lifecycle, etc. can fire events
    2. Identify the element that will receive the event: a button, input field, etc.
    3. Define a function to call when this event occurs: function should take a single Event arg.
    4. Register the function as an event listener: tie the first 3 steps together

  * The `GlobalEventHandlers` mixin provides an alternative way to register a function as an event listener for an element.

    * Rather than adding a `click` handler with `button.addEventListener`, we can assign the listener to the `onclick` property of the button itself

      * ```javascript
        document.addEventListener('DOMContentLoaded', () => {
          let button = document.getElementById('alert');
          button.onclick = displayAlert;
        });
        ```

      * Other useful features of `GlobalEventHandlers` include `onsubmit` and `onkeypress`

_____

* The `Event` Object

  * The argument object passed to the event handler in `addEventListener` provides extra information about the event (beyond just that it occurred):

    * ```javascript
      document.body.addEventListener('click', event => { // event is an Event object
        let elementClicked = event.target;
        let elementAttached = event.currentTarget;
        let p = document.getElementById('message');
        p.textContent = elementClicked.tagName;
        let p2 = document.getElementById('message2');
        p2.textContent = elementAttached.tagName;
      });
      ```

  * Some useful properties that appear in `Event` objects include:

    * `type`: the name of the event (e.g. 'click')
    * `currentTarget`: the current object that the event is on (that has the event listener attached)
    * `target`: The initial object to receive notification of the event (e.g. the element that was clicked)

  * Mouse Events

    * `button`: read-only property that indicates which button was pressed

    * `clientX` / `clientY`: mouse position (in visible area of page, from upper-left) on event occuring

    * ```javascript
      // move the element having class selector '.x' on mouse move
      
      document.addEventListener('mousemove', event => {
        let x = document.querySelector('.x');
        x.style.left = String(event.clientX) + 'px';
        x.style.top = String(event.clientY) + 'px';
      });
      ```

  * Keyboard Events

    * `key`: the string value of the pressed key (older browsers do not support this property)

    * `shiftKey` / `altKey` / `ctrlKey`: bool that indicates whether the specified key was also pressed

      * Modified keys (shift, ctrl, etc.) don't fire `keypress`, only `keyup` and `keydown`

    * ```javascript
      // change color of the x based on key presses
      document.addEventListener('keyup', event => {
        let key = event.key;
        let color;
      
        if (key === 'r') {
          color = 'red';
        } else if (key === 'g') {
          color = 'green';
        } else if (key === 'b') {
          color = 'blue';
        }
      
        if (color) {
          let x = document.querySelector('.x');
          // convert x.children to an array to map both .horizontal and .vertical
          [...x.children].map(child => {
            return child.style.background = color;
          });
        }
      });
      ```

    * ```javascript
      // Updating a textarea and reporting text based on character length
      let text;
      let maxLen = 140;
      
      document.addEventListener('keyup', event => {
        text = document.getElementsByTagName('textarea')[0].value;
        
        let charsRemaining = maxLen - text.length;
        let reportCharLength = String(charsRemaining) + ' characters remaining.';
        let reporter = document.querySelector('.reporter');
        
        reporter.innerText = reportCharLength;
        
        if (charsRemaining < 0) { document.getElementsByTagName('textarea')[0].style.color = 'red'; }
      });
      ```

_____

* Capturing and Bubbling

  * What are the drawbacks of working with events by adding handlers to elements that maybe the source of events?

    * You can't add an event listener to an element until the DOM is ready, which means you must wait until the `DOMContentLoaded` event fires.
    * You must add event handlers manually when you add new elements to the page after `DOMContentLoaded` fires.
    * Adding handlers to many elements can be slow, and can lead to complicated, difficult to maintain code.

  * How can we solve the above issues?

    * Through a process called **event delegation**, which we can discuss after we learn a bit more about **capturing** and **bubbling**

  * **Capturing** and **Bubbling**

    * The number of elements that you can interact with is equal to the element the event listener was added to, plus the number of **"nested"** inner elements.

    * `target` vs `currentTarget`

      * `target` refers to the element on which the element occurred (possibly a nested element), while `currentTarget` refers to the element to which an event listener is added.

    * The value of `this` within the handler when using a function expression is the element that the listener was added to (`currentTarget`):

      * ```javascript
        // the following code snippets are equivalent
        
        // using a function expression for the callback
        elem2.addEventListener('click', function(event) {
          alert(event.currentTarget.id);
        });
        
        elem2.addEventListener('click', function(event) {
          alert(this.id);
        });
        ```

    * **Capturing** and **bubbling** are phases that an event goes through after it initially fires. 

      * The event first gets dispatched to the global `window` object, then to the `document` object, all the way down to the target element, which is the element on which the event was originally fired.

      * At this point, the dispatch process referses and from the `target` element works its way back up through containing elements until it reaches the `window` object.

      * <img src="https://d3905n0khyu9wc.cloudfront.net/images/event_phases_v4.png" alt="Event capturing and bubbling" style="zoom: 25%; float: left;" />

        * There is only one `click` event firing in the above image, but it is depicted moving through the capturing and bubbling phases and checks each DOM object it passes through for listeners.

        * The event gets dispatched to each element in the tree twice-- once during capturing and once during bubbling. The actual listener only gets called/fired in one phase: during bubbling:

          * ```javascript
            // add an optional third arg to tell the event listener to listen
            // through the capturing phase (the useCapture param defaults to false)
            elem1.addEventListener('click', callbackFunc, true);
            ```

      * We are able to interact with child elements even though an event listener is only attached to their parent because when we click on a child element, the `click` event bubbles up (from `target`) and passes the parent object that has a listener for it.

  * Capturing and Bubbling (2)

    * Adding an event listener of the same type (`click`) to the same element doesn't overwrite the first one that was added. 
    * Event objects pass through the capturing phase before the bubbling phase, and passing an optional third arg (which defaults to false as `useCapture`) to `addEventListener` will result in the listener getting fired in the capturing phase instead of the bubbling phase.
    * Events queue, and the oldest one gets processed first regardless of the type of the event (this is due to the **event loop**).

_____

* Preventing Propagation and Default Behaviors

  * Stopping Propagation with `event.stopPropagation`

    * `event.stopPropagation` stops the `event` object from continuing its path along the capturing and bubbling phases.

    * ```javascript
      function turnRed(event) {
        event.stopPropagation();
        event.currentTarget.style.background = 'red';
      }
      
      document.addEventListener('DOMContentLoaded', () => {
        // this code fires during the capturing phase and then stops
        document.querySelector('.outer').addEventListener('click', turnRed, true);
        // this bottom code never fires due to the `stopPropagation` call
        document.querySelector('.inner').addEventListener('click', turnRed);
      });
      ```

  * Preventing Default Behaviors with `event.preventDefault`

    * The `preventDefault` method on `Event` objects tells the browser that it shouldn't perform any actions that it might otherwise perform in response to a user's action.
    * The default behavior isn't for the element that the event listener is attached to, but rather for the `event` object.
    * The browser waits for the event object to go through the propagation phases (capturing and bubbling) before it performs the default action of the event. If there's an event handler with a `preventDefault` call somewhere in the propagation path, the default behavior is skipped.
    * It's good practice to call `preventDefault` or `stopPropagation` as soon as possible in an event handler, thereby emphasizing the presence of those methods to people reading the code and ensuring that the methods are run before any errors occur.

_____

* Event Delegation

  * What are some issues with adding an event listener on `DOMContentLoaded`?

    * We must wait for the DOM to finish loading before adding event handlers, potentially introducing problems if we have other code that must wait before running.
    * Modern web pages often add new elements after the page finishes loading. If we add event listeners to elements that exist when the page finishes loading, any later elements that are added won't have those listeners and we'll have to explicitly add them as they are created.
    * Adding many listeners to a document has a cost in performance and memory. 

  * **Event delegation** takes advantage of event propagation to address the above problems. Consider the following code snippet:

    * ```javascript
      document.addEventListener('click', event => {
        let tag = event.target.tagName;
        // do something if target is a button
        if (tag === 'BUTTON') {
          let message = document.getElementById('message');
          message.textContent = `${event.target.textContent} was clicked!`;
        } else if (tag === 'A') {
          // prevent browser from taking default action if target is an A tag
          // i.e. opening a new window
          event.preventDefault();
         	event.target.classList.toggle('highlight');
        }
      });
      ```

  * *When should we use event delegation?*

    * When a project is new and small, we should start by binding event handlers directly to elements.
    * As a project grows in size and complexity, delegation makes sense to reduce the number of event handlers that are required.
      * Note: we don't need to use `document` as the delegator-- we can delegate events to any parent element of the elements that we want to monitor (and even have more than one element handling delegated events if required).

______

* What is the Event Loop? (https://www.youtube.com/watch?v=8aGhZQkoFbQ)

  * Add'l reading: https://blog.bitsrc.io/understanding-asynchronous-javascript-the-event-loop-74cd408419ff

  * JS is single-threaded, we just have the one call stack in the runtime (which tracks our execution context and function/method calls).

    * However, when we're running code in the browser we have access to capacity that isn't reliant on the run time (WebAPIs that aren't in the JS runtime like the `DOM`, `XMLHttpRequest`/AJAX, `setTimeout`)

      * <img src="/Users/nicholaslicalzi/Library/Application Support/typora-user-images/Screen Shot 2020-12-09 at 3.32.28 PM.png" alt="Screen Shot 2020-12-09 at 3.32.28 PM" style="zoom:50%;float:left" />

    * When some code from a WebAPI has finished executing, it moves the code to the **task queue**. 

    * The **event loop** looks at the stack and the task queue: if the stack is empty, it takes the first thing on the queue and pushes it onto the stack (then it runs).

      * ```javascript
        console.log('Hi');
        
        // this goes to the task queue and doesn't execute until the stack is clear
        setTimeout(() => { // setTimeout is browser code, not standard JS runtime code
          console.log('there');
        }, 0);
        
        console.log('JSConfEU');
        
        // This code logs:
        // Hi
        // JSConfEU
        // There
        ```

      * ```javascript
        console.log('Hi');
        
        // JQuery implements .get in a non-blocking manner
        // kicking its execution to the task queue
        $.get('url', function cb(data) {
          console.log(data);
        });
        
        console.log('JSConfEU');
        
        // this code logs:
        // Hi
        // JSConfEU
        // { some: 'json' }
        ```

  * What is **blocking behavior** / a blocking function?

  * How do we handle blocking?

    * **Asynchronous callbacks** like using `setTimeout(callback, timeMS)` let us avoid putting slow functions on the stack and slowing down/blocking execution, instead putting them on the **message/task/callback queue**, which the event loop will pull from and put onto the stack when the stack is empty. 

______

* Promises and `async` / `await` (note: not covered in the assessment)

  * Events work well for things that can happen multiple times on the same object, like clicks or keypresses. However, what should we do when we care about what happens before we attach the listener to an element?

    * Use a promise:

    * ```javascript
      var promise = new Promise(function(resolve, reject) {
        // do a thing, possibly async, then...
        if (/* everything turned out fine */) {
      		resolve("Stuff worked!");
      	}
      	else {
      		reject(Error("It broke"));
      	}
      });
      
      promise.then(function(result) {
        console.log(result); // Stuff worked!
      }, function(err) {
        console.log(err); // Error: It broke
      });
      ```

  * What is a promise?

    * The `Promise` object represents the eventual completion (or failure) of an asynchronous operation and its resulting value.
    * A `Promise` is a proxy for a value not necessarily known when the promise is created. It allows you to associate handlers with an asynchronous action's eventual success value or failure reason. 
    * This lets asynchronous methods return values like synchronous methods: instead of immediately returning the final value, the asynchronous method returns a *promise* to supply the value at some point in the future.
    * ![img](https://mdn.mozillademos.org/files/15911/promises.png)

  * What states can a promise have?

    * Promises have three possible mutually exclusive states: fulfilled, rejected, and pending:
      * A promise is *fulfilled* if `promise.then(f)` will call `f` "as soon as possible".
      * A promise is *rejected* if `promise.then(undefined, r)` will call `r` "as soon as possible".
      * A promise is *pending* if it is neither fulfilled nor rejected.

  * What fates can a promise have?

    * Promises have two possible mutually exclusive fates: resolved and unresolved:
      * A promise is *resolved* if trying to resolve or reject it has no effect, i.e. the promise has been "locked in" to either follow another promise or has been fulfilled/rejected.
      * A promise is *unresolved* if it is not resolved, i.e. if trying to resolve or reject it will have an impact on the promise.

### Concepts and Vocab





































