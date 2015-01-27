You can take D as easy bridge to learn C++, or you can take D as modern programming language and replaces the ancient Pascal or even C.

MetaClass 
=========

in Delphi/Pascal we call it "Class References"

```Delphi
SuperClass = class
    x: integer;
    constructor Create(value: integer)
    begin
      x := value;
    end;
end;

SubClass1 = class(SuperClass)
end;

SubClass2 = class(SuperClass)
end;

MyMetaClass = class of SuperClass;

//Assigning MetaClass of subclass, 
//compiler only accept classes that derived from SuperClass

var
   MC: MyMetaClass;

//Assigning
   MC = SubClass1;

//Creating object

   MyObj = MC.Create(10);
```

You can use classinfo, but is not a really like metaclass in Pascal but 

it help you porting your projects

```D
class SuperClass{
    int x;
    this(int value){
        x = value;
    }
}

class SubClass1: {
    this(){
    }
}

class SubClass2: {
    this(){
    }
}

Classinfo metaclass = SubClass.classinfo;

//Creating object

myObj = metaclass.create();
```

Disadvantage
------------

You must have a default constructor to create it "this", if no, myObj 

will be null, and object not created

You can not use constructor with parameter like 
```D
    myObj = metaclass.create(10);
```
here you can assign to "mc" any class, not like Pascal that check if it 

derived from class defined


Sets
====
You can use Associative Arrays (AA) of your enum.

```D
enum MyEnum (A, B, C)

bool[MyEnum] mySet;

or you can make alias for it

bool[MyEnum] MySet;

MySet mySet;

mySet = [A: true, B: true];
//or
mySet[b] = true;

//Notice "in" operator in D meant the key is exists, not meant exists and equal to true
if (b in mySet){
}

```

Encapsulation
=============

Private, Protected, Public

```D
class MyClass{
private:
    ...
protected:
    ...
public:
    ...
}
```

Override 
========

Not like Pascal, Every method is virtual until you mark it as final.

Strings
=======

##Index##

String index started from 0
you can use length to get size

```D
int i = s.length;
```

##concat##

```D
s = "Hello ";
s = s ~ "World";
```

##Pos##

```D
import std.string;

p = s.indexOf(".");
```

##Copy##

You can use slicing, because string is array of char

```Delphi
t = Copy(s, 1, 5);
```

In D

```D
//Like this
t = s[0..5];
t = s[0..$]; //to the last of string
```

Notice that if you make range from x to same value it will return slice of empty string

```D
t = s[2..2]; //Return empty string in t
t = s[2..3]; //Return one char index by 2
```

Generics
========

You can use the powerfull templates, this example make it clear to understand

```Delphi
type
  generic TList<T> = class
    procedure Add(Value: T);
  end;
  
...

Type  
  TIntegerList = specialize TList<Integer>;
  TStringList = specialize TList<string>;  
```  

In D language

```D
class List(T){
  void add(T t){
    //adding t
  }
}

class StringList: List!string{
}
```

IFDEF
-----
debug, release, version(windows)

```D
debug{
    ...
}

release{
    ...
}

debug writeln("Hello debug world");

version(windows){
//only for windows platform
}
```

Helper
======
You dont need add help of class, just add global functions with paramter type of your class as first parameter.

class MyClass{
}

void doSomething(MyClass obj, int x){
}

Usage:

MyClass obj = new MyClass;

obj.doSomething(10);

Note: You can not access private or protected members on MyClass.
