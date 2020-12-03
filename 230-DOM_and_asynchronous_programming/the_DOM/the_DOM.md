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

_________

* **Inheritance and Finding Documentation**
  * .

__________

* **Traversing Nodes**
  * .

__________

* **Element Attributes**
  * .

_________

* **Finding DOM Nodes**
  * .

_________

* **Traversing Elements**
  * .

_________

* **Creating and Moving DOM Nodes**
  * .

_________

* **The Browser Object Model (BOM)**
  * .

### Concepts/Vocab

* .