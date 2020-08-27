## Notes on Assigned Group Chapters (17, 19) of "The Linux Command Line" by William Shotts

### Presentation Ideas

* We could make a scavenger hunt by making a directory with a bunch of chaff inside of it and have a list of files that have to be found (p. 230)
* Validating a Phone List with `grep` (p. 267)



### Chapter 17 "Searching for Files" Outline:

* `locate`: Find files by name
  * Performs a rapid database search of pathnames, outputting every name matching a substring
    * the database is created by a program called `updatedb`, run periodically as a *cron job*
  * `locate bin/zip`: search `bin/` for any file that starts with `zip`:
    * `/usr/bin/zipcloak`, `/usr/bin/zipgrep`, etc.
  * `locate zip | grep bin`: search any directory called `bin/` for files that include `zip`
    * `/bin/bunzip2/`, `/usr/bin/prezip`, etc.
* `find`: Search for files in a directory hierarchy
  * While `locate` can find a file based solely on its name, `find` searches recursively through a given directory for files based on a variety of attributes (through *options*, *tests*, and *actions*)
  * **Tests**: (`-size`, `-type`, `-name`, etc. for more try `man find`)
    * Limit to directories with `-type d`: `find ~ -type d | wc -l` (`wc -l` returns count)
    * Limit to files with `-type f`: `find ~ -type d | wc -l`
    * How can we count regular files that match `*.JPG` and are greater than 1MB?
      * `find ~ -type f -name "*.JPG" -size +1M | wc -l`
  * **Options**:
    * `-depth`: direct `find` to process a directory's files before the directory itself
    * `-maxdepth levels`: set max number of levels that `find` will descend into a tree
    * `-mindepth levels`: set min number of levels that `find` will descend into a tree
    * `-mount`: direct `find` not to traverse directories that are mounted on other file systems
    * `-noleaf`: direct `find` not to optimized search based on assumption that file system is Unix-like
  * **Actions**:
    * `-delete`: delete the currently matching file
    * `-ls`: perform the equivalent of `ls -dils` and send to stdout
    * `-print`: output full pathname of matching file to stdout
    * `-quit`: quit once a match has been made
* `xargs`: Build and execute command lines from standard input
* `touch`: Change file times
* `stat`: Display file or file system status



### Chapter 19 "Regular Expressions" Outline:

* `grep`: derived from "global regular expression print"
  * `-i` // `--ignore-case`: self evident :)
  * `-v` // `--invert-match`: invert match-- print every line that does not contain a match
  * `-c` // `--count`: print number of matches (or non-matches if `-v`) instead of the lines themselves
  * `-l` // `--files-with-matches`: print the name of each file that contains a match instead of the line
  * `-L` // `--files-without-match`:  print only the names of files that do not contain matching lines
  * `-n` // `--line-number`: prefix each matching line with the number of the line within the file
  * `-h` // `--no-filename`: for multi-file searches, suppress the output of filenames
* Regex Metacharacters
  * `.` The Any Character
    * Matches any single character
  * `^` // `$` Anchors
    * Cause the match to occur only if the regex is found at the beginning (`^`) or end (`$`) of a line
    * `grep -i '^..j.r$' /usr/share/dict/words`
  * `[]` Bracket Expressions
    * `[bg]zip`: returns true for either `bzip` or `gzip`
    * `[^bg]zip` (**negation**) returns false for both `bzip` and `gzip`, but true for `dzip` 
    * `[A-Za-z0-9]` character ranges
  * `[:characterclasses:]`
    * `[:alnum:]` alphanumeric characters `[A-Za-z0-9]`
    * `[:word:]` same as `alnum`, but including `_`
    * `[:alpha:]` alphabetic characters `[A-Za-z]`
    * `[:digit:]` returns the numerals `[0-9]`
    * `[:lower:]` // `[:upper:]` lower or upper case alpha characters
* Alternation:
  * `echo "AAA" | grep AAA` -> `"AAA"`
  * `echo "BBB" | grep AAA` -> ` `
  * 