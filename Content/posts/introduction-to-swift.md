---
title: Introduction to Swift! 🚀 (for complete beginners)
date: 2020-02-26
description: Basic introduction to programming in Swift. Great for new users who want to understand the basics and get started. 😀
tags: ios, swift
---

## So you want to get started with swift but don't know where to start? 🤔
This will be the perfect introduction to Swift. Firstly, let's open up a playground so we have a space to practice writing our code. To do this, open Xcode and then click 'create new playground'. Just name your playground and you are off.

The first thing you will spot is the line at the very top. UIKit is simply the framework which holds all of the components to build the apps you love. UIKit holds all the information on components such as buttons, labels, views and even controllers.
## Let's get into the code! 🛠
Quickly before we start. I will not be covering printing out values. In Swift it's as easy as doing.

One extra tip: You can use \() in swift to add variables inside of speech marks.

```swift
var a = "Hello World!🚀"
print(a)
// Hello World!🚀
var a = 10
print("This is the number \(a)")
// This is the number 10
```
### Variables 🌦
You might notice the var keyword instantly. Swift uses both variables and constants. Unlike languages like Java for example, swift can recognise types of variables so they do not always need to be pre-defined. You can instead use 'var' for variables that can change and 'let' for constants that will not change. Let's see an example of this!

```swift
var canChange = 3
let notChanging = 4
// we could now do 
canChange = 5
// this would change the variable. Whereas, if we did
notChanging = 5
// we would get an error
```
One thing to note, you can pre-define variables in Swift, if you want to do so, use this general syntax.
```swift
var a: Int = 3
// or
var b: String = "Hello"
```
Now that I've introduced variables the best way to go next is to talk about data types in Swift.
### Data Types ✍️
Data types are always important in any programming language. With this blog, I'm assuming you have no prior programming knowledge so I will explain exactly what each type is with examples.
### Integers
Integers in Swift are the exact same as integers in real life. If we want to store an integer we simply use the same process as specified above. We use either var or let and then assign an integer to that variable. Integers need to be wholes numbers. Luckily, if you need to represent as a decimal you could also use floats which we will cover later.

```swift
let age = 21
// assigning the integer 21 to the variable age
```

Important note: If you would like to represent binary numbers, hex numbers or even octal numbers. You can do this! I will link to the Swift documentation which has more information on this. https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html
### Strings
Strings are used to store words/character. In Swift we will use them to store text we can then use throughout our apps. Strings in swift are fairly simple. Remember, Swift can detect what data type a variable is so you do not need to define it if you don't want to.

```swift
let name = "Andrew"
// my name is now Andrew
```
### Floats
Floating Point numbers are used when you want to store numbers that have decimal places. We use them to show off these numbers and they are often used for mathematics inside languages.

```swift
let pi = 3.14
// pi is now a float, not an integer
```
### Booleans
Booleans are used in Swift to store either True or False values. Booleans are useful when you want to check conditions. The main thing to remember with Booleans is that they are always either True or False, nothing else. 

```swift
let thisArticleIsAwesome = true
// as you can see this is now true
```
### Optionals
Optionals are one of the key features of Swift which most people will not have seen before! An optional is when a value could or could not have a value. Optionals are really useful when defining variables that may be null. I won't go into any more detail than this. I'll show you what defining an optional will look like. With optionals, you have to define the type of the variable before hand.

```swift
var a: Int?
// a is now an optional integer
a = 5
// a = Optional(5) <- this 5 needs to be unwrapped.
```
Just remember that if you define an optional and then assign a value to it, you will need to unwrap it. Let's see what unwrapping is!
#### Unwrapping Optionals
We have three different methods for unwrapping optionals that we could use. Force-Unwrapping, Optional-Chaining or Nil Coalescing. There are other ways of unwrapping but these are the main ones. Let's see what they are all about.
#### Force Unwrapping
Force unwrapping is when you append a ! onto the end of an optional to unwrap it to obtain its true value. The one thing to be aware of with force unwrapping is that it's very risky. It's only really a good idea to unwrap it using this method if you know the variable should have a value. If it doesn't and you force unwrap your program will crash. Let's look at an example!

```swift
var a:Int?
a = 10
print(a)
// prints Optional(10)
print(a!)
// prints 10
```
#### Optional Chaining
Optional chaining is using the ? operator to carry the optional value to retrieve some other value. This may not make complete sense so let's take a look at an example!

```swift
class Programmer {
    var favouriteWebsite: DevTo?
}

class DevTo {
    var favouriteArticle = "this current article"
}

let Andy = Programmer()
Andy.favouriteWebsite = DevTo()

let example = Andy.favouriteWebsite?.favouriteArticle 
print(example!)
// prints this current article
```

A few things to understand with this. We are chaining the optional of favouriteWebsite to then access the favourite Article. As you can see, we have assigned Andy.favouriteWebsite to DevTo. If you don't do this, the optional would still be nil, imagine the code without that line. Favourite website wouldn't be linked to anything at all. If you now look at the example line you can see us use the ?. This simply means we're chaining the optional. You can then see me use ! in the print statement to unwrap the optional. Even though favouriteArticle isn't an optional, as we've chained the value will be an optional.
#### Nil Coalescing
Nil Coalescing is using the double ?? operator to give a default value to a variable when you attempt to unwrap it. If the variable turns out to be nil, the default value specified is used instead. Let's look at an example!

```swift
var a:Int?
a = 10
print(a ?? 5)
// prints 10 as a is not nil
var b:Int?
print(b ?? 6)
// prints 6 as b is currently nil
```
### Collection Types 📦

### Arrays
Arrays are simply storage areas where you can store items/values to then use throughout your code. Arrays can be of many types and you can even create types to store in them. Let's take a look at an example.

```swift
var integerStorage = [Int]()
integerStorage.append(5)
integerStorage.append(10)

// or

let integerStorage = [5, 10]

// you could specify type 'var integerStorage: [Int]'

let chosenInt = integerStorage[0]
```

Note: Array values can be indexed as shown above, array indexes start at 0 and not 1. So your index values are always '0 .. count-1'.
### Dictionaries
Dictionaries are used when you want a key:value pair. This means you can store one value that links to another value. Let's take a look!

```swift
let ages: [String:Int] = ["Andy":21, "Sophia":20]
let myAge = ages["Andy"]
print(myAge!)
// prints out 21
```

Note: Values taken from dictionaries are always optional. You will need to unwrap them.
### Sets
Sets are useful when dealing with types that you would like to query and or use mathematical set theory. Let's look at some basic examples and then look at the theory we could use.

```swift
var ourSet = Set<Int>()
ourSet.insert(10)
print("Does our set contain 10? \(ourSet.contains(10))")
// prints does our set contain 10? true
print("Set count: \(ourSet.count)")
// prints set count: 1
```
Examples of set theory: Union, Intersection, Subtracting.
- Union allows you to join two sets together
- Intersection allows you to find common elements
- Subtraction allows you to subtract one set from another
### Tuples
Tuples are useful when you need to store values quickly but don't need something like an array or dictionary. As you can see, they look different to the other storage types but they are incredibly useful.

```swift
let thisCourse = (type: "Swift Tutorial", rating: 10)
print("This course is a \(thisCourse.type) and it has a rating of \(thisCourse.rating)")
// This course is a Swift Tutorial and it has a rating of 10
```
### Operators ➕
Now that you know how to define and store your values, we should talk about what you can do with them!
### Addition/Subtraction
I won't say much about addition and subtraction. In Swift it's fairly simple. Let's jump straight into the examples.

```swift
let a = 3
let b = 4
print(a+b)
// prints 7
print(b-a)
// prints 1
```
### Multiplication/Division
Same as above. Multiplication and Division is fairly simply inside Swift. Let's look at the examples.

```swift
let a = 2
let b = 5
print(a*b) 
// prints 10
print(b/a)
// prints 2.5
```
### W?T:F (Ternary)
This operator get's the name W?T:F this stands for what, true, false. This is a good way to remember it! This operator is used when you want to check something and then apply different values for true or false. Let's take a look at an example!

```swift
var bool = true
let example = bool ? "True" : "False"
print(example)
// prints True
```
### Unary
The unary operator is simply used as a NOT operator. You use it show that you wan't the opposite of what it's used in conjunction with. Let's look at an example.

```swift
var a = true
print(!a)
// prints false
```
### Compound Assignment Operator
This is where swift is a tiny bit different to some other languages. In lot's of other programming languages there is a ++ or -- operator. This operator is used to add 1 or remove 1 from a variable. In swift this is not the case. Instead you must use += or -=. Let's look at some examples for this. 

```swift
var a = 10
a += 10
print(a)
// prints 20
a -= 11
print(a)
// prints 9
```

There are plenty of other operators in Swift but they are all similar to other programming languages. For the full list, check out the documentation below. https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html
### Control Flow 🌊
Control flow is something you will be using all the time when writing code in any language. It allows you to query, look through values and do so much more. Let's take a look at it in Swift.
### For loop
For loops are used to loop through certain values. You can loop through arrays, dictionaries, sets or just through ranges. Let's take a look at some examples to see how they work!

In our first example we loop through our names array using 'name' as the iterator. It could be called anything, it's doesn't have to be called names. We just call it names to the code itself is more readable. This loop will now go through each value in this loop and print them out. 

```swift
let names = ["Andy", "Brad", "John"]
for name in names {
    print(name)
}
// prints Andy Brad John
```

In this second example we are using ranges to print out numbers in a specified range. You can clearly see how the code below is printing from 0 to 4. This occurs because we use the 0..<5 operator. This simply says go from 0 to less than 5. You could change this to anything for example ... or ..> etc.

```swift
for i in 0..<5 {
    print(i)
}
// prints 0 1 2 3 4
```
### While loop
While statements are loops that run based on a condition. For example, if you start a loop that says 'while a>5' the loop will keep running until a is <=5. These loops really useful. Let's look at how we could use them!

```swift
var a = 10
while a > 5 {
    print(a)
    a -= 1
}
// prints 10 9 8 7 6
```
Tip: You can use 'break' inside loops to stop them at any time. Let's look at an example.

```swift
var a = 10
while a > 5 {
    print(a)
    if a==10 {
         break
    }
}
// prints 10 and then breaks
```
### If statement
If statements are really important when it comes to checking conditions and making decisions. Let's take a look at some examples.

Syntax: If, else if, else.

```swift
var a = 10
var b = 5

if a==10 {
    print("Yes, a is 10")
}
else {
    print("No, a is not 10")
}

if b==3 {
    print("b is 3")
}
else if b==4 {
    print("b is 4")
}
else {
    print("b is something else")
}

// prints Yes, a is 10 and b is something else
```

If you are interested in learning a more advanced version of control flow that acts like an if statement, take a look at this documentation to learn about guard statements. https://docs.swift.org/swift-book/ReferenceManual/Statements.html
### Switch statement
Switch statements are statements just like the others but they use control expressions and then cases. You can assign a default case and then cases for any possible value you want. This may not make complete sense so let's look at a basic example!

```swift
var a = 10
switch a {
case 10:
    print("Yes a is 10")
default:
    print("No a is not 10")
}
// prints Yes a is 10
```
The example above is a really simple example of Switch statements. You can also use enums for Switch statements and I haven't covered enums in this article. If you want to learn more, check it out here: https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html
### Challenge Yourself! 🤓
I'll include some challenges here to see how much you have learned throughout. I'll post the code below the conclusion so you can check your work!
#### Task 1️⃣
For this task, I would like to to write a simply program that can take an input of a shopping list and print out it's contents. The printed out list should look like this. Tip, use an array to manage the items.

```swift
1. Apples
2. Pears
3. Lemons
4. Oranges
```

extension: Could you print how many items the user has overall?
## Conclusion 🥳
I hope this was a good introduction to the language so you can now play around! If enough people are interested I'll make a video introducing Xcode and how to use it if you've never used it before. I hope everyone enjoyed this post!
## Answers to the tasks 👨‍🏫### Task 1️⃣
Just remember, the loop may print in a different order. This is perfectly fine!

```swift
let shoppingList = ["Apples": 1, "Pears": 2, "Lemons": 3, "Oranges": 4]

for (item,counter) in shoppingList {
    print("\(counter). \(item)")
}

// extension: print(shoppingList.count)
```
