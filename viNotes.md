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

## Switching Between Multiple Files in Command Mode

* **:n filename** - open a new file
* **:e filename** - open an existing file if it exist, otherwise open a new file
* **:n** - switch to the next file (if there are unsaved changes in current file you must save before switching)
* **:N** or **:prev** - switch to the previous file (also must save changes first)
* **:e #** - switch to the prior file (note the **#** is a literal and NOT a placeholder for a number).  The **#** symbol is referred to as the **alternate file**.  You use the percent symbol **%** to refer to the current file.

Note: if you want to abandon changes, instead of saving, when switching between files you can enter **:e!** in command mode to revert to the saved version of the file, and then switch to the other file without vi complaining.

### Considerations when using multiple files

If you open multiple files from the command line, you can switch back and forth between them with **:n** and **:N**.  However, if you have one file open, and open another file within vi with **:e filename** you can no longer swich between them using **:n** an **:N** (it will say the new file is the only file).  You can switch back to the other file by entering **:e #** (not a place holder, enter the literal #).  It has a different behavior when you start with multiple files and then open a new file with **:e filename**, you can now switch back with **:n** to the other files, but you no longer have access to the file you opened with **e:**

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

## Undoing/Redoing Changes

 * **u** - in **command mode** undo last change.  You can type **u** multiple times for multiple levels of undo
 * **Ctrl-R** - redo the prior undo
 
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

## Goto Line Number

* From the command line:

  To go to line 33 when the file is opened:

  ```bash
  vi +33 myfile.c
  ```

* In **command mode** - type the line number and then press **shift-g**
* In **Ex mode** - type **:33** to goto line 33

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

## Highlighting Search and Word Under Cursor 

### Search Highlight

Place in .vimrc or enter the following in ex mode:

```
:set hlsearch
```

### Word Under Cursor Highlighting

Place the cursor on the word you want highlighted and type **\*** (asterisk) in command mode.  This will highlight every occurance of the word in the file.

### Unhighlight

To unhighlight the matched searches enter **:hup** in **ex mode**.  Hightlighting will be removed until the next search.

Unhighlight until the next search (**ex mode** in vim:

```
:hup
```

To turn it off:

```
set nohlsearch
```

To toggle on and off:

```
set hlsearch!

# or assign a key in .vimrc

nnoremap <F4> :set hlsearch!<CR>
```

## Code Completion

Type **Ctrl-N** on the word to do code completion, for those languages that are supported.

## Follow Files

In command mode highlight a header file or another file and type **gf** and it will go to that file if it is on the path (include files should be)

Highlight C word that is defined in a header file and type **\[i** to display the header definition in bottom status area, or type **\[\<tab\>** to jump to the definition in the header file.

## Column Mode

To place vim in column mode press **Ctrl-V**, which is similar to **visual mode** in that it starts to hightlight text as you move the mouse, with the difference being it does so in column mode.  Once you copy or delete/cut the text it will then also paste in a column oriented manner when using **p** in command mode.  You may have to go into **insert mode** to get things possitioned first.

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

## Turn off annoying bell in vi

By default the bell sounds whenever you move to the top, bottom, left side of file, which gets really annoying.  To turn it off edit the .vimrc file in the home directory adding the following:

```
" Turn annoying bell off
set visualbell
```
Note how this config file uses a double quote for a comment


