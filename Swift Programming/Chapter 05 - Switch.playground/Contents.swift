// Swift Programming Chapter 5

/* Switches */

var statusCode:Int = 404
var errorString:String = ""

switch statusCode
{
case 400:
    errorString = "Bad Request"
case 401:
    errorString = "Unauthorized"
case 403:
    errorString = "Forbidden"
case 404, 808:
    errorString = "Not Found"
    fallthrough
default:
    errorString += " or Whatever"
}

// You can put multiple cases on one line
// The `fallthrough` command allows execution in the switch to continue
// This is the opposite of needing `break`, like Obejctive-C

// It is mandatory for a switch statement to have a case for every possible value
// Every case must have at least one line of executable code

// You can also specify ranges:

switch statusCode
{
case 400...417:
    errorString += " - Client Error"
default:
    errorString += " - Unknown"
}

// Example of value binding and the where clause:

statusCode = 200

switch statusCode
{
case 100,101:
    print ("Informational")
case 400...417:
    print ("Client Error")
case 500...505:
    print ("Server Error")
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
    print ("Not an error code")
default:
    print ("Unexpected Error")
}

// A tuple is a finite grouping of two or more values that are deemed to be logically related

let error = (statusCode, errorString)  // Basic tuple

error.0
error.1

let error2 = (code:statusCode, error:errorString)  // Named tuple

error2.code
error2.error

// Switch statement tuple pattern matching:

let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes
{
case (404, 404):
    print ("No items found")
case (404, _):
    print ("First item not found")
case (_, 404):
    print ("Second item not found")
default:
    print ("All items found")
}

// The underscore (_) is a wildcard that matches anything in a tuple
// You can also do pattern matching with and if-case statement:

let age = 25
if case 18...35 = age
{
    print ("Cool Demographic")
}

if case 18...35 = age where age > 21
{
    print ("Cool demographic and of drinking age")
}






