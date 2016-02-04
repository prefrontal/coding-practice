// Swift Programming Chapter 18

/* Value vs Reference Types */

import Cocoa

// Value types
// A string is a value type, which are always copied
// Strings are implemented as structs, and structs are value types
// Swift basic types (Array, Dictionary, Int, String) are all implemented as structs
var str = "Hello, playground"
var playgroundGreeting = str

playgroundGreeting += "! How are you today?"
str

// Reference types
// The following classes is a reference type, which is passed by reference
class GreekGod
{
    var name:String
    init (name:String)
    {
        self.name = name
    }
}

let hecate = GreekGod (name:"Hecate")
let anotherHecate = hecate

anotherHecate.name = "AnotherHecate"
anotherHecate.name
hecate.name

struct Pantheon
{
    var chiefGod:GreekGod
}

let pantheon = Pantheon (chiefGod:hecate)
let zeus = GreekGod(name:"Zeus")

// Value types declared as constants cannot have their properties changed
// pantheon.chiefGod = zeus

// You can change the properties of a constant reference type
zeus.name = "Zeus Jr."
zeus.name

// Be careful putting reference types into value types
// Really, avoid putting reference types inside of value types
pantheon.chiefGod.name
let greekPantheon = pantheon
hecate.name = "Trivia"
greekPantheon.chiefGod.name

// Immutable reference types using let
// Making reference types immutable helps protect them from changes
struct Pantheon2
{
    let chiefGod:GreekGod
    let dateCreated = NSDate()
}

let pantheon2 = Pantheon2 (chiefGod:hecate)
pantheon2.chiefGod.name
pantheon2.dateCreated

// Copying
// All copies in Swift are shallow, deep copying is not available
// Even though the array is a struct, it holds reference types that are copied
let athena = GreekGod (name:"Athena")
let gods = [athena, hecate, zeus]

let godsCopy = gods
gods.last?.name = "Jupiter"
gods
godsCopy

// Reference equality is an identity comparison
athena === hecate




