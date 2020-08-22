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