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

  * 

* **Flex and Grid**

* **CSS Frameworks**

* **Responsive Design**

### Vocab

* **Pseudo-element**
* **Clearfix**
* **Block formatting context**
* 

