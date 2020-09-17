## LS202/Lesson 3: Images

### Resources
### What to Focus On

This lesson focuses on images and how Web pages use them. We'll focus on the different image types and talk about the roles they play in HTML documents.

* Image Types
  * Understand the primary differences between jpg, png, and gif images
  * Explain when to use each image type
* HTML and CSS for Images
  * Add foreground and background images to a web page
  * Use figures and captions
  * Use images as links

### Notes

* Image Types

  * JPG
    * Use a **lossy** form of compression: they lose information in exchange for a file size reduction.
    * Each time a JPG is edited, the resulting file has less detail (more **artifacts**) than the original.
  * PNG
    * PNG compression is non-lossy, so the file sizes are bigger.
    * Provide both single-color and alpha transparency, useful for logos, icons, and line drawings.
    * Often the best choice for backgrounds and non-photographic images that need all their detail or transparency.
  * GIF
    * Suitable for small images used as user interface icons in an application.
    * Have limited color range (256 colors), allowing for very small file sizes.

* The `<img>` element

  * `<img>` is a self-closing tag that tells the browser to load and display a foreground image from a separate resource. Four key attributes:

    * The `src` attribute is required, and tells the browser where to find the image. Can feature a root, relative, or absolute path.
    * The `alt` attribute is optional, but should almost always be used, and provides a text description of the image for users or browsers that cannot see it/have images disabled.
    * `width` and `height` are optional, and overridden by the CSS `width` and `height` properties

  * ```html
    <img src="lucrezia.jpg" alt="Da Vinci's Smarter Sister, Lucrezia"
         width="800" height="600" />
    ```

* `figure` and `<figcaption>`

  * Allows us a semantic way of designating a relationship between some media and an optional description.

  * ```html
    <figure>
      <img src="masthead.jpg" alt="Sunset over the forest" />
      <figcaption>The sun sets over the dense forest</figcaption>
    </figure>
    ```

* Images as Links

  * ```html
    <a href="url-of-link">
      <img src="url-of-image" alt="alt-text" />
    </a>
    ```

* Background Images

  * You can add background images to a page or element by applying the CSS `background` or `background-image` property. They can then be modified using various background properties, like `background-size`.

### Vocab
