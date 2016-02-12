// Swift Programming Chapter 22

/* Generics */

import Cocoa

// Create a basic integer stack

struct IntStack
{
    var items = [Int]()
    
    mutating func push (newItem:Int)
    {
        items.append (newItem)
    }
    
    mutating func pop () -> Int?
    {
        guard !items.isEmpty else {return nil}
        
        return items.removeLast()
    }
}

var intStack = IntStack()
intStack.push (1)
intStack.push (2)

print (intStack.pop())
print (intStack.pop())
print (intStack.pop())

// Create a similar stack, but for generics

struct Stack<Element>
{
    var items = [Element]()
    
    mutating func push (newItem:Element)
    {
        items.append (newItem)
    }
    
    mutating func pop () -> Element?
    {
        guard !items.isEmpty else {return nil}
        
        return items.removeLast()
    }
}

var newIntStack = Stack<Int>()

newIntStack.push (1)
newIntStack.push (2)

print (newIntStack.pop())
print (newIntStack.pop())