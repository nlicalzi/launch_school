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

### Vocab

* **Box model**

* **Visual formatting model**
  * Most CSS uses the values `block`, `inline`, and `inline-block`
* **`block` elements**
  * Often called **containers**, because most `block` elements group one or more elements into areas of the page (with `body` as the top-level container); ex: `header` elements group elements together into a page header.
  * By default, a `block` element occupies all horizontal space available within its container, with nothing to its right or left. A page that contains 3 `block`s within its `body` would see them stacked vertically.
  * `block` elements use the box properties (`width`, `height`, `padding`, `border`, `margin`) to determine the size of the element.
  * Though a `block` element takes up an entire row in a container, this *does not* alterthe width of the element. The browser renders the `block` element on a line by itself, but the element has the specified/computed width.
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
* **`inline-block` elements**
  * `inline-block` elements are a mixture of both previous types: they act like `block` elements, except they do not take up an entire row when the `width` property is less than the available width.
  * `inline-block` is a *legacy* model, equivalent to a new model called `inline flow-root`. However, it's not going away anytime soon, because there are too many websites still using it.