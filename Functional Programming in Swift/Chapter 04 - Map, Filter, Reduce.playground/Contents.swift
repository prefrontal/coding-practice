// Functional Programming in Swift - Chapter 4

/* Map, Filter, Reduce */

// Typical example: increment every integer in an array by one

func incremenrArray (xs:[Int]) -> [Int]
{
    var result:[Int] = []

    for x in xs
    {
        result.append (x+1)
    }

    return result
}

// Second example: Double every element in an array

func doubleArray1 (xs:[Int]) -> [Int]
{
    var result:[Int] = []

    for x in xs
    {
        result.append (x*2)
    }

    return result
}