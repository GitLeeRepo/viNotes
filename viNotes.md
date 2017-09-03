# Overview

Various notes on vi/vim editor

# Site links

[vi Reference PDF](http://www.ks.uiuc.edu/Training/Tutorials/Reference/virefcard.pdf)

# Changing vim colorscheme

## Set in home dir .vimrc file

* Edit or create `~/.vimrc` file

For koehler colorscheme type:

```
syntax on

colorscheme koehler
```

## To see a list of installed colorschemes

From within vi type:

`:colorscheme` **space** and then cycle through each one with **tab**.  Simply hit return to set the currently displayed scheme. Note that schemes selected like this within vi will only apply to the current session.  If you want it to be permanent across sessions then add it to the .vimrc file as described above.
