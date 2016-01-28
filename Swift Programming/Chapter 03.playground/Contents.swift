// Swift Programming Chapter 3

/* If/Else Statements */

var population:Int = 5422
var message:String

if population < 10000
{
    message = "\(population) is a small town!"
}
else if population >= 10000 && population < 50000
{
    message = "\(population) is a medium town!"
}
else
{
    message = "\(population) is pretty big!"
}

print (message)

// Comparison operators: <, <=, >, >=, ==
// Reference comparison operators: ===, !==

var hasPostOffice:Bool = false

if !hasPostOffice
{
    print ("Where do you buy stamps?")
}

// Logical operators: &&, ||, !

