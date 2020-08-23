## Commands included in "The Linux Command Line" by William Shotts

### Commands

* `date`: display the current time and date
* `cal`: display a calendar of the current month
* `df`: see the current amount of free space on our disk drives
* `pwd`: print the name of the current working directory
* `cd`: change directory
* `ls`: list directory contents
  * Options:
    *  `-a` // `--all`: list all files, incl. hidden ones
    * `-A` // `--almost-all`: list all files, minus `.` and `..`
    * `-d` // `--directory`: use in conjunction with `-l` to see details about a directory, rather than its contents
    * `-F` // `--classify`: append an indicator character to the end of each listed name, for example: a `/` if the name is a directory
    * `-h` // `--human-readable`: In long format listings, display file sizes in human readable format rather than in bytes
    * `-l`: Display results in long format
    * `-r` // `--reverse`: Display the results in reverse order, `ls` normally displays results in alpha ascending order
    * `-S`: sort results by file size
    * `-t`: sort by modification time
* `file`: determine file type
* `less`: view the contents of text files, enabling us to scroll forward and backward
  * Commands (press key):
    * `b`: scroll back one page
    * `[space]`: scroll forward one page
    * `[Up arrow]`: scroll up one line
    * `[Down arrow]`: scroll down one line
    * `G`: move to the end of the text file
    * `g`: move to the beginning of the text file
    * `/[characters]`: search for next occurence of *[characters]*
    * `n`: search for next occurence of previous search
    * `h`: display help screen
    * `q`: quit `less` 
* `cp`: copy files and directories
  * Options:
    * `-a` // `--archive`: copy files, directories, and all of their attributes (including ownerships and permissions)
    * `-i` // `--interactive`: before overwriting an existing file, prompt the user for confirmation
    * `-r` // `--recursive`: recursively copy directories and their contents
    * `-u` // `--update`: when copying files from one directory to another, only copy files that either don't exist or are newer than the exisitng corresponding files in the destination directory
    * `-v` // `--verbose`: display informative messages as the copy is performed
* `mv`: move/rename files and directories
  * Options
    * `-i` // `--interactive`: before overwriting an existing file, prompt the user for confirmation
    * `-u` // `--update`: when copying files from one directory to another, only copy files that either don't exist or are newer than the exisitng corresponding files in the destination directory
    * `-v` // `--verbose`: display informative messages as the copy is performed
* `mkdir`: create directories
* `rm`: remove files and directories
  * Options:
    * `-i` // `--interactive`: before overwriting an existing file, prompt the user for confirmation
    * `-r` // `--recursive`: recursively delete directories
    * `-f` // `--force`: ignore nonexistent files and do not prompt. This overrides the `--interactive` option.
    * `-v` // `--verbose`: display informative messages as the copy is performed
* `ln`: create hard and symbolic links
  * `ln [file] [link]` creates a hard link to a file
  * `ln -s [item] [link]` creates a symbolic link to either a file or a directory

