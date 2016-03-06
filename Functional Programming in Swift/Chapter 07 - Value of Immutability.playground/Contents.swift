// Functional Programming in Swift - Chapter 7

/* The Value of Immutability */

import Foundation

// -------------------------------------------------------------------------------------------------------------------

// My...remark is that our intellectual powers are rather geared to master static relations and that
// our powers to visualize processes evolving in time are poorly developed." - Dikstra

var x:Int = 1 // mutable
var y:Int = 2 // immutable

// Mutability can be considered harmful

// -------------------------------------------------------------------------------------------------------------------
// Value types and reference types

// Structs are copied

struct PointStruct
{
    var x:Int
    var y:Int
}

var structPoint = PointStruct (x:1, y:2)
var sameStructPoint = structPoint
sameStructPoint.x = 3

// Classes are referenced

class PointClass
{
    var x:Int
    var y:Int

    init (x:Int, y:Int)
    {
        self.x = x
        self.y = y
    }
}

var classPoint = PointClass (x:1, y:2)
var sameClassPoint = classPoint
sameClassPoint.x = 3

// Consider a function that always return the origin
// The struct is copied when passed in, leaving the original intact

func setStructToOrigin (var point:PointStruct) -> PointStruct
{
    point.x = 0
    point.y = 0
    return point
}

var structOrigin:PointStruct = setStructToOrigin(structPoint)

// The same function with a class
// The class is referenced, changing the original value

func setClassToOrigin (point:PointClass) -> PointClass
{
    point.x = 0
    point.y = 0
    return point
}

var classOrigin = setClassToOrigin (classPoint)

// -------------------------------------------------------------------------------------------------------------------
// Mutability

let immutablePoint = PointStruct (x:0, y:0)

immutablePoint = PointStruct (x:1, y:1) // error, immutable

immutablePoint.x = 3                    // error, immutable

var mutablePoint = PointStruct (x:1, y:1)
mutablePoint.x = 3

// Mutability depends on the original definition in the struct/class as well

struct ImmutablePointStruct
{
    let x:Int
    let y:Int
}

var immutablePoint2 = ImmutablePointStruct (x:1, y:1)
immutablePoint2.x = 3                   // error, immutable

// Assigning a new value is allwed, since it is mutable
immutablePoint2 = ImmutablePointStruct (x:2, y:2)

// -------------------------------------------------------------------------------------------------------------------
// Disussion

// Coupling is one of the most important factors that determines how well software is structured

// Class methods are usually coupled through shared instance variables, which can be bad

// In contrast, it is beneficial to have methods that only depend on their input values
// Called "referentially transparent"

// Completely avoiding mutability may not be best through

func sum (xs:[Int]) -> Int
{
    var result = 0

    for x in xs
    {
        result += x
    }

    return result
}

// The result variable is mutable, but the sum function is still referentially transparent

func qsort (var array:[Int]) -> [Int]
{
    if array.isEmpty {return []}
    let pivot = array.removeAtIndex(0)
    let lesser = array.filter {$0 < pivot}
    let greater = array.filter {$0 > pivot}
    return qsort (lesser) + [pivot] + qsort(greater)
}

// Clever user of mutable variables can imrpvoe performance or reduce memory usage




