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
// Cnnot convert value of type Bool to closure type Int

func isEvenArray (xs:[Int]) -> [Bool]
{
    computeIntArray (xs) {x in x % 2 == 0}
}

// You could define a new version of the function with type Int -> Bool

func computeBoolArray (xs:[Int], f:Int->Bool) -> [Bool]
{
    var result:[Bool] = []

    for x in xs
    {
        result.append (f(x))
    }

    return result
}

// You would have to write a new version for every type you want to support
// Or, you could use generics...

func genericComputeArray<U> (xs:[Int], f:Int->U) -> [U]
{
    var result:[U] = []

    for x in xs
    {
        result.append (f(x))
    }

    return result
}

// You can also abstract the input type, it doesn't have to be Int

func map<T,U> (xs:[T], f:T->U) -> [U]
{
    var result:[U] = []

    for x in xs
    {
        result.append (f(x))
    }

    return result
}

// The original genericComputeArray can be computed using map

func computeIntArray<T> (xs:[Int], f:Int -> T) -> [T]
{
    return map (xs,f)
}



