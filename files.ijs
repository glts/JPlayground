NB. Scripts and files
NB.
NB. http://www.jsoftware.com/help/dictionary/dx000.htm
NB. http://www.jsoftware.com/help/dictionary/dx001.htm
NB. http://www.jsoftware.com/help/user/lib_files.htm

NB. Script execution

NB. Execute a 'script' (y can be a file or a noun)
0!:0 < y   NB. stop on error, silent
0!:1 < y   NB. stop on error, verbose
0!:10 < y  NB. continue on error, silent
0!:11 < y  NB. continue on error, verbose

NB. Example 1: all sessions begin with
0!:0 < 'profile.ijs'

NB. Example 2
0!:0 (0 : 0)
mno=: 3 5 2 9
)

NB. Better to use 'load' and 'loadd' for this
load 'something.ijs'   NB. silent
loadd 'something.ijs'  NB. verbose


NB. File reading

1!:1 < y  NB. Return contents of file y as a string

NB. Example 1
notes=: 1!:1 < 'notes.txt'

NB. TODO Investigate stdlib verbs fread, freads, etc.


NB. File writing

x 1!:2 < y  NB. Write string x to file named y

NB. Example 1
('bamboozle' , LF) 1!:2 < 'notes'

NB. Example 2
(0 : 0) 1!:2 < 'longnotes'
i write bamboozle
on two lines
)

NB. Example 3
stdout 'hello stdout'    NB. these lines are the same
1!:2&4 'hello stdout'    NB.   "
'hello stdout' (1!:2) 4  NB.   "

NB. TODO Investigate stdlib verbs fwrite, fwrites, fappend, etc.
