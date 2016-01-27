Vim
===

Open all files in a directory
-----------------------------

Open all files in a directory using::

   :args [path]/*


Open all files in a directory (recursively)
-------------------------------------------

The extension ``**`` makes it recursive::

   :args [path]/**/*.[extension]


Create a new buffer
-------------------

Create a new buffer using::

   :enew


Ack Shortcuts
-------------

Enter Ack with ``<leader>a`` or ``<leader>A``::

   o    to open (same as enter)
   O    to open and close quickfix window
   go   to preview file (open but maintain focus on ack.vim results)
   t    to open in new tab
   T    to open in new tab silently
   h    to open in horizontal split
   H    to open in horizontal split silently
   v    to open in vertical split
   gv   to open in vertical split silently
   q    to close the quickfix window


Get current filename
--------------------

Get current filename using::

   :echo @%


Navigation Shortcuts
--------------------

* ``^E`` - scroll the window down
* ``^Y`` - scroll the window up
* ``^F`` - scroll down one page
* ``^B`` - scroll up one page
* ``H`` - move cursor to the top of the window
* ``M`` - move cursor to the middle of the window
* ``L`` - move cursor to the bottom of the window
* ``gg`` - go to top of file

Resize windows
--------------

For a **split window** ``Ctrl-w +`` and ``Ctrl-w -`` to resize the height of the current window by a single row
For a **vsplit window** ``Ctrl-w >`` and ``Ctrl-w <`` to resize the height of the current window by a single column
These key combinations accept a count prefix so that you can change the window size in larger steps. For example ``10 Ctrl-w +`` increases the window size by 10 lines.
To resize all windows to equal dimentions based on their splits, you can use ``Ctrl-w =``

Spell Checking
--------------

* ``:set spell spelllang=en_us`` - Start spell check
* ``:set nospell`` - Stop spell check
* ``]s`` - next mispelled word
* ``[s`` - previous mispelled word
* ``]S`` - next mispelled word (only bad words, not at rare words or words for another region)
* ``[S`` - previous mispelled word (only bad words, not at rare words or words for another region)
* ``z=`` - list of suggestions
* ``zg`` - add to dictionary
* ``zG`` - add to internal word list (only in buffers where spell is set
* ``zug`` - undo add to dictionary
* ``zuG`` - undo add to internal word list
