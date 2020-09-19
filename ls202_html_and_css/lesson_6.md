## LS202/Lesson 6: Advanced Layout

### Resources
### What to Focus On

In this lesson, we'll take a whirlwind tour of some layout-related features of CSS: floats, positioning, flex, grid, CSS frameworks, and responsive design. None of these topics are easy; in fact, unlike most of our material here at Launch School, **we don't expect you to master them in this lesson**.

For now, focus on knowing how to use the following in simple projects:

* floated elements, including how to clear floats
* positioning with `position: absolute`
* basic media queries
* liquid and fluid layouts

### Summary
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

* **CSS Frameworks**

* **Responsive Design**

### Vocab

* **Pseudo-element**
* **Clearfix**
* **Block formatting context**
* 

