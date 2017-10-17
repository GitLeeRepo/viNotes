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

# Turn of annoying bell in vi

By default the bell sounds whenever you move to the top, bottom, left side of file, which gets really annoying.  To turn it off edit the .vimrc file in the home directory adding the following:

```
" Turn annoying bell off
set visualbell
```
Note how this config file uses a double quote for a comment

# vi Modes

* **Command Mode** - for entering commands.  Press **Esc** to enter Command Mode
* **Insert Mode** - for entering text.  Type **i** to enter Insert Mode

# Commands

## Saving Files

* **:w** - write file
* **w filename** - save with the specified filename

## Navigation

Note: while you can navigate with the arrow keys, for efficiency you can use standard letter keys as well in **command mode**, so you don't have to lift your hands from the home keys.

* **j** - move down a line
* **k** - move up a line
* **l** - move right a character
* **h** - move left a character

## Copy/Paste

### Visual Mode

* Position your cursor where you want to start copying text
* **v** - in **command mode** to go into **Visual Mode**
* Use the navigation keys to select the text that is hightlighted
* **y** - to copy the selected text (yank)
* **p** - paste the text at the cursor position

## Undoing Changes

 * **u** - in **command mode** undo last change.  You can type **u** multiple times for multiple levels of undo
