// Swift Programming Chapter 7

/* Strings */

let playground = "Hello, playground"
var mutablePlayground = "Hello, mutable playground"

// Adding content

mutablePlayground += "!"

// Strings are made up of characters from the Character type
// Iterating over Characters:

for c:Character in mutablePlayground.characters
{
    print (c)
}

// Swift String and Character types are built to use Unicode

let oneCoolDude = "\u{1f60E}"

// The \u{} syntax represents a Unicode scalar
// Every string in Swift is composed of Unicode scalars
// Some scalars can be combined:

let aAcute = "\u{0061}\u{0301}"

for scalar in playground.unicodeScalars
{
    print (scalar.value)
}

// Every character in swift is an extended grapheme cluster, representing one character
// Some characters have canonical equivalence:

let aAcutePrecomposed = "\u{00E1}"
let b = (aAcute == aAcutePrecomposed)

// Canonical equivalence means the characters mean the same linguistically
// They also have the same number of characters in the end:

print ("aAcute count: \(aAcute.characters.count), aAcuteProcomposed count: \(aAcutePrecomposed.characters.count)")

// Swift uses the String.Index type to track indices
// You can't use Int because of an unkown number of Unicode scalars
// You get the start position as an index, advance it by four, and then get the value at that position:

let fromStart = playground.startIndex
let toPosition = 4
let end = fromStart.advancedBy(toPosition)
let fifthCharacter = playground[end]


// Ranges can be done using similar logic:

let range = fromStart...end
let firstFive = playground[range]


