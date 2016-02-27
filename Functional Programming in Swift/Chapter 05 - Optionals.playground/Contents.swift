// Functional Programming in Swift - Chapter 5

/* Optionals */

// -------------------------------------------------------------------------------------------------------------------

let cities = ["Paris":2243, "Madrid":3216, "Amsterdam":881, "Berlin":3397]

// This line does not validate because the Madrid key may or may not be in the dictionary
let madridPopulation:Int = cities["Madrid"]

// Swift optional types includethe possibility of failure
let madridPopulation2:Int? = cities["Madrid"]

// You can check if a value is nil and then have different operations
if madridPopulation2 != nil
{
    // This uses forced unwrapping, since we know it is not nil
    print ("The population of Madrid is \(madridPopulation2! * 1000)")
}
else
{
    print ("Unknown city: Madrid")
}

// You can also use optional binding to avoid using the ! operator
if let madridPopulation3 = cities["Madrid"]
{
    print ("The population of Madrid is \(madridPopulation3 * 1000)")
}
else
{
    print ("Unknown city: Madrid")
}

