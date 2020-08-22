## Vocab covered in "The Linux Command Line" by William Shotts

* Shell
* Terminal emulator
* Shell prompt
* Command history
* Hierarchical directory structure
  * A tree-like pattern of directories branching out from a root directory.
* Directory
  * Can be thought of as a 'folder', which may contain files or other directories.
* Root Directory
  * The first directory in a hierarchical directory structure.
* Home Directory
* Current Working Directory
* Absolute Pathname
  * A pathname that begins with the root directory and follows the tree branch by branch until the path to the desired directory or file is completed.
* Relative Pathname
  * A pathname that starts from the current working directory that uses the special notations `.` and `..`  to represent relative positions in the file system tree.
    * `.` refers to the current working directory. (Note: we can almost always omit `./`, because generally if a pathname to something is not specified, the working directory will be assumed. )
    * `..` refers to the parent directory of the current working directory.
* Pagers (class of program)
  * Programs that allow the easy viewing of long text documents in a page by page manner.
* Linux Filesystem Hierarchy Standard
* Linux Directories:
  * `/`: The root directory
  * `/bin`: Contains binaries (programs) that must be present for the system to boot and run
  * `/boot`: Contains the Linux kernel, initial RAM disk image (for drivers needed at boot time), and the boot loader
  * `/dev`: contains device nodes
  * `/etc`: contains all of the system-wide configuration files, as well as a collection of shell scripes that start each of the system services at boot time
    * includes `/etc/crontab`, `/etc/fstab`, `/etc/passwd`
  * `/home`: in normal configurations, each user is given a directory in `/home`. Ordinary users can only write files in their home directories. This limitation protects the system from errant user activity.
  * `/lib`: contains shared library files used by the core system programs.
  * `/media`: contains the mount points for removable media such as USB drives, etc. that are mounted automatically at insertion
  * `/opt`: used to install "optional" software: commercial software products that might be installed on the system
  * `/proc`: a virtual file system maintained by the Linux kernel
  * `/root`: the home directory for the root account
  * `/tmp`: intended for the storage of temporary, transient files created by various programs
  * `/usr`: contains all the programs and support files used by regular users
  * `/usr/bin`: contains the executable programs installed by the Linux distribution
  * `/usr/lib`: the shared libraries for the programs in `/usr/bin`
  * `/usr/local`: where programs that are not included with the distribution but are intended for system-wide use are installed. Programs compiled from source code are normally installed in `/usr/local/bin`
  * `/usr/share`: contains all the shared data used by programs in `/usr/bin`, including things like default config. files, icons, backgrounds, sounds, etc.
  * `/usr/share/doc`: stores documentation files organized by package
  * `/var`: where data that is likely to change is stored; various databases, spool files, user mail, etc. are located here
  * `/var/log`: contains log files, or records of various system activity. The most useful ones are `/var/log/messages` and `/var/log/syslog`
* Symbolic link / soft link / sym-link
  * A special type of file that serves as a reference to another file or directory. Enables the use of multiple names to reference a single file.
* Hard link