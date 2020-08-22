## Notes on Part 1 (Learning the Shell) of "The Linux Command Line" by William Shotts

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
  * A Longer Look at Long Format
* Determining a File's Type with `file`
* Viewing File Contents with `less`
  * What is "Text"?
  * Less Is More
* Taking a Guided Tour
* Symbolic Links
* Hard Links
* Summing Up
* Further Reading

### Chapter 4: Manipulating Files and Directories

* Wildcards
  * Character Ranges
  * Wildcards Work in the GUI Too
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
  * Symbolic Links
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