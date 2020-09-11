## Notes on `find` for Linux Seminar

16-24 slides



![bash tricks for Linux users](https://3.bp.blogspot.com/-8jMh01wnYqA/W2WiTOpKmaI/AAAAAAAAL6A/G17qZ37WC_AAraE5ANyBWw7Z3fAOBZg9ACLcBGAs/s640/bash%2Blinux%2Btips%2Band%2Btricks.jpg)



* `-mtime`: the time that the contents of a file were last modified

```bash
find . -mtime 1 # find all files modified exactly one hour ago (not so useful)
find . -mtime -l # find all files modified less than 1 hour ago
find . -mtime 1 # find all files modified more than 1 hour ago
```

* `-atime`: the time that a file was read or accessed

  ```bash
  find . -amin -1 # find all files read less than 1 minute ago
  ```



* `-ctime`: the time that a file's status was changed

  ```bash
  
  ```



* `-size`

  ```bash
  find / -size +5000000c 2> /dev/null # find all files larger than 5MB, `c` means bytes
  find / -size +5000k 2> /dev/null # find all files larger than 5MB, `k` means kbs
  ```



* `-maxdepth`, `-mindepth`, `-depth`



* `-perm`

  ```bash
  find . -perm 644 # find all executable files by user / read only for others
  find . -perm 555 # find all read-only files in current directory
  ```

  ![find command examples in Linux](https://1.bp.blogspot.com/-4YYentw6dEM/W2WjhM1l1DI/AAAAAAAAL6M/2pJn_KbDXmUPEImvikiCFcnWJ0pLvzVVACLcBGAs/s640/UNIX%2Bfile%2Bpermissions%2Bby%2BJulia%2BEvans.jpg)

* `-iname` 

  ```bash
  find . -iname "error" -print # case insensitive search using -i and -name
  ```



* Redirecting error output

  ```bash
  find /usr /home /tmp -name "*.jar" # Might return "Permission denied"
  find /usr /home /tmp -name "*.jar" 2>/dev/null # send output to null file & silence
  ```

  

* `xargs`

  ```bash
  find . -name "*.tmp" -print | xargs rm -f # rm all temp files
  find . -name "*.txt" -print | xargs grep "Exception" # rm files containing "Exception"
  ```



* Which files in your project are too long and should be split up?

  ```bash
  find . -name '*.rb' | xargs wc -l | sort -hr
   # => 
   # 1467 total
   # 322 callee/base.py
   # 261 callee/general.py
   # 251 callee/collections.py
  ```

  

* How can I remove all MP3 files that live in `/tmp`?

  ```bash
  find tmp -maxdepth 1 -name '*.mp3' -maxdepth 1 | xargs rm
  ```

  

![10 Example of find command in Unix and Linux](https://1.bp.blogspot.com/-5oneqOIU_Uw/W2Wmt9a9MBI/AAAAAAAAL6o/jcEigaE3Ybko-ADZBT_J0p3xURPkjLcmwCEwYBhgL/s640/find%2Bcommand%2Bexample%2Blinux.jpg)

