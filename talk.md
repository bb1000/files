# File handling

---

layout: false

## Learning objectives

+ File operations: open, close, read, write

+ Handling of input and output with Python

+ Usage of string, list

---

## Opening files

The built-in `open` function

+ `open` accepts a file name and a mode as arguments
+ file name: a string
+ mode
    * 'r' for reading
    * 'w' for writing
    * 'a' for appending
    * 'r+' for both reading and writing
    * 'b' for binary files
+ `open` returns a file object

Common file attributes

+ `name`: the file name
+ `mode`: the mode in which the file was opened

~~~
>>> f = open('foo.txt', 'r')
>>> f.name
'foo.txt'
>>> f.mode
'r'

~~~

---

Getting help: `>>> help(open)```

~~~
Help on built-in function open in module io:                                     
                                                                                 
open(file, mode='r', buffering=-1, encoding=None, errors=None, newline=None, clos
efd=True, opener=None)                                                           
    Open file and return a stream.  Raise IOError upon failure.                  
                                                                                 
    file is either a text or byte string giving the name (and the path           
    if the file isn't in the current working directory) of the file to           
    be opened or an integer file descriptor of the file to be                    
    wrapped. (If a file descriptor is given, it is closed when the               
    returned I/O object is closed, unless closefd is set to False.)          
~~~

---

## Reading/writing file

Methods of file objects:

+ `read`

  * reads the entire file into a string
  * an optional `size` argument may be given to limit the number of characters read

+ `readline`

  * reads one line from the file at a time

+ `readlines`

  * reads the file into a list of lines

+ The `write` method

  * accepts a string as argument 
  * and writes the string to file
  * returns the number of bytes written

---

## Example: reading

Given a text file `foo.txt`

~~~
foo
bar
baz
~~~

    >>> open('foo.txt').read()
    'foo\nbar\nbaz\n' 

~~~
>>> open('foo.txt').read(6)
'foo\nba' 

~~~

~~~
>>> open('foo.txt').readlines()
['foo\n', 'bar\n', 'baz\n']          

~~~

~~~
>>> f = open('foo.txt')                                                          
>>> f.readline()                                                                 
'foo\n'                                                                          
>>> f.readline()                                                                 
'bar\n'                                                                          
>>> f.readline()                                                                 
'baz\n'                       

~~~

---

File objects are iterables, which means you cat put them in a for loop. Text
files are designed to return one line at at time

~~~
>>> for line in open('foo.txt'):
...     print(line)
foo

bar

baz

~~~

Why do we get an extra space?

---
## Example: writing

By default `open` expects an existing file for reading. To write to a file we
need to give it a second parameter

~~~
>>> f = open('bar.txt', 'w')
>>> f.write('foo\n')
>>> f.write('bar\n')
>>> f.write('baz\n')
>>> f.close()
~~~

This will create a new file or overwrite an existing file

Note that you will not normally see any content in the file system until you have closed the file.

Alternative: you can supply the file object as an argument to print

~~~
f = open('bar.txt', 'w')
print('foo', file=f)
print('bar', file=f)
print('baz', file=f)
f.close()
~~~

---

## Moving around

A file pointer keeps track of where in the file we are

methods:

+ `seek` moves the file pointer to a specific position
+ `tell` returns the current position of the file pointer

~~~
>>> f = open('foo.txt')
>>> f.tell()
0
>>> f.read(6)
'foo\nba'
>>> f.tell()
6
>>> f.seek(0)
0
>>> f.read()
'foo\nbar\nbaz\n'
~~~


---

## Closing files

It is good practice to close a file in the same program unit where opened

~~~
f = open('file.txt')
...
f.close()
~~~

## Best practice: open with `with`

If you forget, a file
will close when you leave the function where was open

Best practice is to use a `with` block (context manager)

~~~
>>> with open('foo.txt') as f:
...    print(f.read())
...    print(f'{f.closed=}')
... print(f'{f.closed)=}')
foo
bar
baz

f.closed=False
f.closed=True
~~~

The file will be closed when you leave the `with` block



---

Additional help:

https://docs.python.org/3/tutorial/inputoutput.html#reading-and-writing-files
