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

// Make a more general, abstract pattern

func computeIntArray (xs:[Int], f: Int -> Int) -> [Int]
{
    var result:[Int] = []

    for x in xs
    {
        result.append (f(x))
    }

    return result
}

// Now use the general solution

func doubleArray2 (xs:[Int]) -> [Int]
{
    return computeIntArray (xs) {x in x * 2}
}

// You can even use it to calculate booleans
// But, there is a type error here

func isEvenArray (xs:[Int]) -> [Bool]
{
    computeIntArray (xs) {x in x % 2 == 0}
}

