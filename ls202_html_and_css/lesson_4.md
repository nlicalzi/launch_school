## LS202/Lesson 4: Lists and Tables

### Resources

### What to Focus On

* Learn to construct simple lists and nested lists
* Learn to create horizontal lists
* Using pseudo-classes `:hover` and `:focus`
* Construct simple tables with headers, body, and footers
* List Types
  * Understand the difference between ordered, unordered, and description lists
  * Explain when to use which list type
* Table Structures
  * Understand the differences between columns, rows, and cells
  * Use table headers, body, and footers
  * Know the differences between table headers, row headings, and column headings

### Summary

### Notes

* HTML provides six tag to implement the three list types: **unordered**, **ordered**, and **description**.
  * **Unordered Lists**

    * Browser displays bullet points, using the `<ul>` and `<li>` tags

  * **Ordered Lists**

    * Browser displays numbers, roman numerals, or alpha chars, using `<ol>` and `<li>`

  * **Description Lists** (prev. *definition* lists, before HTML5)

    * Each item contains one/more terms and one/more definitions, using `<dl>`, `<dt>`, and `<dd>`

      * ```html
        <dl>
          <dt>Unordered</dt>
          <dd>A simple list with bullets.</dd>
          <dd>A plain list with no bullets or sequence numbers.</dd>
        
          <dt>Ordered</dt>
          <dd>A simple list with sequence numbers or letters.</dd>
        
          <dt>Description</dt>
          <dt>Definition</dt>
          <dd>A list with terms and definitions.</dd>
        </dl>
        ```

  * Any type of list can be nested within any other, regardless of types.

* **Navigation Menus**

  * ```html
    <!-- Vertical -->
    <html>
      <nav>
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="#">Projects</a></li>
          <li><a href="#">Team</a></li>
          <li><a href="#">Help</a></li>
        </ul>
      </nav>
    </html>
    ```

  * ```css
    /* VERTICAL */
    nav ul {
     background-color: powderblue;
     list-style-type: none;
     padding-left: 0;
     width: 200px;
    }
    
    nav li {
     color: blue;
     font-size: 1.25rem;
    }
    
    nav a {
     box-sizing: border-box;
     color: blue;
     display: inline-block;
     line-height: 2.5;
     padding: 0 10px;
     text-decoration: none;
     width: 100%;
    }
    
    nav a:hover,
    nav a:focus {
     background-color: blue;
     color: white;
    }
    
    /* HORIZONTAL */
    nav ul {
      font-size: 0;
      width: 100%;
    }
    
    nav li {
      display: inline-block;
      font-size: 1.25rem;
      text-align: center;
      width: 25%;
    }
    ```

* **Table Tags**

  * HTML provides a variety of tags for constructing tables:

    * `<table>` defines a table

    * `<tr>` defines a single row in a table

    * `<td>` defines a single cell of content in a table; rows consist of 0 or more cells

    * `<th>` defines a single heading; first cell in a row or column is typically a heading

      * Can use the `scope` attribute to define the heading as row or column

        * ```html
          <th scope="col">Color Name</th>
          <th scope="row">red</th>
          ```

        * 

    * `<thead>`, `<tbody>`, and `<tfoot>` are used to provide semantic identification of the header, footer, and body groups of rows.

### Vocab

* **Pseudo-class**

  * A keyword added to a selector that specifies a special state of the selected element(s).

  * For example: `:hover` can be used to change a button's color when the user's pointer hovers over it

    * ```css
      button:hover {
        color: blue;
      }
      ```

  * Resource: https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes

* 