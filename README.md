
# TODO:
#### Daashboard:
- [ ] Fix daily quote display.  Should not extend past the project/mru listings.

Projects/MRU path names could potentially be extremely long.  Consider truncating the text for the path name to
the last 'x' directories as well as a hard limit on characters.  Perhaps a good starting point would be 50 characters
max including '../' at some erlier directory.

For example:
../Thispath/hasanextremelylongname/sowetruncate.sh

../Thisfilegottruncated/aswell.cpp

..never_should.i.ever.have_afilename_this_long.cpp
