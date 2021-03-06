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

// A safer alternative to the ! operator

infix operator ??

func ??<T> (optional:T?, defaultValue:T) -> T
{
    if let x = optional
    {
        return x
    }
    else
    {
        return defaultValue
    }
}

// The above operates on defaultValue every time. We can solve that by using a closure

func ??<T> (optional:T?, defaultValue:() -> T) -> T
{
    if let x = optional
    {
        return x
    }
    else
    {
        return defaultValue()
    }
}

var myOptional:Int = 0;
myOptional ?? {2}

// Using autoclosures can make it even more simple

infix operator ?? {associativity right precedence 110}

func ??<T> (optional:T?, @autoclosure defaultValue:() -> T) -> T
{
    if let x = optional
    {
        return x
    }
    else
    {
        return defaultValue()
    }
}

// -------------------------------------------------------------------------------------------------------------------

// Optionals can be combined using optional chaining

struct Order
{
    let orderNumber:Int
    let person:Person?
}

struct Person
{
    let name:String
    let address:Address?
}

struct Address
{
    let streetName:String
    let city:String
    let state:String?
}

// You could use an explicit unwrap

let myState = order.person!.address!.state!

// You could also use optional binding

if let myPerson = order.person
{
    if let myAddress = myPerson.address
    {
        if let myState = myAddress.state
        {
            // ...
        }
    }
}

// Optional chaining works by testing each step in the unwrap

if let myState = order.person?.address?.state
{
    print ("This order will be shipped to \(myState)")
}
else
{
    print ("Unknown person, address, or state")
}

// You can define a function that operates similarly to the ? operator

func incrementOptional (optional:Int?) -> Int?
{
    if let x = optional
    {
        return x + 1
    }
    else
    {
        return nil
    }
}

// Generalize incrementOptional and the ? operator

func map<T,U> (optional:T?, f:T -> U) -> U?
{
    if let x = optional
    {
        return f(x)
    }
    else
    {
        return nil
    }
}

// Now you can rewrite increment optional 

func incrementOptional2 (optional:Int?) -> Int?
{
    return optional.map {x in x + 1}
}

// To add optionals you could use nested if statements

func addOptionals (optionalX:Int?, optionalY:Int?) -> Int?
{
    if let x = optionalX
    {
        if let y = optionalY
        {
            return x + y
        }
    }

    return nil
}

// Or, you can bind multiple optionals at the same time

func addOptionals2 (optionalX:Int?, optionalY:Int?) -> Int?
{
    if let x = optionalX, y = optionalY
    {
        return x + y
    }

    return nil
}

// Suppose we have a dictionary of countries and their capitals

let capitals = ["France":"Paris", "Spain":"Madrid", "The Netherlands":"Amsterdam", "Belgium":"Brussels"]

// Look up population based on capitals dictionary and cities dictionary

func populationOfCapital (country:String) -> Int?
{
    if let capital = capitals[country], population = cities[capital]
    {
        return population * 1000
    }

    return nil
}

// Now, consider the flatMap function from the standard library

func flatMap<A,B> (optional:A?, f:A -> B?) -> B?
{
    if let x = optional
    {
        return f(x)
    }
    else
    {
        return nil
    }
}

// Now, use flatMap to add optionals and get population

func addOptionals3 (optionalX:Int?, optionalY:Int?) -> Int?
{
    return flatMap(optionalX) {x in flatMap(optionalY) {y in x + y}}
}

func populationOfCapital2 (country:String) -> Int?
{
    return flatMap(capitals[country]) {capital in flatMap(cities[capital]) {population in population * 1000}}
}

