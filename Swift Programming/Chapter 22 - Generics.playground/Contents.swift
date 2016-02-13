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

// --------------------------------------------------

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

var stringStack = Stack<String>()
stringStack.push ("This is a string")
stringStack.push ("Another string")

print (stringStack.pop())
print (stringStack.pop())

// --------------------------------------------------

// Create your own array map function
// This takes two types, T and U
func myMap<T,U> (items:[T], f:(T) -> (U)) -> [U]
{
    var result = [U]()
    for item in items
    {
        result.append (f(item))
    }
    
    return result
}

let strings = ["one", "two", "three"]
let stringLengths = myMap(strings) {$0.characters.count}
print (stringLengths)

// --------------------------------------------------

// Mapping on a stack

struct mapStack<Element>
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
    
    func map<U> (f:Element -> U) -> mapStack<U>
    {
        var mappedItems = [U]()
        for item in items
        {
            mappedItems.append (f(item))
        }
        
        return mapStack<U>(items:mappedItems)
    }
}

var intStack2 = mapStack<Int>()
intStack2.push (1)
intStack2.push (2)
var doubledStack = intStack2.map ({2 * $0})

print (doubledStack.pop())
print (doubledStack.pop())

// --------------------------------------------------

// Type constraints

func checkIfEqual<T:Equatable> (first:T, _ second:T) -> Bool
{
    return first == second
}

print (checkIfEqual(1,1))
print (checkIfEqual("a string", "a string"))
print (checkIfEqual("a string", "A string"))

func checkIfDescriptionsMatch<T:CustomStringConvertible, U:CustomStringConvertible> (first:T, _ second:U) -> Bool
{
    return first.description == second.description
}

print (checkIfDescriptionsMatch(Int(1), Int(2)))
print (checkIfDescriptionsMatch(1, 1.0))
print (checkIfDescriptionsMatch(Float(1.0), Double(1.0)))

// --------------------------------------------------

// Associated type protocols

struct StackGenerator<T>: GeneratorType
{
    var stack: SeqStack<T>
    
    mutating func next () -> T?
    {
        return stack.pop()
    }
}

struct SeqStack<Element>:SequenceType
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
    
    func map<U> (f:Element -> U) -> mapStack<U>
    {
        var mappedItems = [U]()
        for item in items
        {
            mappedItems.append (f(item))
        }
        
        return mapStack<U>(items:mappedItems)
    }
    
    func generate() -> StackGenerator<Element>
    {
        return StackGenerator (stack:self)
    }
}

var genStack = SeqStack<Int>()
genStack.push (10)
genStack.push (20)
genStack.push (30)

var myStackGenerator = StackGenerator (stack:genStack)

while let value = myStackGenerator.next()
{
    print ("Got \(value)")
}

for value in genStack
{
    print ("for-in loop: got \(value)")
}

// --------------------------------------------------

// Type constraint where clauses

func pushItemsOntoStack<Element, S:SequenceType where S.Generator.Element == Element> (inout stack: SeqStack<Element>, fromSequence sequence:S)
{
    for item in sequence
    {
        stack.push (item)
    
    }
}

pushItemsOntoStack(&genStack, fromSequence: [1,2,3])

for value in genStack
{
    print ("After pushing: got \(value)")
}

var myOtherStack = SeqStack<Int>()
pushItemsOntoStack (&myOtherStack, fromSequence: [1,2,3])
pushItemsOntoStack (&genStack, fromSequence: myOtherStack)

for value in genStack
{
    print ("After pushing items onto stack, got \(value)")
}