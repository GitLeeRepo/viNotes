# Overview

Various notes on vi/vim editor

# Site links

[vi Reference PDF](http://www.ks.uiuc.edu/Training/Tutorials/Reference/virefcard.pdf)

# vi Modes

* **Command Mode** - for entering commands.  Press **Esc** to enter Command Mode
* **Insert Mode** - for entering text.  Type **i** to enter Insert Mode.  Note there an overstrike version called **replace mode**, but for the purposes of distinguishing behaviors of key strokes, it is **insert mode** that will be contrasted with other modes in these notes.
* **ex Mode** - technically not a mode, but a separate line editor.  Type **:** (colon) to activate

# Commands

## Saving Files

* **:w** - while in **ex mode** saves the file
* **:w filename** - while in **ex mode** save with the specified filename
* **:wq** - save and exit while in **ex mode**
* **ZZ** - save and exit while in **command mode**

## Abandon Changes

* **:q!** - quit without savig while in **ex mode**
* **:e!** - abandon changes reverting to the original file while in **command mode**

## Navigation

Note: while you can navigate with the arrow keys, for efficiency you can use standard letter keys as well in **command mode**, so you don't have to lift your hands from the home keys.

* **j** - move down a line
* **k** - move up a line
* **l** - move right a character
* **h** - move left a character
* **H** - move to the top
* **L** - move to the last
* **M** - move to the middle of the screen
* **$** - move to the end of the line
* **0** - (zero) move to the beginning of the line
* **8gg** - move to line 8
* **^f** - page down
* **^b** - page up

## Copy/Paste

### Visual Mode Copying

* Position your cursor where you want to start copying text
* **v** - in **command mode** to go into **Visual Mode**
* Use the navigation keys to select the text that is hightlighted
* **y** - to copy the selected text (yank), once yanked you return to **command mode**

### Command Mode Copy (Yank) and Paste

* **yy** - copy the current line
* **6yy** - copy the next 6 lines
* **p** - paste the yanked or deleted text **after** the current line
* **P** - paste the yanked or deleted text **before** the current line
* **2p** - repeat the paste 2 times after the current line.

### Ex Mode

* **:put** - in **ex Mode** paste the text starting on the next line (saves from having to go in and out **Insert Mode** to open up a new line)

## Moving Text (Cut and Paste)

To move text you first delete it, which places the text in a buffer, and the paste it

**dd** - delete the line or lines with **#dd** that you want to move
**p** - paste the deleted lines after the current line

## Undoing Changes

 * **u** - in **command mode** undo last change.  You can type **u** multiple times for multiple levels of undo
 
## Deleting Text
 
### Command mode
 * **dd** - deletes the current line
 * **6dd** - deletes 6 lines
 * **dw** - delete to the end of the word
 * **d$** - delete to the end of the line
 * **d0** - delete to the end of the line
 * **x** - deletes the character under the cursor
 
### Ex mode

* **:d** - deletes the current line 
* **:d3** - deletes the next 3 lines 

## Changing Text

* **cw** - from the current position remove text to the end of the current word placing you in **insert mode** to type the new text
* **c$** - from the current position remove text to the end of the current line placing you in **insert mode** to type the new text
* **c0** - from the current position remove text to the beginning of the current line placing you in **insert mode** at the beginning of the line
* **cc** - replace the entire current line
* **r** - replace the character under the cursor.  You remain in command mode so you don't need to hit **Esc** afterword

## Inserting Text

* **i** - enter **insert mode**
* **I** - enter **insert mode** at the start of the line
* **a** - enter **insert mode** to append text (one character to the right of where the **i** command would have placed you
* **A** - enter **insert mode** at the end of the line
* **s** - replace the character under the cursor and enter **insert mode** (**x** replaces without entering **insert mode**
* **S** - remove the entire line placing you in **insert mode** at the beginning of the line
* **R** - places you in **replace mode** which is an overstrike version of **insert mode** (note you can toggle back and forth between **insert mode** and **replace mode** with your insert key.

## Joining Lines

* **J** - in **command mode** joins two lines together

## Repeating Commands

* **.** - while in **command mode** repeats the prior command

## Search of text in command mode

* **/pattern** - search forward through the text for the pattern
* **?pattern** - search backward through the text for the pattern
* **/** - repeat the search in the forward direction
* **/** - repeat the search in the backward direction
* **n** - repeat the search in the same direction
* **N** - repeat the search in the opposite direction

## Substitute text in Ex Mode

Uses substitute to do search and replace using regular expressions

* **:%s/oldtext/newtext/g** - search and replace in the entire file.  With the **/g** flags it will replace globally, and it will NOT prompt for confirmation.
* **:%s/oldtext/newtext/gc** - search and replace in the entire file.  With the **/gc** flags it will replace globally, but it will prompt for each one.

# vimrc and vi settings

Examples of both .vimrc settings and settings made in the editor **:** mode

## Changing vim colorscheme

### Set in home dir .vimrc file

* Edit or create `~/.vimrc` file

For koehler colorscheme type:

```
syntax on

colorscheme koehler
```

### To see a list of installed colorschemes

From within vi type:

`:colorscheme` press **space** and then cycle through each one with **tab**.  Simply hit return to set the currently displayed scheme. Note that schemes selected like this within vi will only apply to the current session.  If you want it to be permanent across sessions then add it to the .vimrc file as described above.

## Set Tab to spaces and Tab Length

```
" Tabs
set tabstop=4       " Change tab width. This will impact exiting text
set shiftwidth=4    " Indent width used by reindent (<< and >>)
set softtabstop=4   " Width when pressing TAB (if less than tabstops additional
                    " tabs and spaces will be inserted to equal tabstops
set expandtab       " Expand TABs to spaces
set smarttab        " when using spaces instead of tabs, the backspace will
                    " remove shiftwidth number of spaces, making it appear as
                    " if there is an actual tab when there is not.  Without
                    " the backspace removes a single space
```

## Turn of annoying bell in vi

By default the bell sounds whenever you move to the top, bottom, left side of file, which gets really annoying.  To turn it off edit the .vimrc file in the home directory adding the following:

```
" Turn annoying bell off
set visualbell
```
Note how this config file uses a double quote for a comment

## View in Hex mode

In the editor enter the following to set hex mod

```
:%!xxd
```

and enter the following to return to normal mode

```
:%!xxd -r
```

# Working with Named Buffers

You can have 26 (letters a through z) named buffers to store yanked and deleted text.  To use a named buffer in command mode, proceed the command with a double quote (**\"**) and the designated letter for that buffer.

## Copying to Named Buffers

* **\"ayy** - yank a single line to buffer **a**
* **\"b4yy** - yank four lines to buffer **b**

## Pasting from Named Buffers
* **\"ap** - paste from buffer **a**
* **\"b2p** - paste twice from buffer **b**
