## LS202/Lesson 1: Your First Web Pages

### Resources

* Mozilla Developer Network (MDN) is one of the best resources for HTML, CSS, and JS information.
  * https://developer.mozilla.org/en-US/
* World Wide Web Consortium (W3C) is the official source of information for HTML and CSS.
  * https://www.w3.org/standards/
* Web Hypertext Application Technology Working Group (WHATWG) has been collaborating with W3C on future HTML And DOM standards.
  * HTML: https://html.spec.whatwg.org/multipage/
  * DOM: https://dom.spec.whatwg.org/
* **Suggestion**: steer clear of W3Schools-- frequently outdated/incorrect.
  * Preface searches with `mdn` or `w3c` to avoid returning content from them.

### What to Focus On

* **Vocabulary**
  * element and tag
  * self-closing tag
  * document type definition (DOCTYPE, DTD)
  * attribute
  * selector
  * property
  * id, class, and name
* **The Difference Between HTML and CSS**
  * HTML provides the structure and content of a web page.
  * CSS describes the appearance, or presentation, of the page.
  * There is a bit of overlap that may lead to confusion-- CSS can dictate the *apparent* structure, while HTML can inform the browser of *some* presentation elements.
* **HTML and CSS Syntax**
  * For the most part, you shouldn't worry about the specific tags, attributes, selectors, and properties yet. Instead, focus on how to put these items together to create well-formed HTML and CSS. 
* **Structure of a Web Page**
  * All web pages start with some routine code that defines the basic layout of the document. It includes a `DOCTYPE`, an `<html>`, `<head>`, and `<body>` element, and a few other tags in the `<head>` section.
  * Learn what this boilerplate code does, and how to use it in your web pages.
* **Basic HTML Elements**
  * Start by learning to use the `<p>` (paragraph), `<a>` (anchor), and `<h1> - <h6>` elements.
  * Paragraphs are the primary organizational construct for text on web pages, and anchors represent links to other pages, while headings occur on most pages.
  * You should also become familiar with these elements:
    * `<em>` and `<strong`>
    * `<header>` and `<main>`
    * `<article>`, `<section>`, and `<aside>`
    * `<div>` and `<span>`
* **Using CSS with HTML**
  * Become familiar with the three ways to use CSS in an HTML document: *inline*, *internal*, and *external*.
  * We'll start with using the `<style>` tag to provide internal CSS.
* **Basic CSS Selectors**
  * CSS has three primary types of selectors (tag, id, and class) that select elements based on the tag name, `id` attribute, or `class` attribute. Don't get bogged down, rely on the documentation.
* **CSS Properties**
  * Don't bother trying to memorize every CSS property, you'll get it with time.
  * Memorize the following: `color`, `background-color`, `font-family`, and `font-size`.
* **Use Your Browser's Inspector**
  * The best way to examine the structure and styling of web pages is with the inspector software.
* **Study from the Summary**
  * The summary at the end of the lesson will contain the topics and terminology we need to master.

### Summary

### Notes

* All HTML documents have a required structure that includes the following declaration and elements: `<!DOCTYPE html>`, `<html>`, `<head>`, and `<body>`.
  * `<!DOCTYPE html>` informs web browsers which version of HTML is being used and is placed at the beginning of the HTML document. Using the latest version of HTML means you don't have to specify (only older versions)
  * Inside the `<html>` element come the `<head>` and `<body>` elements. 
  * `<head>` identifies the top of the document, including any metadata.
  * `<body>` contains all of the visible content within the webpage.

### Vocab

* **HTML**: HyperText Markup Language
  * .
* **CSS**: Cascading Style Sheets
  * .
* **Element**
  * A designator that defines the structure and content of objects within a page. Identified by the use of `< >` surrounding the element name.
  * Includes: `<h1>`-`<h6>`, `<p>`, `<a>`, `<div>`, `<span>`, `<strong>`, `<em>`, and more.
* **Tag**
  * Tags mark the beginning/end of elements. Opening tag: `<a>`  Closing tag: `</a>`
* **Attribute**
  * A property or properties used to provide additional information about an element. Defined within the opening tag, after an element's name. Ex.: `<a href="nlicalzi.com">Nicholas LiCalzi</a>`
  * The most common attributes include `id`, which identifies an element; `class`, which classifies an element; `src`, which specifies a source for emeddable content; and `href`, which provides a hyperlink reference to a linked resource.
* **Self Closing Tag**
  * A special form of start tag with a slash immediately before the closing right angle bracket. These indicate that the element is to be closed immediately, and has no content. 

* **Document Type Definition (DOCTYPE, DTD)**

* **Selector**

  * A CSS selector designates exactly which element or elements within our HTML we're intending to target with a given style.
  * Selectors may include a combination of different qualifiers to select groups of elements or unique elements. They generally target either an attribute value like `id` or `class`, or the type of element like `<h1>` or `<p>`.
    * Kinds of selectors: type `div {}`, class `.awesome {}`, id  `#nick {}`
  * Within CSS, selectors are followed with curly brackets `{}`. To target `p` elements: `p {...}`

* **Property**

  * Once an element is selected, a property determines the styles that will be applied to that element.

  * Property names fall after a selector, within the curly brackets `{}`, and immediately preceding a colon `:`, while what comes after the colon is a **value**.

  * ```css
    /* properties: color and font-size */
    p {
      color: ...;
      font-size: ...;
    }
    ```

* **ID, Class, and Name**

  * .

* **CSS Reset**

  * A stylesheet that attempts to standardize HTML elements across web browsers, removing sizing/margins/padding/additional styles. Imported at the top of the stylesheets list, so that changes are upstream of subsequent stylesheets.
  * Ex. https://meyerweb.com/eric/tools/css/reset/