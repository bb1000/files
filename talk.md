<script type="text/javascript"
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
# File handling

BB1000 Programming in Python

KTH

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
+ mode: 'r' for reading; 'w' for writing
+ `open` returns a file object
+ after reading, the opened file should be closed

Getting help
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
>>> help(open)

---

## Reading/writing file

Methods of file objects:

+ The `read` method
  Reads the entire file, unless a `size` argument is provided

+ The `readline` method
  Reads one line from the file

+ The `readlines` method
  Reads all lines from the file into a list

+ The `write` method
  Accepts a string as argument, and writes the string to file

---

## Example: reading

Given a text file `foo.txt`

~~~
foo
bar
baz
~~~

~~~
>>> open('foo.txt').read()
foo
'foo\nbar\nbaz\n' 
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

## Closing files

It is good practice to close a file in the same program unit where opened

~~~
f = open('file.txt')
# work with file
# ...
f.close()
~~~

Howver, Python is very permissive about it so that if you forget, the file
will close when you leave the function where it happened

Alternative way is to use a context manager (a `with` block)

~~~
with open('file.txt') as f:
    # work with file
    # ...
~~~

The file will be closed when you leave the `with` block



---

Additional help:

https://docs.python.org/3/tutorial/inputoutput.html#reading-and-writing-files
