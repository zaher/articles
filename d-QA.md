##Q##
I'm having trouble with a pretty basic issue, I have two text variables, one is a string and the other is char[], how would i go about combining them into a third string variable with the text from the char[] appended on the end

##A##

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

##Q##
What is filter
##A##
- Filter takes a range and removes elements from it based upon a criteria; being what you put inside the '!(...)'.
If it evaluates to true for a given element, then it is not removed.
Oh, and to remove the ambiguity, it doesn't modify the original range; but returns the new range.

- if i have 1.2.3.4.5
  it return 1.3.5
  if i filtered odd number

- auto r = [1, 2, 3, 4, 5]; auto f = r.filter!(e => e.isOdd); assert(r != f); assert(f.equals([1, 3, 5]))

##Q##
Is there any way to do auto parameters for functions?
##A##
- fun(T)(T param)
  (IFTI)
- Without having to specify the type in the template argument list 
- Yes, with IFTI
  IFTI == implicit function template instantiation
- Oh, so without specifying T it would be deduced from param?
- Yes

Can I make a function taking (only) a string[] also callable using multiple string arguments?




void foo(string[] args...) {} foo(["a", "b"]); foo("a", "b", "c"); // both valid