//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
str = "Hello, Swift"

let number = 42
let fmStation = 91.1
let meaningOfLife = String(number)

// The 'let' keyword indicates a constant
let constStr = str

// Typically, types are inferred from the initial value
// You can also define them explicitly
var nextYear: Int
var bodyTemp: Float
var hasPet: Bool

// Arrays are defined as Array<T>
// Here are two different ways to define an array
var arrayOfInts: Array<Int>
var arrayOfInts2: [Int]

var countingUp = ["One", "Two"]
let secondElement = countingUp[1]

// Dictionaries are defined similar to arrays
var dictionaryOfCapitalsByCountry: Dictionary<String,String>
var disctionaryOfCapitalsByCountry2: [String:String]

let nameByParkingSpace = [13:"Alice",27:"Bob"]
let spaceAssignee: String? = nameByParkingSpace[13]
let spaceAssignee2: String? = nameByParkingSpace[7]

// Sets are similar to arrays, but unordered
var winningLotteryNumbers: Set<Int>

// Initializers
let emptyString = String()
let emptyArrayOfInts = [Int]()
let emptyArrayOfFloats = Set<Float>()

let defaultNumber = Int()
let defaultBool = Bool()
let defaultFloat = Float()

let availableRooms = Set([205, 411, 412])
let floatFromLiteral = Float(3.14)

let easyPi = 3.14
let floatFromDouble = Float(easyPi)
let floatingPi : Float = 3.14

// Properties
emptyString.isEmpty
countingUp.count

// Instance Methods
countingUp.append("three")
let countingDown = countingUp.reverse()

// Optionals
// Optionals may not store a value at all
var anOptionalFloat: Float?
var anOptionalArrayOfStrings: [String]?
var anOptionalArrayOfOptionalStrings: [String?]?

// Optional Unwrapping
var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

// Forcible unwrapping
let avgReading = (reading1! + reading2! + reading3!) / 3

// Optional binding
if let r1 = reading1, let r2 = reading2, let r3 = reading3
{
    let avgReading2 = (r1 + r2 + r3) / 3
}
else
{
    let errorString = "Instrument reported a reading that was nil"
}

// Optional binding with a dictionary
if let a1 = nameByParkingSpace[27]
{
    let spaceAssignee3 = a1
}
else
{
    print("Key 27 was not in the dictionary")
}

// Loops and flow control

// Traditional for loop
for var i = 0; i < countingUp.count; i++
{
    let string = countingUp[i]
    // Use string
}

// Rewritten using a range type
let range = 0..<countingUp.count
for i in range
{
    let string = countingUp[i]
    // Use string
}

// Enumerate over the array itself
for string in countingUp
{
    // Use string
}

// Enumerate with an index
//for (i, string) in enumerate(countingUp)
//{
//    // (0, "one"), (1, "two"), etc...
//}

for (space, name) in nameByParkingSpace
{
    let permit = "Space \(space): \(name)"
}

// Enumerations and the switch statement
enum PieType: Int
{
    case Apple = 0
    case Cherry
    case Pecan
}

let favoritePie = PieType.Apple

var piesToBake: [PieType] = []
piesToBake.append(.Apple)

let name: String

switch favoritePie
{
case .Apple:
    name = "Apple"
case .Cherry:
    name = "Cherry"
case .Pecan:
    name = "Pecan"
}

let pieRawValue = PieType.Apple.rawValue

if let pieType = PieType(rawValue: pieRawValue)
{
    // Got a valie pie type!
}

// Switch statement with range
let osxVersion: Int = 8

switch osxVersion
{
case 0...8:
        print("A big cat")
case 9:
    print("Mavericks")
case 10:
    print("Yosemite")
default:
    print("Greetings, people of the future!")
}




