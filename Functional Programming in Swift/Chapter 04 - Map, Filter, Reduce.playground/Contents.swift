// Functional Programming in Swift - Chapter 4

/* Map, Filter, Reduce */

// -------------------------------------------------------------------------------------------------------------------

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

// -------------------------------------------------------------------------------------------------------------------

let exampleFiles = ["README.md", "HelloWorld.swift", "HelloSwift.swift", "FlappyBird.swift"]

// Generate an array of all the Swift files
func getSwiftFiles (files:[String]) -> [String]
{
    var result:[String] = []

    for file in files
    {
        if file.hasSuffix (".swift")
        {
            result.append(file)
        }
    }

    return result
}

getSwiftFiles (exampleFiles)

// Make a generic filter function
func filter<T> (xs:[T], check: T -> Bool) -> [T]
{
    var result:[T] = []

    for x in xs
    {
        if check(x)
        {
            result.append(x)
        }
    }

    return result
}

// Now use the generic filter function to find Swift files
func getSwiftFiles2 (files:[String]) -> [String]
{
    return filter (files) {file in file.hasSuffix(".swift")}
}

// The Swift array already has a filter function
exampleFiles.filter {file in file.hasSuffix(".swift")}

// -------------------------------------------------------------------------------------------------------------------

// Sum all integers in an array
func sum (xs:[Int]) -> Int
{
    var result:Int = 0
    
    for x in xs
    {
        result += x
    }
    
    return result
}

sum ([1, 2, 3, 4])

// Calculate the product of all integers in an array
func product (xs:[Int]) -> Int
{
    var result:Int = 1
    
    for x in xs
    {
        result += x * result
    }
    
    return result
}

// Concentrate all strings in an array
func concatenate (xs:[String]) -> String
{
    var result:String = ""
    
    for x in xs
    {
        result += x
    }
    
    return result
}

// Concatenate with a header and a newline
func prettyPrintArray (xs:[String]) -> String
{
    var result:String = "Entries in the array xs:\n"
    
    for x in xs
    {
        result += x + "\n"
    }
    
    return result
}

// The above functions can be made generic through reduce
func reduce<A,R> (arr:[A], initialValue:R, combine:(R,A) -> R) -> R
{
    var result = initialValue
    
    for i in arr
    {
        result = combine (result, i)
    }

    return result
}

// Sum using reduce
func sumUsingReduce (xs:[Int]) -> Int
{
    return reduce (xs,0) {result, x in result + x}
}

// You can just use the operator as the last argument
func productUsingReduce (xs:[Int]) -> Int
{
    return reduce (xs, 1, *)
}

func concatenateUsingReduce (xs:[String]) -> String
{
    return reduce (xs, "", +)
}

// Reduce is already defined in the Swift standard library

// Flatten an array of arrays into a single array
func flatten<T> (xss:[[T]]) -> [T]
{
    var result:[T] = []
    
    for xs in xss
    {
        result += xs
    }
    
    return result
}

// Now, flatten using reduce
func flattenUsingReduce<T> (xss:[[T]]) -> [T]
{
    return xss.reduce([]){result, xs in result + xs}
}

// You can also redefine map and filter using reduce
func mapUsingReduce<T,U> (xs:[T], f: T -> U) -> [U]
{
    return xs.reduce([]){result, x in result + [f(x)]}
}

func filterUsingReduce<T> (xs:[T], check: T -> Bool) -> [T]
{
    return xs.reduce([]) {result, x in return check(x) ? result + [x] : result}
}

