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
        return reduce(randomCharacters, ""){$0 + String($1)}
    }
}

// Now yo ucan generate random strings like this:
String.arbitrary()
