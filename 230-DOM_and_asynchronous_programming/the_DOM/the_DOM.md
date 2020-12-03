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

* **A Hierarchy of Nodes**

  * The below image represents a visualization for the DOM for the given web page. `HEAD` and `BODY` nodes are inserted even though they don't appear in our HTML because browsers insert missing elements like this by default to try to uphold the value of *permissiveness*, or doing their best to display HTML even when it has errors.

    * ```html
      <html>
        <h1>Hello, world!</h1>
        <p>This is a small <em>web page</em>.</p>
      </html>
      ```

    * <img src="https://d3905n0khyu9wc.cloudfront.net/images/text_node_contents/text_node_contents.png@half.png" alt="img" style="zoom:30%;float:left" />

  * The `HTML`, `HEAD`, and `BODY` nodes represent **elements**, while the white `#text` nodes represent **empty nodes** (which typically result from whitespace before and after tags in the HTML (like the newline between `</h1>` and `<p>`.

    * Forgetting about these empty nodes can lead to bugs! Empty nodes are not reflected visually in the web browser, but incrementing through nodes might reveal them by accident.

  * There is not a direct one-to-one mapping between the tags that appear in an HTML file and the nodes in the DOM. The browser may insert nodes that don't appear in the HTML due to invalid markup or the omission of optional tags. Text, including whitespace, also creates nodes that don't map to tags.

    * All text (including whitespace) in the original HTML appears in the DOM as a text node.

  * DOM Tree Viewer app: https://dom-viewer.herokuapp.com/index.html

* **Node Properties**

* **Determining the Type of a Node**

* **Inheritance and Finding Documentation**

* **Traversing Nodes**

* **Element Attributes**

* **Finding DOM Nodes**

* **Traversing Elements**

* **Creating and Moving DOM Nodes**

* **The Browser Object Model (BOM)**

### Concepts/Vocab

* .