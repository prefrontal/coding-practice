// Swift Programming Chapter 25

/* Equitable and Comparable */

import Cocoa

// New struct value conforms to the Comparable protocol, which inherits from Equitable
struct Point:Comparable
{
    let x:Int
    let y:Int
}

// New function at global scope for comparison
func == (lhs:Point, rhs:Point) -> Bool
{
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
}

func < (lhs:Point, rhs:Point) -> Bool
{
    return (lhs.x < rhs.x) && (lhs.y < rhs.y)
}

let a = Point (x:3, y:4)
let b = Point (x:3, y:4)

let abEqual = (a == b)
let abNotEqual = (a != b)

let c = Point (x:2, y:6)
let d = Point (x:3, y:7)

let cdEdual = (c == d)
let cLessThanD = (c < d)

let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)