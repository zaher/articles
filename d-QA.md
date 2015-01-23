##Q:##
I'm having trouble with a pretty basic issue, I have two text variables, one is a string and the other is char[], how would i go about combining them into a third string variable with the text from the char[] appended on the end

##A:##
yazd at freenode.net

```d
string output = one ~ other.idup;
```

~ is the array concatenation operator
you can use it concatenate arrays of any type

  int[], float[], ...

Q: Why .idup?

other is char[] , but the output should be immutable, because it is an array of immutable char

  string => immutable(char)[]

Not in this case, the chars are copied on concatenation
but let's say you have an array of reference types
let me write some example code
