// Swift Programming Chapter 13

/* Closures */

// Discrete bundles of functionality that can be used in your application to accomplish specific tasks

// Example using a function:

var volunteerCounts = [1,3,40,32,2,53,77,13]

func sortAscending (i:Int, j:Int) -> Bool
{
    return i < j
}

let volunteersSorted = volunteerCounts.sort(sortAscending)

// Example using a closure:

let volunteersSorted2 = volunteerCounts.sort({
    (i:Int,j:Int) -> Bool in
    return i < j
})

// Using a closure with type inference:
// Not all closures can have an implicit return like this

let volunteersSorted3 = volunteerCounts.sort({i, j in i < j})

// Using type inference and shorthand syntax for arguments:

let volunteersSorted4 = volunteerCounts.sort({$0 < $1})

// Finally, get rid of parenteses with trailing closure syntax:

let volunteersSorted5 = volunteerCounts.sort {$0 < $1}

// Functions as return types
// Functions are first-class objects in swift

func makeTownGrand() -> (Int, Int) -> Int
{
    func buildRoads (lightsToAdd:Int, toLights:Int) -> Int
    {
        return toLights + lightsToAdd
    }

    return buildRoads
}

var stopLights = 4
let townPlan = makeTownGrand()
stopLights = townPlan (4, stopLights)
print ("Knowhere has \(stopLights) stoplights")

// Functions as arguments

func makeTownGrand2 (budget:Int, condition:Int -> Bool) -> ((Int, Int) -> Int)?
{
    if condition (budget)
    {
        func buildRoads (lightsToAdd:Int, toLights:Int) -> Int
        {
            return toLights + lightsToAdd
        }

        return buildRoads
    }
    else
    {
        return nil
    }
}

func evaluateBudget (budget:Int) -> Bool
{
    return budget > 10000
}

if let townPlan = makeTownGrand2 (20000, condition:evaluateBudget)
{
    stopLights = townPlan (4, stopLights)
}

print ("Knowhere has \(stopLights) stoplights")

// Closures capture values

func makeGrowthTracker (forGrowth growth:Int) -> () -> Int
{
    var totalGrowth = 0

    func growthTracker () -> Int
    {
        totalGrowth += growth
        return totalGrowth
    }

    return growthTracker
}

var currentPopulation = 5422
let growBy500 = makeGrowthTracker(forGrowth: 500)

growBy500()
growBy500()
growBy500()
currentPopulation = growBy500()

// Closures are reference types
// When you assign a function to a variable you are really just setting a pointer to the function
// Any information captures by the function's scope will be changed if called by a new variable

let anotherGrowBy500 = growBy500
anotherGrowBy500()

// You can sidestep this issue by creating another instance

var someOtherPopulation = 4061981
let growBy10000 = makeGrowthTracker(forGrowth: 10000)
someOtherPopulation += growBy10000()
currentPopulation

// Swift does adopt some patterns from functional programming:
//
// * First class functions: functions can be passed as arguments to other functions,
//   can be stored in variables, etc...
// * Pure functions: functions have no side effects, functions always return the same output
//   given the same input, and they do not modify other states elsewhere in the program.
// * Immutability: mutability is de-emphasized as it is more difficult to reason about
//   whose values can change
// * Strong typing: a strong type system increases runtime safety because the guarantees of the 
//   type system are checked at compile time

// Higher-order functions take at least one function as input
// Three useful higher-order functions are map, filter, and reduce

// map(_:)
// You can map an array's contents from one value to another and put these values in a new array.

let precinctPopulations = [1244, 2021, 2157]

let projectedPopulations = precinctPopulations.map
{
    (population:Int) -> Int in
    return population*2
}

projectedPopulations

// filter(_:)
// Purpose is to filter elements based on some criteria

let bigProjections = projectedPopulations.filter
{
    (projection:Int) -> Bool in
    return projection > 4000
}

bigProjections

// reduce(_:)
// Return a single summary value from across the array elements

let totalProjection = projectedPopulations.reduce(0)
{
    (accumulatedProjection:Int, precinctProjection:Int) -> Int in
    return accumulatedProjection + precinctProjection
}

totalProjection

