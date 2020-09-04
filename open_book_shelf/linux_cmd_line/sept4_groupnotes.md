• searching for files
• find files the hard way
• find files the easy way
• locate vs find - simple complicated*
  `updatedb` *cron job*

? dealing with 'funny' file names
/clarify 'complicated'/

##### Note: 8 minutes per presentation-- 5 on program, 3 on demo (16-24 slides)

**Basic structure: Most blunt to most precise**
* locate (file name)
* find (file attributes)
* grep (file contents)

### Assignments

- locate (Owen)
  - Updating database
  - Different versions (mlocate, slocate)
  - Appears you can't do relative searching
    - ie: locate ./file.txt won't search for "file.txt" in you local directory
  

- find + xargs (Nick)

- grep (Marcos)  

find -> locate -> grep

find -name vs locate

find

$ locate bin/zip
  /home/linuxbrew/.linuxbrew/Cellar/perl/5.30.0/bin/zipdetails
  /home/linuxbrew/.linuxbrew/bin/zipdetails
  /mnt/c/Program Files/Git/mingw64/bin/zipcmp.exe
  /mnt/c/Program Files/Git/mingw64/bin/zipmerge.exe
  /mnt/c/Program Files/Git/mingw64/bin/ziptool.exe
  /mnt/c/Program Files/Git/usr/bin/zipgrep
  /mnt/c/Program Files/Git/usr/bin/zipinfo.exe
  /mnt/c/Program Files/Java/jdk-14.0.1/bin/zip.dll
  /mnt/c/Program Files (x86)/CodeBlocks/MinGW/bin/zip.exe
  /usr/bin/zip
  /usr/bin/zipcloak
  /usr/bin/zipdetails
  /usr/bin/zipgrep
  /usr/bin/zipinfo
  /usr/bin/zipnote
  /usr/bin/zipsplit
  

outline the most interesting of our programs

5 minutes walkthrough, then live coding

- scrabble
- cheat at words with friends
- available space in the board

#c'mon ride the train
