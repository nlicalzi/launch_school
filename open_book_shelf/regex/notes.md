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

* What metacharacter is a character class shortcut capable of representing any character?

  * `/./` the period!

* What character class shortcuts can we use for whitespace and negated whitespace characters?

  * `\s` for whitespace and `\S` for non-whitespace

* What characters count as whitespace in regex (and can be referenced with `\s`)?

  * space (`' '`), tab (`'\t'`), vertical tab (`'\v'`), carriage return (`'\r'`), line feed (`'\n'`), and form feed (`'\f'`). 

* What character class shortcuts can we use for digit and negated digit characters?

  * `\d` for decimal digit characters and `\D` for non-decimal digit characters

* What character class shortcuts can we use for hex digit and negated hex digit characters in Ruby?

  * `\h` for hex digits (0-9, A-F, a-f) and `\H` for non hex digits (Ruby specific)

* What shortcuts can we use for "word characters" and "non-word characters"? What characters count as word characters?

  * `\w` for word characters, and `\W` for non-word characters. 
  * `a-z` `A-Z` `0-9` and `_` are all word characters

* What is a regex **anchor**?

  * Anchors provide a way to limit how a regex matches a particular string by telling the engine where matches can begin and where they can end.
  * They ensure that a regex matches a string at a specific place: the beginning or end of the string, the end of a lne, on a word or non word boundary.

* What metacharacters act as **anchors** that can fix a regex match to the beginning or the end of a line of text in Ruby?

  * `^` is the beginning anchor, while `$` is the end anchor. `/^cat/` for `cat` and `catastrophe`, `/cat$/` for `cat` and `wildcat`

* What **anchors** fix your regex to the beginning or ending of a string (not just a line) in Ruby?

  * `\A` for the beginning, `\z` for the end
  * This is recommended for most cases in Ruby over using the metacharacters

* What **anchors** fix your regex to word and non-word boundaries?

  * `\b` for word boundaries, and `\B` for non-word boundaries.

* What regex could we use to match 3 letter words consisting of "word characters"?

  * `/\b\w\w\w\b/`

* What regex could we use to match any three letter word composed entirely of letters?

  * `/\b[a-z][a-z][a-z]\b/i`
  * `\b` for word boundaries, three letter character classes, and a case insensitive `i` flag

* What **quantifier** can we use to repeat a pattern 0 or more times?

  * `*`-- `/co*t/` will match with `ct`, `cot`, `coot`, `cooot`, etc.

* What **quantifier** can we use to repeat a pattern 1 or more times?

  * `+`-- `/co+t/` will match with `cot`, `coot`, `cooot`, etc., but not `ct`

* What **quantifier** can we use to match against either zero or one occurance of the pattern to its left?

  * `?`-- `/coo?t/` will match `cot` or `coot` but not `ct` or `cooot`. Useful for dates!

* What **quantifier** can we use to define a repeat range?

  * `{}`, with three options.
    * `p{m}` matches `p` with exactly `m` occurances
    * `p{m,}` matches `m` or more occurances of `p`
    * `p{m,n}` matches `m` or more occurances of `p`, but not more than `n`

* What regex can we use to test a string to see if it contains ten consecutive digits?

  * `/\b\d{10}\b/`.	`\b` word boundary, `\d{10}` 10 digit chars, `\b` word boundary

* What regex can we use to match words of 5-8 letters?

  * `/\b[a-z]{5,8}\b/i`. `\b` word boundary, `[a-z]{5,8}` 5-8 letters, `\b` boundary, `i` flag

* What does it mean for a regex quantifier to be **greedy**?

  * They always match the longest possible string they can. 

* How can we match the fewest number of characters possible (**lazy** match, instead of greedy)?

  * request a lazy match by adding a `?` after the main quantifier: `/a[abc]*?c/` 

* What regex can we use to match any word that contains at least three occurrances of the letter `i`?

  * `/\b[a-z]*i[a-z]*i[a-z]*i[a-z]*\b/i`

* What regex can we use to match the last word in each line of text? (any sequence of non whitespace characters)

  * `/\S+$/i`

* What flag/option can we use at the end of a regex in Ruby to allow us to break a regex over several lines, with the ability to comment each line?

  * ```ruby
    /
      ^                  # Start of line
      (\d+,){2}          # 2 numbers at start
      (                  # followed by...
        (\d+,){3,}       #    at least 3 more numbers
      )?                 #    that are optional
      \d+                # followed by one last number
      $                  # end of line
    /x
    ```

* What does `String#match(/regex/)` return?

* What does `String#scan(/regex/)` return?

* What does `=~` do?

  * `=~` is similar to `match`, except it returns the index within the string at which the regex matched or `nil` if there was no match.

* Why do some Rubyists prefer `=~` instead of `String#match`? 

  * `=~` is measurably faster than `match`, so some Rubyists prefer to use it when they can, but others prefer `match` for legibility.

* What regex can we pass to `String#split(/regex/)` in order to handle data where arbitrary whitespace characters separate fields, and there may be more than one whitespace character between each pair of items?

  * ```ruby
    record = "xyzzy  3456  \t  334\t\t\tabc"
    fields = record.split(/\s+/)
    # -> ['xyzzy', '3456', '334', 'abc']
    ```

* What is a regex **capture group**?

  * Capture groups capture the matching characters that correspond to part of a regex. You can reuse these matches later in the same regex. 

  * ```ruby
    /(['"]).+?\1/
    # the above code captures the part of the string that matches the pattern
    # between parentheses: either a single or a double quote. 
    # the \1 is a backreference, used to reference the value in the first 
    # capture group in the regex. If the first group matches a double quote,
    # then \1 matches a double quote, but not a single one.
    ```

* What is a regex **backreference**? How can we use it?

  * A regex backreference is a way to refer to previously used **capture groups**-- you can reference them like so... `\1 \2 \3 \4` etc.

* What `String` methods can we use to perform transformation using regex?

  * `String#sub` (first part of string that matches regex) and `String#gsub` (every match)

* How can we use `String#gsub` to replace every instance of a vowel in a string with a `*`?

  * `str.gsub(/aeiou/, '*')`

* 

  

### Vocab

* Regular Expressions (regex)
* Character classes

