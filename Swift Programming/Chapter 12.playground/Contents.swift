// Swift Programming Chapter 12

/* Functions */

// Basic function

func printGreeting()
{
    print ("Hello, playground")
}

printGreeting()

// Taking parameters
// By default, you do not use or reference the first parameter name when calling a function

func printPersonalGreeting (name:String)
{
    print ("Hello \(name), welcome to your playground")
}

printPersonalGreeting("Matt")

// Multiple parameters
// You do use the name of the second parameter when calling with 2+ arguments

func divisionDescription (num:Double, den:Double)
{
    print ("\(num) divided by \(den) equals \(num/den)")
}

divisionDescription(10, den: 5)

// Naming parameters
// You can choose to explicitly name parameters, called "external names"

func divisionDescription2 (forNumerator num:Double, andDenominator den:Double)
{
    print ("\(num) divided by \(den) equals \(num/den)")
}

divisionDescription2 (forNumerator: 20, andDenominator: 2)

// Variadic parameters
// Take zero or more input values as arguments

func printPersonalGreetings (names:String...)
{
    for name in names
    {
        print ("Hello \(name), welcome to the playground")
    }
}

printPersonalGreetings("Alex","Chris","Drew","Pat")

// Default parameter values
// Default values should be placed at the end of the parameter list

func divisionDescription3 (forNumerator num:Double, andDenominator den:Double, withPunctuation punctuation:String = "!")
{
    print ("\(num) divided by \(den) equals \(num/den)\(punctuation)")
}

divisionDescription3(forNumerator: 30, andDenominator: 12, withPunctuation: ".")
divisionDescription3(forNumerator: 40, andDenominator: 22)

// In-out parameters
// Parameters can be marked that they both take a value and return a value
// Cannot use default values and they cannot be variadic

var error = "The request failed"

func appendErrorCode (code:Int, inout toErrorString errorString:String)
{
    if code == 400
    {
        errorString += ": bad request"
    }
}

appendErrorCode(400, toErrorString: &error)

// The ampersand in the call indicates that you know the value may be modified

// Normal returns

func divisionDescription4 (forNumerator num:Double, andDenominator den:Double, withPunctuation punctuation:String = "!") -> String
{
    return "\(num) divided by \(den) equals \(num/den)\(punctuation)"
}

print (divisionDescription4(forNumerator: 60, andDenominator: 3.33, withPunctuation: "?"))

// You can nest functions, one inside the other
// This is useful when you need to do some work, but only within the other function

func areaOfTriangle (withBase base:Double, andHeight height:Double) -> Double
{
    let numerator = base*height

    func divide () -> Double
    {
        return numerator/2
    }

    return divide()
}

areaOfTriangle(withBase: 3, andHeight: 5)

// The divide() function has access to the scope of the enclosing
// function, but it is not visible outside of the enclosing function

// Multiple returns
// Swift uses the tuple data type for multiple returns

func sortEvenOdd (numbers:[Int]) -> (evens:[Int], odds:[Int])
{
    var evens = [Int]()
    var odds = [Int]()

    for number in numbers
    {
        if number%2 == 0
        {
            evens.append(number)
        }
        else
        {
            odds.append(number)
        }
    }

    return (evens, odds)
}

let aBunchOfNumbers = [10,1,4,3,57,43,84,27,156,111]
let theSortedNumbers = sortEvenOdd(aBunchOfNumbers)

// Optional return types

func grabMiddleName (name:(String, String?, String)) -> String?
{
    return name.1
}

let middleName = grabMiddleName(("Matt",nil,"Mathias"))

// Exiting a function early
// A guard statement is used to exit early if a condition is not met

func greetByMiddleName (name: (first:String, middle:String?, last:String))
{
    guard let middleName = name.middle else
    {
        print ("Hey there!")
        return
    }

    print ("Hey \(middleName)!")
}

greetByMiddleName(("Matt","Danger","Mathias"))

// Function types
// Function types are made up of a function's parameter and return types

// For example, the following function:
// func sortEvenOdd (numbers:[Int]) -> (evens:[Int], odds:[Int])
// has a function type of:
// [Int] -> ([Int], [Int])

// You can assign function types to variables and pass them around:

let evenOddFunction: ([Int]) -> ([Int],[Int]) = sortEvenOdd

evenOddFunction([1,2,3])

