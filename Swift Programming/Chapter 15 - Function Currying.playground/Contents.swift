// Swift Programming Chapter 15, Extra

/* Function Currying */

// Currying allows you to rewrite an existing function that takes multiple parameters
// as a new method that takes one parameters and returns another function

// A rewritten function is called a curried function

// Regular function call

func greetName (name:String, withGreeting greeting:String) -> String
{
    return ("\(greeting) \(name)")
}

let personalgreeting = greetName("Matt", withGreeting: "Hello")
personalgreeting

// Curried function call

func greetingForName (name:String) -> (String) -> String
{
    func greeting (greeting:String) -> String
    {
        return "\(greeting) \(name)"
    }

    return greeting
}

let greeterFunction = greetingForName ("Matt")
let theGreeting = greeterFunction("Hello,")
theGreeting

// More concise curried function

func greeting (greeting:String)(name:String) -> String
{
    return "\(greeting) \(name)"
}

let friendlyGreeting = greeting ("Hello,")
let newGreeting = friendlyGreeting (name:"Matt")
newGreeting

// Creatng a Person

struct Person
{
    var firstName = "Matt"
    var lastName = "Mathias"

    mutating func changeName (fn:String, ln:String)
    {
        firstName = fn
        lastName = ln
    }
}

var p = Person()


// Here is where we find that Swift's instance methods are actually curried functions
// A mutating function is a curried function whose first argument is self,
// passed in as an inout parameter
let changer = Person.changeName

changer(&p) ("John", ln:"Gallagher")
p.firstName


