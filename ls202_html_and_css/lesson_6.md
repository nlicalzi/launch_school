## LS202/Lesson 6: Advanced Layout

### Resources

* CSS Tricks
  * https://css-tricks.com/snippets/css/a-guide-to-flexbox/
  * https://css-tricks.com/snippets/css/complete-guide-grid/
* MDN
  * https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox
  * https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout

### What to Focus On

In this lesson, we'll take a whirlwind tour of some layout-related features of CSS: floats, positioning, flex, grid, CSS frameworks, and responsive design. None of these topics are easy; in fact, unlike most of our material here at Launch School, **we don't expect you to master them in this lesson**.

For now, focus on knowing how to use the following in simple projects:

* floated elements, including how to clear floats
* positioning with `position: absolute`
* basic media queries
* liquid and fluid layouts

### Summary

* Floated elements
* Simple positioning
* Liquid and fluid layouts
* Media queries
* How and why you need to clear floats

### Notes

* **Floats**

  * Make sure all floats in a group have the same height and direction and they will wrap logically.

* **Containing Floats**

  * The browser removes floats from the normal document flow, and that means that a given container no longer contains the floated items.

  * To fix this problem, we must add an `overflow` option to the floated element's container or wrap it in a **clearfix**

    * **`overflow`**

      * ```css
        #columns {
          overflow: hidden;
        }
        ```

        * `overflow: hidden` can clip content that exceeds the allocated space for the text if the container has a set height or width
        * `overflow: auto` can add unwanted scrollbars, which is a browser-specific behavior

      * `overflow` works by creating a **block formatting context**, which contains everything inside the element to which it applies, including floats.

    * **clearfix** is a standard pattern that developers use to ensure a container doesn't lose its floated children.

      * It employs an invisible block element as the last child element of the container and the `clear` property.

      * ```css
        #columns::after {/* pseudo-element, creates child element at end of element */
          clear: both; /* "clear" the floats inside the container */
          content: ""; /* sets the content of the child element */
          display: block; /* element must be on a line by itself */
        }
        ```

* **Positioning**

  * Offset Properties
    * The **offset properties** are `top`, `right`, `bottom` and `left`. They work in conjunction with `position` to determine what direction you want to move an element and how far.
    * Each offset measures the *inward* distance from the side of the container named by the offset property. E.G. `bottom: 50px` indicates a position 50px up (inward) from the bottom edge.
  * The `position` property: tells the browser how to position the selected elements:
    * `position: static` (the default)
      * While floated, grid, flex, and other elements with absolute and fixed positioning get removed from the page flow, statically positioned items are part of the page flow.
      * `static` elements appear in the same order as in markup, and are unaffected by the offset properties.
    * `position: relative`
      * Moves an element to a new position relative to where the browser would otherwise put it.
      * An element with `left: 50px` , `bottom: 100px`, and `position: relative` applied will shift 50px right and 100px up from where the browser would otherwise place it.
      * Use one of each of `left/right` and `bottom/top`, not both (`left` and `top` override others)
      * *Does not remove* an item from the document flow. The next element will be positioned by the browser as though the previous one was still in its pre-offset location.
    * `position: absolute`
      * Causes the browser to move the element to a new position within a container element.
      * By default, the container is the nearest ancestor element that has a relative, absolute, or sticky `position`.
        * If no such ancestor is present, the browser uses the initial containing block (the body).
    * `position: fixed`
      * Sets an element to a fixed position within a window.
      * The element does not move if the user scrolls the page (ex. a sticky navigation bar)

* **Flex and Grid**

  * `display: flex` acts as a one-dimensional layout tool for a single row or column

    * How can we center a `div` inside a `body` using `display: flex`?

      * ```css
        body {
          display: flex;
          justify-content: center;
          align-items: center;
        }
        
        /* OR */
        
        body {
          display: flex;
        }
        div {
          margin: auto;
        }
        ```

    * How can we center a nav bar?

      * ```css
        nav ul {
          display: flex;
          flex-direction: row; /* default, alternative is `column` */
          justify-content: space-around;
        }
        ```

    * How can we change the order of elements inside a `flex` box? 

      * By setting the `order` property, ex: `order: -1`

  * `display: grid` is better suited for two-dimensional layouts

    * Allows us to define a grid container using (`display: grid`) then locate elements inside it

    * `grid-template-columns: 2fr 1fr 1fr`: splits grid into `50% 25% 25%` across (`fr` = fraction)

    * `grid-template-rows: 1fr 1fr 1fr`: splits the grid into 3rds vertically

    * Grid items auto-populate grid from top left to bottom right based on HTML source order

    * Can use `grid-[column/row]: start/end` to define start/end lines for an item

      * `grid-template-areas` uses a text-based grid map to apply grid area names to individual cells, making responsive layouts easier to design (instead of tracking numbers)

        * ```css
          .site {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr;
            grid-template-rows: auto 1fr 3fr;
            grid-template-areas:
              "title title title"
              "main header header"
              "main siderbar footer";
          }
          .masthead {
            grid-area: header;
          }
          .page-title {
            grid-area: title;
          }
          .main-content {
            grid-area: main;
          }
          ```

    * Nest grids for closer control!

* **CSS Frameworks**

  * The basic idea behind CSS frameworks: they create a grid system using classes, and your HTML uses those classes to handle the layout part of your site.
  * Beyond that, they also provide "responsive design" capabilities to your site, which lets your site work well on all devices from the smallest to the largest.

* **Responsive Design**

  * **CSS media queries** typically define styles that change based on the current size of the browser window, letting us customize the look for phones, tablets, laptops, desktops, etc.

    * ```css
      a {
        color: #f00;
      }
      
      @media (max-width: 480px) { /* styles inside apply when screen has width 480px*/
        a {
          color: #06c;
        }
      }
      ```

    * https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries

  * Decision to make: do we style the website as "mobile-first" or "desktop-first"?

    * Mobile first starts w/ smallest screen and works up to biggest desktop, & vice-versa
    * Each size is known as a **breakpoint**

  * We can emulate different devices using Chrome's Inspector.

  * How do we tell mobile devices how to properly apply their version of the CSS styles?

    * ```css
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      ```

    * Search for "meta viewport" on MDN for more information on what `<meta name="viewport" />` does and how to use it.

  * What's the difference between a **fluid layout** and a **liquid layout**?

    * **Liquid** layouts employ percentage values for widths to maintain the same width ratios for content areas as the browser widths change.
    * **Fluid** layouts expand and collapse like a liquid layout up to a point, then become fixed once the browser width reaches a specific size.

### Vocab

* **Pseudo-element**
* **Clearfix**
* **Block formatting context**
* **CSS media query**
* **Fluid layout**
* **Liquid layout**