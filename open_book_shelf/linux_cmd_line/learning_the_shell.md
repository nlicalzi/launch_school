## Notes on Chapters 1-10 (Learning the Shell) of "The Linux Command Line" by William Shotts

### Chapter 1 Outline: What is the Shell?

* Terminal Emulators
  * When using a GUI, we need a terminal emulator to interact with the shell.
* Making Your First Keystrokes
  * Command History
  * Cursor Movement
    * A Few Words about Mice and Focus
* Try Some Simple Commands
* Ending a Terminal Session
  * The Console Behind the Curtain
* Summing Up
  * The "command line" really refers to the **shell**-- a program that takes keyboard commands and passes them to the operating system to carry out.
  * Linux distributions use a shell program from the GNU Project called `bash` (the name is an acronym for the "*Bourne Again SHell*", because `bash` replaced `sh`, the original Unix shell program written by Steve Bourne.)
* Further Reading
  * To learn more about Steve Bourne, father of the Bourne Shell, see this Wikipedia article:
    * http://en.wikipedia.org/wiki/Steve_Bourne
  * This Wikipedia article is about Brian Fox, the original author of bash:
    * https://en.wikipedia.org/wiki/Brian_Fox_(computer_programmer)
  * Here is an article about the concept of shells in computing:
    * http://en.wikipedia.org/wiki/Shell_(computing)



### Chapter 2: Navigation

* Understanding the File System Tree
  * Both Windows and Unix-like OSes organize files in a *hierarchical directory structure*.
  * Unlike Windows, which has a separate file system tree for each storage device, Unix-like systems have a single file system tree, regardless of how many drives or storage devices are mounted.
* The Current Working Directory
* Listing the Contents of a Directory
* Changing the Current Working Directory
  * Absolute Pathnames
  * Relative Pathnames
  * Some Helpful Shortcuts
    * Important Facts about Filenames
      * Filenames that begin with a period character are hidden and won't appear with a `ls` command, unless the `-a` flag is used, like so: `ls -a`
      * Filenames and commands in Unix-like systems are case sensitive
      * Unix-like OSes have no concept of "file extensions" like other OSes (NOTE: applications may use extensions to determine the contents/purpose of files, even if Linux does not)
      * Naming conventions: limit file names to alphanumeric characters, period, dash, underscore. NO SPACES!

### Chapter 3: Exploring the System

* Having More Fun with `ls`
  * Options and Arguments
    * Commands are often followed by one or more *options* that modify behavior, with one or more *arguments*, or the items upon which the command acts.
      * `command -options arguments`
    * Two main types of options:
      * A single character following a dash: `-l`
      * *Long option*, a word preceded by two dashes: `--reverse`
  * A Longer Look at Long Format
    * Long format displays the following fields when `ls -l` is called:
    * Example: `-rw-r--r-- 1 root root 3576296 2017-04-03 11:05 Experience ubuntu.ogg`
      * `-rw-r--r--`: Access rights to the file
      * `1`: Number of hard links in the file
      * `root`: Username of the file's owner
      * `root`: Name of the group that owns the file
      * `32059`: Size of the file in bytes
      * `2007-04-03 11:05`: Date and time of file's last modification
      * `oo-cd-cover.odf`: Name of the file.
* Determining a File's Type with `file`
  * One of the common ideas in Unix-like operating systems such as Linux is that "everything is a file".
* Viewing File Contents with `less`
  * What is "Text"?
  * Less Is More
    * The `less` program was designed as an improved replacement of an earlier Unix program called `more` ("`less` is `more`")
    * `less` falls into the class of programs called "pagers", or programs that allow the easy viewing of long text documents in a page by page manner.
    * `less` allows for forward and backwards paging, while `more` only allowed for forward.
* Taking a Guided Tour
* Symbolic Links
* Hard Links
* Summing Up
* Further Reading
  * The full version of the *Linux Filesystem Hierarchy Standard* can be found here: http://www.pathname.com/fhs/
  * An article about the directory structure of Unix and Unix-like systems: http://en.wikipedia.org/wiki/Unix_directory_structure
  * A detailed description of the ASCII text format: http://en.wikipedia.org/wiki/ASCII

### Chapter 4: Manipulating Files and Directories

* Wildcards/Globbing
  * `*`: matches any characters
  * `?`: matches any single character
  * `[characters]`: matches any character in the set
  * `[!characters]`: matches any character not in the set
  * `[[:class:]]`: matches any character that is a member of the specified class
    * `[:alnum:]`: matches alphanumeric
    * `[:alpha:]`: matches alphabetic
    * `[:digit:]`: matches numerals
    * `[:lower:]`: matches lowercase letters
    * `[:upper:]`: matches uppercase letters
* `mkdir` - Create Directories
* `cp` - Copy Files and Directories
  * Useful Options and Examples
* `mv` - Move and Rename Files
  * Useful Options and Examples
* `rm` - Remove Files and Directories
  * Useful Options and Examples
    * Be Careful with `rm`!
* `ln` - Create Links
  * Hard Links
    * The original Unix way of creating links.
    * Cannot reference a file outside its own file system (like disk partitions)
    * May not reference a directory
    * Indistinguishable from a file itself, but can be deleted without affecting the original file/its contents
  * Symbolic Links
    * A more modern way of creating links than hard links
    * When deleted, only the link is deleted, not the file itself.
    * Most file operations are carried out on the link's target, not the link itself, except for `rm` which will affect the link instead of the target.
    * If the linked file is deleted before the symbolic link, the link will continue to exist but will point to nothing and can be said to be *broken*
* Let's Build a Playground
  * Creating Directories
  * Copying Files
  * Moving and Renaming Files
  * Creating Hard Links
  * Creating Symbolic Links
  * Removing Files and Directories
    * Creating Symlinks With The GUI
* Summing Up
* Further Reading
  * A discussion of symbolic links: http://en.wikipedia.org/wiki/Symbolic_link



### Chapter 5, Working with Commands: 



### Chapter 6, Redirection: 

#### Programs covered:

* `cat`: Concatenate files
  * Reads one or more files and copies them to standard output like so: `cat [file...]`
  * Often used to display short text files.
  * Since cat can accept more than one file as an argument, it can also be use to join files together.
    * Note: wildcards auto-expand in sorted order, so `cat movie.mpeg.0 > movie.mpeg` works
* `sort`: Sort lines of text
* `uniq`: Report or omit repeated lines
  * `-d` flag reports duplicate values instead of unique ones
* `grep`: Print lines matching a pattern
  * `-i` makes `grep` searches case <u>in</u>sensitive
  * `-v` tells `grep` to print lines <u>not</u> matching the pattern 
* `wc`: Print newline, word, and byte counts for each file
  * `-l` flag limits output to report only lines
* `head` / `tail`: Output the first/last part of a file
  * `-n` allows you to change the number of lines output (default is 10)
  * Tailing a log w/ `-f`: https://www.linode.com/docs/quick-answers/linux/how-to-use-tail/
* `tee`: Read from stdin and write to stdout <u>and</u> files
  * Capture data at an intermediate stage to an output file, before sending along in the pipeline`ls /usr/bin | tee ls.txt | grep zip`



#### Vocab:

* **STDIN**
* **STDOUT**
* **STDERR**
* **Bit bucket**
* **File descriptor** (0: stdin, 1: stdout, 2: stderr)
* **Pipeline** (pipe operator: `|`)

#### Notes:

* Keeping with the Unix theme of "everything is a file", programs such as `ls` actually send their results to a special file called *standard output (stdout)*, and their status messages to another file called *standard error (stderr)*.
  * By default both standard output and standard error are linked to the screen and not saved into a disk file.
* To redirect standard output to another file instead of the screen, we use the `>` redirection operator (can also use `<`) followed by the name of the file:
  * `ls -l /usr/bin > ls-output.txt`
* Why does the following program return a `No such file or directory` error message instead of sending its error message to `stdout`? `ls -l /bin/usr > ls-output.txt`
  * Well-written Unix programs send their error messages to `stderr`, instead of `stdout`. 
* How do we append output to a file, rather than overwriting it?
  * Using the `>>` operator-- `ls-l /usr/bin >> ls-output.txt`
* How can we write `stderr` to a file?
  * By prepending the `>` redirection operator with a `2`-- `ls -l /bin/usr 2> ls-error.txt`
* How can we write both `stdout` and `stderr` to a file?
  * By prepending the `>` redirection operator with an `&`-- `ls -l /bin/usr &> ls-output.txt`
* How can we dispose of unwanted output? 
  * By writing to `/dev/null` (a so-called 'bit bucket')-- `ls -l /bin/usr 2> /dev/null`
* How can we display, page by page, the output of any command that sends its results to standard output?
  * By using `less` with a pipe, since it accepts stdin: `ls -l /usr/bin | less`
* What is the difference between using `>` and `|`?
  * The redirection operator `>` connects a command with a file, while the pipeline operator connects the output of one command with the input of a second command.
* What do we call each command in a multi-command pipeline, used to perform complex operations on data?
  * Commands used in that manner are referred to as **filters**: they take input, change it somehow, and then output it.
    * What are some commonly used filters? `sort`, `uniq`, `wc`, `grep`...
      * `ls /bin /usr/bin | sort | less` 
        * Returns a combined list of all executable programs in `/bin` & `/usr/bin`
      * `ls /bin /usr/bin | sort | uniq | less`
        * Same as above, but removing any duplicates from the list with `uniq`
      * `ls /bin /usr/bin | sort | uniq -d | less`
        * Same as above, except displaying the list of duplicate values
      * `ls /bin /usr/bin | sort | uniq | wc -l`
        * Report the count of unique lines in the list of all executable programs
      * `ls /bin /usr/bin | sort | uniq | grep zip`
        * Return a sorted, de-duped list of all programs that include `zip` in their name



### Chapter 7, Seeing the World as the Shell Sees It: 

#### Programs covered:

* `echo`- display a line of text

#### Vocab

* **Expansion**
  * Each time we type a command and press the Enter key, `bash` performs several substitutions upon the text before it carries out our command. The process that makes this happen is called *expansion.*
  * The process causing something we entered to be expanded into something else before the shell acts on it.
* **Word-splitting**
  * The ultimate result of most shell commands is to execute some program with a specific set of arguments. *Word-splitting* is part of the process that determines what each of those arguments will be-- after word-splitting and pathname expansion, every resulting word becomes an argument to the program that the shell executes.
* **Quoting**
  * A mechanism the shell uses to selectiely suppress unwanted expansions.
  * Double-quotes suppress every special character besides `$ \ '` 
    * Suppress word-splitting, pathname, tilde, and brace expansion
    * Allows parameter/arithmetic expansion, and command substutition
  * Single-quotes suppress *all* expansions

#### Notes

* What are the different types of expansion?

  * Pathname Expansion (`*` wildcard): `echo *`, `echo D*`, `echo *s`, `echo /usr/*/share`

  * Tilde Expansion: `echo ~`, `echo ~foo`

  * Arithmetic Expansion (integers only): `echo $((2 + 2))`

  * Brace Expansion: create multiple text strings from a pattern containing braces

    * `echo Number_{1..5}` -> `Number_1 Number_2 Number_3 Number_4 Number_5`

    * `echo {Z..A}` -> `Z Y X ... C B A`

    * ```bash
      # Make lists of files or directories to be created
      mkdir Photos
      cd Photos
      mkdir {2007..2009}-{01-12} # creates 2007-01, 2007-02 ... 2009-11, 2009-12
      ```

  * Parameter Expansion (use env. variables): `echo $USER`
  * Command Substitution: use the output of a command as an expression
    * `echo $(ls)`
    * `ls -l $(which cp)`-- get listing of `cp` without knowing pathname



### Seminar Session Notes

* Produce 1 page cheat sheet, in addition to any slides, covering materials for presentation
* Mon-Wed individual work, Wed-Fri meet with group to discuss, Sun 4pm EST seminar session
* Presentation: everyone intro themselves and 1 interesting fact that people may not know
  * 20-25 minutes for presentation
* Linux knowledge: <u>unreasonably</u> useful for a career
* Links:
  * Intro to the Shell: https://3.basecamp.com/3695031/buckets/18163491/documents/2956496295
  * Navigation: https://3.basecamp.com/3695031/buckets/18163491/documents/2956496800
  * Exploring the System: https://3.basecamp.com/3695031/buckets/18163491/documents/2956497121
  * Manipulating Files and Directories: https://3.basecamp.com/3695031/buckets/18163491/documents/2956497387
* What is the difference between a terminal emulator and the shell? Elaborate.
* What does "tailing a log" mean?
  * https://www.linode.com/docs/quick-answers/linux/how-to-use-tail/
  * Think of what the stream looks like when a Sinatra app is running, w/ each HTTP request/response-- that's a log file