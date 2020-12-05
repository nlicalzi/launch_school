## JS230/Lesson 1: The DOM

### Summary

* .

### Notes

* **The Document Object Model (DOM)**
  * The Document Object Model is an in-memory object representation of an HTML document. It provides a way to interact with a web page using JS and provides the functionality needed to build modern interactive user experiences.
  * CSS-Tricks Article:
    * When you're looking at the panel in whatever DevTools you are using that shows you stuff that looks like HTML, that is a visual representation of the DOM.
    * The DOM *can differ* from the source HTML-- maybe the browser has fixed some mistakes in your code (omitting a tag, for example), but more likely it will differ because **JS can manipulate the DOM**.
      * AJAX can do this, client side templating can do this, etc.
    * A lot of what JS does in the browser is actually **manipulating the DOM API**.
    * **W3's Technical Definition**: The Document Object Model (DOM) is an application programming interface (API) for valid HTML And well-formed XML documents. It defines the logical structure of documents and the way a document is accessed and manipulated. 
  * **Wikipedia's Technical Definition**: The Document Object Model (DOM) is a cross-platform and language-independent interface that treats an XML or HTML document as a tree structure wherein each node is an object representing a part of the document. Each branch of the tree ends in a node, and each node contains objects.
    * DOM methods allow programmatic access to the tree; with them one can change the structure, style, or content of a document.
    * Nodes can have *event handlers* attached to them. Once an event is triggered, the event handler gets executed.

________

* **A Hierarchy of Nodes**
  * The below image represents a visualization for the DOM for the given web page. `HEAD` and `BODY` nodes are inserted even though they don't appear in our HTML because browsers insert missing elements like this by default to try to uphold the value of *permissiveness*, or doing their best to display HTML even when it has errors.

    * ```html
      <html>
        <h1>Hello, world!</h1>
        <p>This is a small <em>web page</em>.</p>
      </html>
      ```

    * <img src="https://d3905n0khyu9wc.cloudfront.net/images/text_node_contents/text_node_contents.png@half.png" alt="img" style="zoom:30%;float:left" />

  * The `HTML`, `HEAD`, `BODY`, `H1`, `P`, and `EM` nodes represent **elements**, while the white `#text` nodes represent **empty nodes** (which typically result from whitespace before and after tags in the HTML (like the newline between `</h1>` and `<p>`.

    * Forgetting about these empty nodes can lead to bugs! Empty nodes are not reflected visually in the web browser, but incrementing through nodes might reveal them by accident.

  * There is not a direct one-to-one mapping between the tags that appear in an HTML file and the nodes in the DOM. The browser may insert nodes that don't appear in the HTML due to invalid markup or the omission of optional tags. Text, including whitespace, also creates nodes that don't map to tags.

    * All text (including whitespace) in the original HTML appears in the DOM as a text node.

  * DOM Tree Viewer app: https://dom-viewer.herokuapp.com/index.html

    * Try visualizing the following:

    * ```html
      <html>
        <head>
          <title>Newsletter Signup</title>
        </head>
        <body>
          <!-- A short comment -->
          <h1>Newsletter Signup</h1>
          <p class="intro" id="simple">
            To receive our weekly emails, enter your email address below.
            <a href="info.html">Get more info</a>.
          </p>
          <div class="form">
            <form>
              <label>
                Enter your email:
                <input name="email" placeholder="user.name@domain.test"/>
              </label>
              <p class="controls">
                <button id="cancelButton">Cancel</button>
                <button type="submit" id="submitButton">Subscribe</button>
              </p>
            </form>
          </div>
        </body>
      </html>
      ```

_____

* **Node Properties**

  * The `document` node represents the entire HTML document (`document.toString() === '[object HTMLDocument]'`), and can be used in conjunction with `querySelector` to get a reference to the first node in the DOM that matches the specified CSS selector like so:

    * `let p = document.querySelector('p');`
    * The documentation for the `HTMLDocument` interface can be found [here](https://developer.mozilla.org/en-US/docs/Web/API/HTMLDocument); be sure to note that `HTMLDocument` inherits from `Node` (more to come on this later).

  * All DOM nodes have certain properties in common:

    * `nodeName`: this property contains a String that represents the node type.

      * For Elements (anything representing an HTML tag), this is the name of the corresponding tag *in uppercase.*
      * For text nodes (incl. empty nodes), the `nodeName` is `#'text'` & `'#comment'` for comments

    * `nodeType`: this property returns a number that matches a node type constant.

      * Most common types below, full list [here](https://developer.mozilla.org/en-US/docs/Web/API/Node/nodeType):

      * | Constant             | Value | Description                         |
        | :------------------- | :---- | :---------------------------------- |
        | `Node.ELEMENT_NODE`  | 1     | An Element representing an HTML tag |
        | `Node.TEXT_NODE`     | 3     | A Text node                         |
        | `Node.COMMENT_NODE`  | 8     | A Comment node                      |
        | `Node.DOCUMENT_NODE` | 9     | A Document node                     |

      * ```javascript
        // Use constant names instead of numeric values to keep code clean/clear
        p.nodeType 				=== Node.ELEMENT_NODE; 	// true
        document.nodeType === Node.DOCUMENT_NODE; // true
        ```

    * `nodeValue`: references the value of a node.

      * Element nodes don't have values: `p.nodeValue === null`
      * Text nodes have value: the textual content of the node, up to the next opening or closing tag.

    * `textContent`: this property represents the textual content of all of the nodes inside the element.

      * Since we know Element nodes have a `nodeValue` of null, we use `textContent` instead to get the text content of the individual nodes inside the Element.
      * `textContent` joins the `nodeValue` of all child Text Nodes together, including any empty Nodes which can lead to excess whitespace. Deal with it by using String/RegExp methods.

_____

* **Determining the Type of a Node**

  * Nodes and Elements

    * All DOM objects are Nodes.
    * All DOM objects have a type that inherits from Node, which means they all have properties and methods that they inherit from Node.
    * The most common DOM object types you will use are **Element** and **Text**.
      * Elements include more specific specialized Element types. While the DOM node that represents a `<p>` HTML tag has type `HTMLParagraphElement`, the Element that represents a `<div>` tag is `HTMLDivElement`.
    * <img src="https://d3905n0khyu9wc.cloudfront.net/images/node_venn.png" alt="Node type diagram" style="zoom: 50%;float:left;" />

  * Inheritance in the DOM

    * `EventTarget` provides the event-handling behavior that supports interactive web applications.
    * `Node` provides common behavior to *all* nodes.
    * `Text` and `Element` are the chief subtypes of `Node`.
      * `Text` nodes hold text.
      * `Element` nodes represent HTML tags.
    * Most HTML tags map to specific element subtypes that inherit from `HTMLElement`.
    * Other element types exist, such as `SVGElement` and its subtypes.

  * Determining the Node Type

    * JS provides two main useful ways to determine a node type:

      * In the console use the `toString` method or the `String` constructor method on the node and read the name from display.

        * ```javascript
          p.toString();
          // => "[object HTMLParagraphElement]"
          
          document.querySelector('a').constructor; // Chrome
          // => function HTMLAnchorElement() { [native code] }
          
          document.querySelector('a').constructor.name; // Firefox
          // => "HTMLAnchorElement"
          ```

      * If you're writing a program, use the `instanceof` function or `tagName` property:

        * ```javascript
          let p = document.querySelector('p');
          p instanceof HTMLParagraphElement;
          // => true
          p instanceof HTMLAnchorElement;
          // => false
          p instanceof Element;
          // => true
          ```

        * ```javascript
          p.tagName;
          // => "P"
          ```

__________

* **Traversing Nodes**

  * DOM nodes connect with other DOM nodes via a set of properties that point from one node to another with defined relationships.

    * Parent nodes:

      * | Parent Node Properties | Value                                         |
        | :--------------------- | :-------------------------------------------- |
        | `firstChild`           | `childNodes[0]` or `null`                     |
        | `lastChild`            | `childNodes[childNodes.length - 1]` or `null` |
        | `childNodes`           | *Live collection* of all child nodes          |

    * Child nodes:

      * | Child Node Properties | Value                                    |
        | :-------------------- | :--------------------------------------- |
        | `nextSibling`         | `parentNode.childNodes[n + 1]` or `null` |
        | `previousSibling`     | `parentNode.childNodes[n - 1]` or `null` |
        | `parentNode`          | Immediate parent of this node            |

  * All DOM nodes that represent elements have **both** parent and child nodes. Whether a node has a non-null *value* for a given property, however, depends on the DOM that contains the node. The last hild of a node has a `null` value for `nextSibling`, while all others have non-null values.

    * <img src="https://d3905n0khyu9wc.cloudfront.net/images/node_hierarchy.png" alt="Connections between nodes in the DOM" style="zoom:50%;" />

  * **Walking the Tree**

    * Walking the tree refers to the process of visiting every node that has a child, grandchild, etc. relationship with a given node and doing something using each of them with recursion.

    * ```javascript
      // walk() calls the function 'callback' once for each node
      function walk(node, callback) {
        callback(node);																					// perform callback
        for (let i = 0; i < node.childNodes.length; i += 1) {		// for each child node
          walk(node.childNodes[i], callback);										// recurse on walk()
        }
      }
      
      walk (document.body, node => { // log nodeName of every node
        console.log(node.nodeName);
      }); // sort of like Array.prototype.forEach, but for the DOM & not Arrays
      ```

__________

* **Element Attributes**

  * Getting and Setting Attributes

    * We can access the attributes of an elements using the following methods:

      * | Method                         | Description                                 | Returns                      |
        | :----------------------------- | :------------------------------------------ | :--------------------------- |
        | `getAttribute(name)`           | Retrieve value of attribute `name`          | Value of attribute as string |
        | `setAttribute(name, newValue)` | Set value of attribute `name` to `newValue` | `undefined`                  |
        | `hasAttribute(name)`           | Check whether element has attribute `name`  | `true` or `false`            |

    * ```javascript
      p.hasAttribute('class'); 	// true
      p.getAttribute('class'); 	// 'intro'
      p.getAttribute('id'); 		// 'simple'
      p.setAttribute('id', 'complex');
      p; // <p class='intro' id='complex'> </p>
      ```

      * It is suggested to access or modify the current value by using its properties rather than `setAttribute`: `Element.value = [...]`

  * Attribute Properties

    * While `getAttribute` and `setAttribute` work for all attributes, some can be accessed in a different way, as properties of the Element: `id`, `name`, `title`, `value`. You can fetch or set the value for these properties using standard property access/assignment operators.
      * Doesn't work for every element type, only some elements have valid `name`/`value` attrs
    * You can access the `class` attribute for some attributes by using `className`, since `class` is a reserved word in JS: `p.className`, etc.

  * `classList`

    * Using the `class` attribute via `className` can be clumsy when elements have more than one class, consider the case: `<button class = btn btn-lg btn-primary">Proceed</button>`
      * `button.className` here will return `"btn btn-lg btn-primary"`
    * We can instead use the `classList` property to return a special array-like object (`DOMTokenList`) that has the following methods and properties:
      * `add(name)`: add class `name` to element
      * `remove(name)`: remove class `name` from element
      * `toggle(name)`: add class `name` to element if it doesn't exist, remove if it does
      * `contains(name)`: return `true` or `false` depending on whether element has class `name`
      * `length`: the number of classes to which the element belongs

  * `style`

    * Element nodes have a `style` attribute that references a `CSSStyleDeclaration` object:

      * ```javascript
        let h1 = document.querySelector('h1');
        h1.style;
        /* =>
        CSSStyleDeclaration {
          alignContent: "",
          alignItems: "",
          alignSelf: "",
          alignmentBaseline: "",
          all: "",
          ...
        }
        */
        
        h1.style.color = 'red';				// set color to red
        h1.style.color = null; 				// set color to null
        h1.style.lineHeight = '3em'; 	// change line height to 3em
        ```

_________

* **Finding DOM Nodes**

  * Finding an Element by ID

    * Use the built-in method `document.getElementById(id)` to get a single element by `id`:

      * ```html
        <!doctype html>
        <html lang="en-US">
          <head>
            <title>On the River</title>
          </head>
          <body>
            <p id="content">The sun is low</p>
            <style>
              document.getElementById('content'); // RETRIEVES THE <p> TAG ELEMENT
            </style>
          </body>
        </html>
        ```

  * Finding More Than One Element (the hard way)

    * ```javascript
      // CUSTOM IMPLEMENTATION
      function walk(node, callback) {
        callback(node);
      
        for (let i = 0; i < node.childNodes.length; i += 1) {
          walk(node.childNodes[i], callback);
        }
      }
      
      function getElementsByTagName(tagName) {
        let matches = [];
      
        walk(document.body, node => {
          if (node.nodeName.toLowerCase() === tagName) { matches.push(node); }
        });
      
        return matches;
      }
      
      getElementsByTagName('p').forEach(paragraph => {
        paragraph.classList.add('article-text');
      });
      ```

  * Built-In Functions

    * We can use built-in methods on `document` to perform the same functions as above. The type of the return value of these methods depends on the browser (returning either `HTMLCollection` or `NodeList`)

      * `getElementsByTagName(tagName)`: returns `HTMLCollection` or `NodeList` of matches
      * `getElementsByClassName(className)`: returns `HTMLCollection` or `NodeList` of matches

    * What is an `HTMLCollection` or `NodeList`?

      * They are both array-like objects, which means that they are non-negative integer indexed collections, but do not have access to many of our standard JS `Array` methods.

      * To loop through an `HTMLCollection` or a `NodeList`, we have to either forego the use of `Array.forEach` or convert the collection to an `Array` before proceeding:

        * ```javascript
          let paragraphs = document.getElementsByTagName('p');
          
          paragraphs.length; 	// returns a Number
          paragraphs[0]; 			// returns first element in collection
          
          // The following will fail: 'forEach' not available in some browsers
          paragraphs.forEach(paragraph => console.log(paragraph.textContent));
          
          // One fix
          let paragraphsArray = Array.prototype.slice.call(paragraphs);
          paragraphsArray.forEach(/* etc. */);
          
          // Alt fix
          for (let i = 0; i < paragraphs.length; i += 1) {
            let paragraph = paragraphs[i];
            console.log(paragraph.textContent);
          }
          ```

    * **NOTE:** Some DOM-querying methods return collections called **live collections**, which automatically update to reflect changes in the DOM:

      * `getElementsByClassName()` is an `HTMLCollection` and is live.
      * `getElementsByTagName()` is an `HTMLCollection` and is live.
      * `getElementsByName()` is a `NodeList` and is live.
      * `querySelectorAll()` is a `NodeList` and is **not** live.

  * **Using CSS Selectors**

    * **Walking the tree becomes more complex as elements are nested deeper and deeper in the DOM. Because of this, alternate methods of finding and selecting given subsets of elements have been developed:**

      * `document.querySelector(selectors)`: returns first matching element or `null`
      * `document.querySelectorAll(selectors)`: returns `NodeList` of matching elements

    * Both `querySelector` and `querySelectorAll` take a string argument of one or more comma-separated css selectors:

      * ```html
        <html>
          <body>
           	<div id="divOne"></div> 
           	<div id="divTwo"></div> 
           	<script>
              document.querySelector('#divTwo, #divOne');
              	// => <div id="divOne"></div>
              document.querySelectorAll('#divTwo, #divOne');
              	// => NodeList(2) [div#divOne, div#divTwo]
           	</script>
          </body>
        </html>
        ```

    * Putting it all together below:

      * ```javascript
        // get all elements with CSS selectors '.intro' and 'p'
        let paragraphs = document.querySelectorAll('.intro p');
        
        // add the class 'article-text' to them
        for (let i = 0; i < paragraphs.length; i += 1) {
          paragraphs[i].classList.add('article-text');
        }
        ```

_________

* **Traversing Elements**

  * We can simplify our node traversal by getting a list of just Elements, rather than having `Text` and other nodes mixed in, through using the following methods:

    * | Parent Element Properties | Value                                     |
      | :------------------------ | :---------------------------------------- |
      | `children`                | *Live collection* of all child elements   |
      | `firstElementChild`       | `children[0]` or `null`                   |
      | `lastElementChild`        | `children[children.length - 1]` or `null` |
      | `childElementCount`       | `children.length`                         |

      | Child Element Properties | Value                                  |
      | :----------------------- | :------------------------------------- |
      | `nextElementSibling`     | `parentNode.children[n + 1]` or `null` |
      | `previousElementSibling` | `parentNode.children[n - 1]` or `null` |

  * `textContent`

    * When using the above DOM properties, we can access the `Text` nodes by using the `textContent` property:

      * ```javascript
        document.querySelector('a').textContent; // access
        document.querySelector('a').textContent = 'step backward'; // reassign
        ```

    * When creating text that we will have to update, make sure to place it within an element. Setting `textContent` removes all child nodesfrom the element in question and replaces them with a single text node. We can wrap the text in a bare `<span>` or `<div>` and assign an id or class to it in order to access it:

      * ```html
        <!doctype html>
        <html lang="en-US">
          <head>
            <title>My Site</title>
          </head>
          <body>
            <div>
              Welcome to the site!<br>
              The time is <span class="time">9:15 am</span>.<br>
              You are logged in as <a href="/account">Kabu</a>.
            </div>
          </body>
          <script>
            // access the first element with class 'time' and update
            document.querySelector('.time').textContent = '9:16 am';
          </script>
        </html>
        ```

      * 

_________

* **Creating and Moving DOM Nodes**

  * Now that we know how to modify existing nodes in the DOM, it's time to learn how to add new ones and manipulate them:

    * ```html
      <!doctype html>
      <html lang="en-US">
        <head>
          <title>Empty Page</title>
        </head>
      	<body>
          <script>
            // first new paragraph (empty)
            let paragraph = document.createElement('p');
            paragraph.textContent = 'This is a text.';
            document.body.appendChild(paragraph);
            
            // second new paragraph (incl. text)
            let text = document.createTextNode('This is a test.');
            let paragraph = document.createElement('p');
            paragraph.appendChild(text);
            document.body.appendChild(paragraph);
          </script>
        </body>
      </html>
      ```

  * Creating New Nodes

    * There are two main ways of creating new nodes:

      * Creating new empty nodes

        * `document.createElement(tagName)` returns a new Element node of type `tagName`
        * `document.createTextNode(text)` returns a new Text node containing `text`

      * Cloning an existing node hierarchy

        * `node.cloneNode(deepClone)` returns a copy of `node`

          * ```javascript
            paragraph;
            // => <p>This is a test.</p>
            
            let paragraph2 = paragraph.cloneNode(true);
            document.body.appendChild(paragraph2);
            ```

  * Adding Nodes to the DOM

    * We can **append, insert, and replace nodes** by using methods on the node's parent:
      * `parent.appendChild(node)`: appends `node` to the end of `parent.childNodes`
      * `parent.insertBefore(node, targetNode)`: inserts `node` into `parent.childNodes` before `targetNode`
      * `parent.replaceChild(node, targetNode)`: removes `targetNode` from `parent.childNodes` and insert `node` in its place
    * **Note: no Node may appear twice in the DOM.** If you try to add a node that already exists somewhere else in the DOM, that original one will be moved to the place of attempted insertion. Use one of the following methods for this:
      * `element.insertAdjacentElement(position, newElement)`: inserts `newElement` at `position` relative to `element`.
      * `element.insertAdjacentText(position, text)`: inserts Text node that contains `text` at `position` relative to `element`.
      * The `position` in the above two methods has to have one of the following String values:
        * `"beforebegin"`: before the element
        * `"afterbegin"`: before the first child of the element
        * `"beforeend"`: after the last child of the element
        * `"afterend"`: after the element

  * Removing Nodes

    * Removing a node from the DOM makes it eligible for garbage collection unless you keep a reference to it in a variable. **Remove nodes using these methods**:
      * `node.remove()`: removes `node` from the DOM
      * `parent.removeChild(node)`: removes `node` from `parent.childNodes`

_________

* **The Browser Object Model (BOM)**
  * It is important to realize that while we have only discussed the DOM so far, there is also a **Browser Object Model** that is accessible with JS beyond page contents. The BOM includes:
    * The windows used to display web pages
    * The browser's history
    * Sensors, including location.

### Concepts/Vocab

* .