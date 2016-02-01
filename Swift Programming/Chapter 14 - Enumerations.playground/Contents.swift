// Swift Programming Chapter 14

/* Enumerations */

// Allow you to create instances that are one of a predefined list of cases
// Enumeration types are capitalized by convention
// Definition:

enum TextAlignment
{
    case Left
    case Right
    case Center
}

var alignment:TextAlignment = TextAlignment.Left

// Using type inference:

var alignment2 = TextAlignment.Right

// Inferring the enum type after assignment:

var alignment3 = TextAlignment.Center
alignment3 = .Right

if alignment3 == .Right
{
    print ("Inferred the type!")
}

switch alignment
{
case .Left:
    print ("left")
case .Right:
    print ("right")
case .Center:
    print ("center")
}

// Rememmber that switch statments must be exhaustive and have all cases of an enumeration
// Try to avoid default cases for enumaerations, since they are not future-proof

// While enumerations do not have an underlying integer type, you can act like they do with raw values

enum TextAlignment2:Int
{
    case Left
    case Right
    case Center
}

TextAlignment2.Left.rawValue
TextAlignment2.Right.rawValue
TextAlignment2.Center.rawValue

// Specifying raw values:

enum TextAlignment3:Int
{
    case Left = 10
    case Right = 20
    case Center = 30
}

TextAlignment3.Left.rawValue
TextAlignment3.Right.rawValue
TextAlignment3.Center.rawValue

// Go from raw values back to enumeration values:

let myRawValue = 20

if let myAlignment = TextAlignment3 (rawValue:myRawValue)
{
    myAlignment
}
else
{
    print ("Conversion failed")
}

// Enumeration with strings:

enum ProgrammingLanguage:String
{
    case Swift = "Swift"
    case ObjetiveC = "Objective-C"
    case C = "C"
    case Cpp = "C++"
    case Java = "Java"
}

let myFavoriteLanguage = ProgrammingLanguage.Swift

// If you omit the raw string value then Swift will use the case name itself:

enum ProgrammingLanguage2:String
{
    case Swift
    case ObjetiveC = "Objective-C"
    case C
    case Cpp = "C++"
    case Java
}

// In Swift, methods can be associated with enumerations

enum Lightbulb
{
    case On
    case Off
    
    func surfaceTemperatureForAmbientTemperature (ambient:Double) -> Double
    {
        switch self
        {
        case .On:
            return ambient + 150.0
        case .Off:
            return ambient
        }
    }
    
    mutating func toggle()
    {
        switch self
        {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}

var bulb = Lightbulb.On
let ambientTemperature = 77.0
var bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)

bulb.toggle()
var bulbTemperature2 = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)


// All Swift methods have an implicit self argument which is used to
// access the instance on which the method is called

// The mutating keyword tells the compiler that the methods is allowed to make changes to self

// Associated values allow you to attach data to instances of an enumeration
// Different cases can have different types of assoociated values
// Not all cases haveto have an associated value

enum ShapeDimensions
{
    // the point is dimensionless
    case Point
    
    // Square's associate value is the length of one side
    case Square (Double)
    
    // Rectangle's associated value defiens its width and height
    case Rectangle (width:Double, height:Double)
    
    func area () -> Double
    {
        switch self
        {
        case .Point:
            return 0
        case let .Square (side):
            return side*side
        case let .Rectangle (width:w, height:h):
            return w*h
        }
    }
}

var squareShape = ShapeDimensions.Square(10.0)
var rectangleShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)

squareShape.area()
rectangleShape.area()

// Recursive enumerations
// You can use the keyword indirect to tell the compiler to store an enumeration's data behind a pointer

indirect enum FamilyTree
{
    case NoKnownParents
    case OneKnownParent (name:String, fatherAncestors:FamilyTree)
    case TwoKnownParents (fatherName:String, fatherAncestors:FamilyTree,
                          motherName:String, motherAncestors:FamilyTree)
}

// You can also mark individual cases as indirect:

enum FamilyTree2
{
    case NoKnownParents
    indirect case OneKnownParent (name:String, fatherAncestors:FamilyTree2)
    indirect case TwoKnownParents (fatherName:String, fatherAncestors:FamilyTree2,
                                   motherName:String, motherAncestors:FamilyTree2)
}

let fredAncestors = FamilyTree2.TwoKnownParents(
    fatherName: "Roger",
    fatherAncestors: .OneKnownParent(name:"Beth", fatherAncestors:.NoKnownParents),
    motherName: "Marsha",
    motherAncestors: .NoKnownParents)




