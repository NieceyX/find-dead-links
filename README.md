# find-dead-links

##Dependencies

This assumes that you have `virtualenv` as well as `python3` installed already.

##Installation

Typing `make install` installs `find-dead-links` to `~/bin`.
You can install to a different directory using `make install INSTALL_DIR=<DIR>`, `<DIR>` being the directory to install to.

##Running the Program

`find-dead-links <url>` will find all of the dead links in a given url.
`find-dead-links -<levelsAmt> <url>` will give all the dead links at a given url and go down `<levelAmt>` times to find dead links there.
