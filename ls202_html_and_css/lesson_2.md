## LS202/Lesson 2: The Box Model

### Resources

* <a href="https://chrome.google.com/webstore/detail/pesticide-for-chrome-with/eipbgplchlidkojmppclhkechkhmlefi?hl=en">Pesticide</a>: debuging plugin for Chrome that lets you examine margins, borders, padding, etc.

### What to Focus On

* Always remember to **test and validate** your pages
  1. Update your code
  2. Test the results in your browser
  3. Validate your HTML
  4. Validate your CSS
  5. **Check your page on other browsers**
* **VOCABULARY**
  * The Box Model
    * Box properties: width and height, padding and margins, and borders
    * Visual display models: `block`, `inline`, and `inline-block`
    * Box sizing model: `content-box` and `border-box`
  * Dimensions: absolute units and relative units
* **Box Properties**
  * Every box has a width, height, padding, border, and margins; know the differences.
  * Padding, borders, and margins have separate properties to set the left, right, top, and bottom of each element. You can use shortcut properties to specify all four sides at once.
  * How does the visual display model interact with margins, borders, and padding?
* **Visual Display Models**
  * Understand the differences between `inline`, `block`, and `inline-block`.
  * Containers are almost always `block` elements, while non-containers are `inline`. When in doubt, check MDN.
  * Don't try to memorize which HTML elements are `block` or `inline`.
  * How and when can you change an element's visual display model?
* **Box Sizing Models**
  * Understand the `content-box` and `border-box` sizing models.
  * How and when can you change the box-sizing model for an element?
* **Dimensions**
  * Know the differences between `px`, `em`, `rem`, `%`, and `auto`.
  * Understand why we need to talk about CSS reference pixels and physical pixels. Don't try to memorize the details, but understand the topic well enough that you won't be too surprised the first time you encounter the differences in the wild.
  * Use `auto` margins to center block elements horizontally.
* **CSS**
  * Become comfortable with the CSS `display`, `box-sizing`, `width`, `height`, `padding`, `border`, and `margin` properties. Memorize this list of properties so you can look up the details when needed.

### Summary

### Notes

* What are the broad strokes of the box model (how does the browser calculate the box size for a given element)?

  * Every element requires a box-shaped segment of the page.
  * Every character of text content also needs a boxed portion of the page.
  * The browser calculates the dimensions of that box by using the browser defaults and CSS. 

* What properties does every element box have?

  * **Width** and **height**, defining how much horizontal and vertical space is needed for the *content area* of the box, which may or may not include the padding and borders. In most cases, the browser can determine the width and height automatically.
  * The **padding** is an area that surrounds the content area of the box and separates the content from its border. It is typically opaque and hides anything that it overlays.
  * The **border** is a boundary that surrounds the padding.
  * The **margin** is a transparent area that lies outside the border and supplies separation between elements.
  * The **display** property determines how the browser lays out an element relative to its neighbors.
  * <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_2/chrome_box_model.png" align="left" />

* Explain why the following code snippets produce the image below (HINT: `em` is an `inline` element) :

  * ```html
    <p>
      Deserunt ad eu dolor in nostrud eu. Aliqua ad veniam magna et nostrud. Non ea
      sunt. <em>Magna aliqua nostrud et laboris fugiat.</em> Ea nostrud non laboris.
      Quis sunt dolore esse pariatur velit minim cillum ipsum.
    </p>
    ```

  * ```css
    p {
      background-color: #d4f0f8;
      border: 1px solid #2db7e1;
      box-sizing: border-box;
      font-size: 1.5rem;
      padding: 0.5em;
      width: 780px;
    }
    
    em {
      background-color: rgba(255, 255, 0, .5);
      border: 30px solid rgba(255, 0, 64, .5);
      margin: 40px;
      padding: 30px;
    }
    ```

  * <img src="https://d3jtzah944tvom.cloudfront.net/202/images/lesson_2/the-visual-formatting-model-01.png" align="left" />

* **Box Sizing**

  * The usable `box-sizing` property values are `content-box` and `border-box`. The CSS standard deprecates the `padding-box` setting; **don't use it**.

  * The `content-box` setting is the default setting for the `box-sizing` property for all elements in all modern browsers. In this model, the `width` and `height` properties specify the size of the actual *content* area. You need to add padding and borders to get the size of the visible box.

  * The `border-box` setting causes the browser to interpret the `width` and `height` properties as the *total* width and height of the box exclusing the margins. That is, the width and height include the content area *as well as* the padding and borders.

  * The `border-box` setting is "best" since it simplifies the math a front-end developer must do. For example, if we have a box with a width of 50% and padding of 12px; `border-box` ensures that it's precisely 50% of the container width, not 50% plus 24px.

  * If you want to use border-box pretty much everywhere, you can add the following to your CSS:

    * ```css
      html {
        box-sizing: border-box;
      }
      
      *, *::before, *::after {
        box-sizing: inherit;
      }
      ```

* What is the difference between setting the `box-sizing` property to either `content-box` or `border-box`?

  * With `border-box`, we ignore the padding and border to calculate the actual dimensions.
  * 

* What is the difference between padding and margins? What do they have in common?

  * Both padding and margins surround elements with whitespace.
  * Padding lies inside the border, while margins lie outside it.
  * Padding is part of the visible and clickable bounds of an element, while a margin is spacing between adjacent elements.

* What happens to the margins if two `block` elements are placed one above the other?

  * What is "margin collapse"?

    * Margin collapse occurs only with top/bottom margins, not left/right. Padding does not collapse.

  * Why is the vertical margin between the two `p` elements below `32px`?

    * ```html
      <style>
        p {
          margin-bottom: 15px;
          margin-top: 32px;
        }
      </style>
      
      <p>This is the first sentence.</p>
      <p>This is the second sentence.</p>
      ```

* When should I use padding vs. margins?

  * For an element:
    * Margins: for spacing between elements
    * Padding: to affect the visible or clickable area of an element
  * Inside a container:
    * Padding: for horizontal separation between container edges and content
    * Margins: for vertical distance
  * LS recommended strategy:
    * Use margins everywhere except when you need padding
    * Use padding when:
      * You want to change the height or width of a border
      * You want to adjust how much background is visible around an element
      * You want to alter the amount of clickable area
      * You want to avoid margin collapse
      * You want some horizontal spacing to the left or right of an `inline` element
      * As before, use padding to separate the left and right sides of a container from its content. Use margins for the vertical gap.

### Vocab

* **Box model**

* **Visual formatting model**
  * Most CSS uses the values `block`, `inline`, and `inline-block`
* **`block` elements**
  * Often called **containers**, because most `block` elements group one or more elements into areas of the page (with `body` as the top-level container); ex: `header` elements group elements together into a page header.
  * By default, a `block` element occupies all horizontal space available within its container, with nothing to its right or left. A page that contains 3 `block`s within its `body` would see them stacked vertically.
  * `block` elements use the box properties (`width`, `height`, `padding`, `border`, `margin`) to determine the size of the element.
  * Though a `block` element takes up an entire row in a container, this *does not* alter the width of the element. The browser renders the `block` element on a line by itself, but the element has the specified/computed width.
  * Examples of `block` elements: `section`, `article`, `aside`, `header`, `footer`, `p`, `h1..h6`, `blockquote`, `ul`, `ol`, `dl`, `figure`, `figcaption`, `form`, `fieldset`
  * Any element can be converted to a `block` element by giving it the `display: block` CSS property. 
    * It's common to render links (`a`) and images (`img`) as `block` elements.
* **`inline` elements**
  * Inline elements provide a bit of semantic meaning to content: browsers use this to alter the way they display small sections of text, which, in turn, helps the reader spot specific items with ease.
  * Browsers handle `left` and `right` margins and padding for `inline` elements the same was as for `block` elements, but other box model properties are processed differently. For `inline` elements, browsers:
    * *ignore* `width` and `height`, using values computed from the element content.
    * *ignore* top and bottom margins.
    * *don't ignore* borders, but the results may look odd
  * Examples of `inline` elements: `span`, `b`, `i`, `u`, `strong`, `em`, `a`, `sub`, `sup`, `img`
  * Any element can be converted to an `inline` element with the `display: inline` CSS property.
    * The most common reaso to do so is to override a prior declaration.
  * `block` and `inline-block` elements *cannot* be nested within `inline` elements.
* **`inline-block` elements**
  * `inline-block` elements are a mixture of both previous types
    * They act like `block` elements, except they do not take up an entire row when the `width` property is less than the available width.
    * They sobserve `width` and `height`, like `inline` elements, but have `padding`, `border`, and `margin` properties that work like `block` elements.
  * Any element can be converted to an `inline-block` element with the `display: inline-block` CSS property. Useful for designing horizontal navigation bars, for example.
    * Different browsers might vary between defaulting to `inline` vs `inline-block` for given element types: Chrome/Safari have `input` and `textarea` defaulting to `inline-block`, while Firefox defaults to `inline`. If inconsistency is an issue, set `display: inline-block` explicity.
  * `inline-block` is a *legacy* model, equivalent to a new model called `inline flow-root`. However, it's not going away anytime soon, because there are too many websites still using it.