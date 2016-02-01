// Swift Programming Chapter 4

/* Integers */

print ("The maximum Int value is \(Int.max)")
print ("The minimum Int value is \(Int.min)")

print ("The maximum Int32 value is \(Int32.max)")
print ("The minimum Int32 value is \(Int32.min)")

// You can use Int8, Int16, Int32, and Int64

print ("The maximum UInt value is \(UInt.max)")
print ("The minimum UInt value is \(UInt.min)")

print ("The maximum UInt32 value is \(UInt32.max)")
print ("The minimum UInt32 value is \(UInt32.min)")

// You can use UInt8, UInt16, UInt32, and UInt64

// Swift style is to use Int for all general usage

let y:Int8 = 120
let z = y &+ 10

// Overflowing an integer typically results in a trap
// Overflow/underflow operators (&+, &-, etc) allow wraparound

let a:Int16 = 200
let b:Int8 = 50
let c = a + Int16(b)

/* Floating Point */

let d1 = 1.1
let d2:Double = 1.1
let f1:Float = 100.3