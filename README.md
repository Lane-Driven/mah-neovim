
# TODO:
#### Daashboard:
- [ ] Learn how to properly fill out a README.md
- [ ] Fix daily quote display.  Should not extend past the project/mru listings.

Projects/MRU path names could potentially be extremely long.  Consider truncating the text for the path name to
the last 'x' directories as well as a hard limit on characters.  Perhaps a good starting point would be 50 characters
max including '../' at some erlier directory.

For example:
../Thispath/hasanextremelylongname/sowetruncate.sh

../Thisfilegottruncated/aswell.cpp

..never_should.i.ever.have_afilename_this_long.cpp

The dashboard plugin should have the full pathname variable.
Just intercept it before it gets displayed in the buffer. 
Neovim has a builtin function for this. 
vim.fn.strdisplaywidth(full_file_path)

chatGpt offers a solution that sounds promising for speed.
Creating a 64kb table for each utf8 in binary. 
Seems like over engineering to gain a small performance 
bit my curiosity is certainly piqued.