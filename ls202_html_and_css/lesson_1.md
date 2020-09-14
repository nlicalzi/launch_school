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

* What's the difference between a `<div>` or `<span>` element and a header or `<p>`?

  * `<div>` and `<span>` act solely as containers for styling purposes, and have no semantic meaning or value. Their value comes from their ability to apply targeted styles to a contained set of content, commonly through the use of `class` or `id` attributes.

* How do we use `<div>` and `<span>` differently from each other?

  * `<div>` is a block-level element that is commonly used to identify large groupings of content.
  * `<span>` is an inline-level element commonly used to identify smaller groupings of text within a block-level element.

* What is the difference between `<strong>` and `<b>`, and when should we rely on each (or, what is the semantic value of each)?

  * `<b>` is meant for *stylistically offset* text, like keywords or typographically emboldened text.
  * `<strong>` is meant for *strong importance*, more content-focused than typographical.

* What is the difference between `<em>` and `<i>`, and when should we rely on each (or, what is the semantic value of each)?

  * `<i>` is used semantically to convey text in an *alternative voice or tone* (use like `""`)
  * `<em>` is used semantically to place a *stressed emphasis* on text (use for italicizing).

* What are some of the most important new structurally based elements in HTML5?

  * `<header>`: Used to identify the top of a page, article, section, or other segment of a page. Think of this as distinct from `<h1>`-`<h6>`, as they have separate semantic meanings.
  * `<nav>`: Used to identify a section of major navigational links on a page.
  * `<articleH>`: Used to identify a section of independent, self-contained content that may be independently distributed or reused.
  * `<section>`: Used to identify a thematic grouping of content, which generally, but not always, includes a heading.
  * `<aside>`: Used to hold content, such as sidebars, inserts, or brief explanations, that is tangentially related to the content surrounding it.
  * `<footer>`: Used to identify the closing or end of a page, article, section, or other segment of a page. Content within this element should be relative information and should not diverge from the document or section it is included within.

* How can we decide between using `<article>`, `<section>`, or `<div>` elements?

  * Use `<div>` if the content is being grouped solely for styling purposes and doesn't provide value to the outline of a document.
  * Use `<article>` if the content adds to the document outline and it can be independently redistributed or syndicated.
  * Use `<section>` if the content adds to the document outline and represents a thematic group of content.

* How can we solve the issue of high specificity weights breaking our cascade?

  * By being as modular as possible, sharing similar styles from element to element. One way of doing tis is to layer on different styles by using multiple classes:

    *  ```html
      <a class="btn btn-danger"></a>
      <a class="btn btn-success"></a>
      <!-- and so on -->
       ```

* 

  

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

  * The `class` attribute identifies a set of page elements that you wish to style consistently.
    * Any number of elements may belong to the same class
    * Any element can belong to one or more classes: `class="executive management full-time"`
    * Prefer semantic classnames: e.g. `teaching-assistant` rather than `yellow-background`
    * Use CSS class selectors (`.classname`) to select elements by class
  * The `id` attribute applies a unique identification string to a single element.
    * Each ID on a page must be unique
    * Each element can have either one ID or none
    * Use semantic ID names, they should provide meaning: e.g. `headline` instead of `big-font`
    * Use CSS ID selectors (`#idname`) to select elements by ID
  * The `name` attribute ties form elements to data on the server, typically unassociated with styling
    * Use `name`  to assign a name to a form data element that the server can use to obtain the value
    * Not all tags accept the `name` attribute; it applies to input controls in forms
    * Always use a `name` attribute on form elements that accept it
    * Use descriptive, not semantic `name` values: e.g. `name="last-name"` not `name="input-field"`

* **CSS Reset**

  * A stylesheet that attempts to standardize HTML elements across web browsers, removing sizing/margins/padding/additional styles. Imported at the top of the stylesheets list, so that changes are upstream of subsequent stylesheets.
  * Ex. https://meyerweb.com/eric/tools/css/reset/

* **(HTML) Semantics**
  * The practice of giving content on the page meaning and structure by using the proper element.
  * Semantic code describes the *value* of content on a page, regardless of the style or appearance of that content.
* **Headings**
  * Block-level elements that exist in six different rankings, from `<h1>` to `<h6>`.
  * Help to break up content and establish hierarchy, acting as key identifiers for users reading a page.
  * Also help search engines to index and determine the content on a page.
* **(CSS) Specificity Weight / Specificity Points**
  * Every selector in CSS has a specificity weight, which along with a selector's placement in the cascade identifies how its styles will be rendered. The higher the specificity weight of a selector, the more superiority the selector is given when a styling conflict occurs.
  * The weights are additive, so if you have something like `.hotdog p.mustard {}`, you have two *class* selectors and one *type* selector, for a specificity point value of `0-2-1`.
    * Type selector (low): `0-0-1`
    * Class selector (mid): `0-1-0`
    * ID selector (high): `1-0-0`