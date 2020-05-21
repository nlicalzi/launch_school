## Notes on the Intro to Regex book at LS

Source: https://launchschool.com/books/regex/read/introduction

Useful resources:

* https://rubular.com/
* https://ruby-doc.org/core-2.7.1/Regexp.html



### Notes

* What are Regular Expressions?
  * Patterns that we can use to search for information of interest in a set of strings.
  * At their most basic, regex are strings of characters between two `/` characters, e.g. `/cat`
* What Ruby methods are important for using Regex?
  * `String#match`, 
* Whare are the *meta-characters* in Ruby and JS regex?
  * `$ ^ * + ? . ( ) [ ] { } | \ /`
* What do we have to do in order to match a literal meta-character?
  * *Escape* it with a leading backslash `\`
  * To match a question mark: `/\?/`
  * To match a period `/\./`
* How do we use *concatenation* in regex?
  * `/cat/` is a concatenation of the patterns `c`, `a`, and `t`-- each matches a single character.
* What is *alternation* in regex?
  * A simple way to construct a regex that matches one of several sub-patterns.
* How do we use *alternation* in regex?
  * `/(cat|dog|rabbit)/ ` will match any of `cat`, `dog`, or `rabbit`-- using meta version of `| ( )`
* What are the (near) universal ways to represent line feeds, carriage returns, and tabs?
  * `\n`, `\r`, and `\t`
* How can we make an entire regex ignore case?
  * By appending `i` to the close `/` of a regex: `/ex/i` (`i` here is called a flag or modifier)
* How can we write a regex that matches `blueberry` or `blackberry`, only writing `berry` once?
  * `/(blue|black)berry/` -- using *concatenation* and *alteration*!
* 



### Vocab

* Regular Expressions (regex)
* 

