// Swift Programming Chapter 8

/* Optionals */

// Used when an instance may or may not have a value
// An instance that may be nil should be declared as optional

var errorCodeString:String?
errorCodeString = "404"

// Checking for nil, with forced unwrapping:

if errorCodeString != nil
{
    let theError = errorCodeString!
    print (theError)
}

// Forced unwrapping access the underlying value of the optional. It assumes there is a value.
// Programs will crash if you force unwrap a nil variable
// An optional type (e.g. String?) is not the same as its base type (String)

// Optional binding is a pattern to detect if an optional has a value:

if let theError = errorCodeString
{
    print (theError)
}

// Type conversions, like Int(x), return optionals since they can fail
// You can unwrap multipl optionals using optional binding:

if let theError = errorCodeString, errorCodeInteger = Int(theError)
{
    print ("\(theError): \(errorCodeInteger)")
}

// You can also integrate where clauses into the mix
// The where clause is only executed if both variables successfully unwrap:

if let theError = errorCodeString, errorCodeInteger = Int(theError) where errorCodeInteger == 404
{
    print ("\(theError): \(errorCodeInteger)")
}

// Implicitly unwrapped optionals are optional types that do not need to be unwrapped
// Accessing the value of an implicit optional wil lcause a crash if it has no value

// Optional chaining is another mechanism to determine if an optional has a value
// This method allows for multiple queries into an optional's value

var errorDescription:String?
errorDescription = "This is an error description"
var upCaseErrorDescription = errorDescription?.uppercaseString

// Optional chains return an optional
// You can modify optionals using chaining. The following change only happens if there is a value:

upCaseErrorDescription?.appendContentsOf(" PLEASE TRY AGAIN")
print (upCaseErrorDescription)

// You can use the nil coalescing operator (??) to set a different value if nil

let description = errorDescription ?? "No Error"



