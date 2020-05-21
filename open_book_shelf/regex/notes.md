## Notes on the Intro to Regex book at LS

Source: https://launchschool.com/books/regex/read/introduction

Useful resources:

* https://rubular.com/
* https://ruby-doc.org/core-2.7.1/Regexp.html



### Notes

* What are Regular Expressions?
  * Patterns that we can use to search for information of interest in a set of strings.
  * At their most basic, regex are strings of characters between two `/` characters, e.g. `/cat`
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
* What are **character classes**?
  * Patterns that let you specify a set of characters that you want to match.
  * Character class patterns use a list of characters between square brackets, e.g. `/[abc]/`
    * Such a pattern matches a single occurrence of any of the characters btw the brackets
    * You can validate a `y/n` prompt response with `/[nyNY]/`
    * Check for upper and lowercase letters without using the `i` flag to make entire regex class case insensitive: `/[hH]oover/` matches `Hoover` or `hoover` but not `HOOVER`
* What will the following regex match? `/[abc][12]/`
* What is the class-specific subset of metacharacters?
  * `^ \ - [ ]`
* How can we abbreviate a range of characters in a regex class?
  * Specify the starting character, a hyphen `-` and the last character, ex. `/[0-9]/`, `/[a-z]/`
* What regex can we write to match all alphabetic characters, both upper and lowercased?
  * `/[A-Za-z]/` or `/[a-z]/i`
* What is a negated class in regex? How do we achieve it?
  * The negated class matches all characters not identified in the range
    * ex. `/[^0-9]/` returns all non-numeric characters, `/[^aeiou]/` returns all non lowercase vowels
* What Ruby method can we use to return a truthy value if there is a regex match anywhere in a given string?
  * `String#match(regex)`
* What regex will match any letter except `x` or `X`?
  * `/[a-wyzA-WYZ]/` or `/[a-wyz/i`
* What regex will match any character that's not a letter? Any character that's not a number?
  * `/[^a-z]/` and `/[^0-9]/`
* 



### Vocab

* Regular Expressions (regex)
* Character classes

