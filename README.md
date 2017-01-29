# Profiles

Hi there, these are my profile files for vim and bash.

Since I'm using an Ubuntu machine at home, and a Mac at work I basically have to keep two copies of nearly exactly the same profile files. For a long time, I did that by manually copying the relevant lines into the `.bashrc` or `.bash_profile` from a file I stored on dropbox.

Now I found a better solution. This may be not the best solution, but it's a lot better than what I had previously:

In the `master`-Branch, there is my `.vimrc` and the entire `.vim` folder. These are the the same on all machines I use.  
Also, there are some bash files (those without a period at the start of their name), which are all included in the `_master` file.

The master-branch contains files, which are prevalent on all operating systems I use (well, except Windows).

All other branches, currently `ubuntu1604`, `win10-bash` and `macos10` contain os-specific files. These are named `_<branchname>` and include the `_master` file at their end.
These os-specific files are then included at the end of the `.bashrc` or `.bash_profile`, depending on the operating system.

Feel free to copy whatevery you want, since I did the same ;)
