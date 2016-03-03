// Functional Programming in Swift - Chapter 6

/* QuickCheck */

import Foundation

// -------------------------------------------------------------------------------------------------------------------

// Manual tests are helpful, but we can do better

func plusIsCommutative (x:Int, y:Int) -> Bool
{
    return x + y == y + x // will pass
}

func minusIsCommutative (x:Int, y:Int) -> Bool
{
    return x - y == y - x // will fail
}

// -------------------------------------------------------------------------------------------------------------------

// QuickCheck is a Haskell library for random testing.  It allows you to specify
// properties of your functions and then tests to verify these properties

// Protocol to generatre arbitrary values of type Self
protocol Arbitrary
{
    static func arbitrary() -> Self
}

// To generate random integers
extension Int:Arbitrary
{
    static func arbitrary() -> Int
    {
        return Int(arc4random())
    }
}

// Now you can generate random integers like this:
Int.arbitrary()

// Function to generate random numbers in a range
func random (from from:Int, to:Int) -> Int
{
    return from + (Int(arc4random()) % (to-from))
}

// To generate random characters
extension Character:Arbitrary
{
    static func arbitrary() -> Character
    {
        return Character(UnicodeScalar(random(from:65, to:90)))
    }
    
    func smaller() -> Character? {return nil}
}

// Generic function used to build an array of characters
func tabulate<A> (times:Int, f:Int -> A) -> [A]
{
    return Array (0..<times).map(f)
}

// To generate random strings
extension String:Arbitrary
{
    static func arbitrary() -> String
    {
        let randomLength = random (from:0, to:40)
        let randomCharacters = tabulate (randomLength) {_ in Character.arbitrary()}
        return randomCharacters.reduce(""){$0 + String($1)}
    }
}

// Now you can generate random strings like this:
String.arbitrary()

// Implementing the check function
func check1<A:Arbitrary> (message:String, prop:A -> Bool) -> ()
{
    let numberOfIterations = 10

    for _ in 0..<numberOfIterations
    {
        let value = A.arbitrary()
        if !prop(value)
        {
            print ("\"\(message)\" doesn't hold: \(value)")
            return
        }
    }

    print ("\"\(message)\" passed \(numberOfIterations) tests")
}

func area (size:Int) -> Double
{
    return Double(size * size)
}

check1 ("Area should be at least 0"){size in area(size) >= 0}

check1 ("Every string starts with Hello") {(s:String) in s.hasPrefix("Hello")}

// Protocol that defines a new method on a type to make Int smaller
protocol Smaller
{
    func smaller() -> Self?
}

// Extension to add the smaller function to Int
extension Int:Smaller
{
    func smaller() -> Int?
    {
        return self == 0 ? nil : self / 2
    }
}

// Test it out
100.smaller()

// Extension to add smaller function to String
extension String:Smaller
{
    func smaller() -> String?
    {
        return isEmpty ? nil : dropFirst(self)
    }
}

// Redefine the Arbitrary protocol to extend the Smaller protocol
protocol Arbitrary:Smaller
{
    static func arbitrary() -> Self
}

func iterateWhile<A> (condition condition: A -> Bool, initialValue:A, next: A -> A?) -> A
{
    if let x = next (initialValue) where condition(x)
    {
        return iterateWhile (condition:condition, initialValue:x, next:next)
    }

    return initialValue
}

// Check function with iteration/smaller
// Implementing the check function
func check2<A:Arbitrary> (message:String, prop:A -> Bool) -> ()
{
    let numberOfIterations = 10

    for _ in 0..<numberOfIterations
    {
        let value = A.arbitrary()

        if !prop(value)
        {
            let smallerValue = iterateWhile ({!prop($0)}, value) {$0.smaller()}

            print ("\"\(message)\" doesn't hold: \(smallerValue)")
            return
        }
    }

    print ("\"\(message)\" passed \(numberOfIterations) tests")
}

// -------------------------------------------------------------------------------------------------------------------


