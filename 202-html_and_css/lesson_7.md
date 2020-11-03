## LS202/Lesson 7: Design Files

### Resources

* Most developers choose one of the following popular CSS reset files:

  * https://meyerweb.com/eric/tools/css/reset/

  * http://necolas.github.io/normalize.css/

  * https://cssreset.com/scripts/undohtml-css-tantek-celik/

  * LS's custom version of Tantek Celi's reset:

    * ```css
      /*
      ----------------------------------------
      Tantek Celik's Whitespace Reset
           Author:    Tantek Celik, Shane Riley
          Version:    (CC) 2010 Some Rights Reserved - http://creativecommons.org/licenses/by/2.0
      Description:  Resets default styling of browsers to a common base
      ----------------------------------------
      */
      
      ul, ol { list-style: none; }
      h1, h2, h3, h4, h5, h6, pre, code { font-size: 1em; }
      ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, body, html, p, blockquote,
      fieldset, input, dl, dt, dd, figure, figcaption {
        margin: 0;
        padding: 0;
      }
      a img, :link img, :visited img, fieldset { border: none; }
      address { font-style: normal; }
      header, section, article, nav, footer, hgroup, details, summary, figure, main {
        display: block;
      }
      mark {
        color: inherit;
        background-color: transparent;
      }
      abbr { border: none; }
      summary::-webkit-details-marker { display: none; }
      ```

### What to Focus On

This final lesson discusses the process of converting a design to a finished web page. We also cover CSS resets and watch a video that may help you improve your HTML and CSS by using semantic markup and roles.

* Learn how to use a PSD or PNG design file as the basis for converting a design to an actual web page.
* The "blink comparison" method

### Summary

This lesson covered the basics of converting a design file to a finished web page. We also discussed CSS resets and learned a bit about how to improve your HTML and CSS.

### Notes

* Working with Design Files
  * You should be able to do the following in Photoshop to properly utilize a design file:
    * Use the layers pallette to view the different layers in an image
    * Use the toolbar that provides access to most of Photoshop's tools
    * Extract assets from their layers
    * Use the Move tool to move layers around
    * Use the Marquee tool to extract and measure images and shapes
    * Export images
    * Use the Text tool to determine font characteristics
    * Use the Eyedropper tool to measure colors
  * To use a PNG design file:
    * Open and view PNG files at the intended screen size
    * Measure sizes, padding, and margins
      * Draw out rectangular marquees to measure a component
    * Measure colors with the help of Digital Color Meter (on Macs)
  * Blink Comparison instructions:
    1. Create an HTML file that does nothing more than load the PNG design file
    2. Load the HTML in your browser
    3. Set the width and height of your browser to precisely match the width/height of the PNG file
    4. Create your HTML file and load it in a separate tab
    5. Toggle your browser tabs back and forth between the files
    6. Observe the differences between the design file and your file. Make the corrections in yoursU
    7. Return to step 5 until your files match as well as possible
* Improving your HTML and CSS
  * Using the `role` attribute as a CSS selector
    * Doing this allows us to loosen the coupling between our CSS and HTML-- we don't necessarily have to change the HTML or CSS each time we modify the other, since roles can select any HTML node type.
    * https://stackoverflow.com/questions/10403138/what-is-the-purpose-of-the-role-attribute-in-html/18664038#18664038

### Vocab

