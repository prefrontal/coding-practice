// Swift Programming Chapter 19

/* Protocols */

import Cocoa

func padding (amount:Int) -> String
{
    var paddingString = ""
    for _ in 0 ..< amount
    {
        paddingString += " "
    }

    return paddingString
}

func printTable (rowLabels:[String], columnLabels:[String], data:[[Int]])
{
    // Create an array of the width of each row label
    let rowLabelWidths = rowLabels.map { $0.characters.count }

    // Determine the length of the longest row label
    guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {return}

    // Create first row containing column headers
    var firstRow:String  = padding(maxRowLabelWidth) + " |"

    // Also, keep track of the width of each column
    var columnWidths = [Int]()

    for columnLabel in columnLabels
    {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append (columnHeader.characters.count)
    }

    print (firstRow)

    for (i, row) in data.enumerate()
    {
        // Pad the row label out so they are all the same length
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"

        // Append each item in this row to our string
        for (j, item) in row.enumerate()
        {
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }

        // Done - print it!
        print (out)
    }
}

struct Person
{
    let name:String
    let age:Int
    let yearsOfExperience:Int
}

struct Department
{
    let name:String
    var people = [Person]()

    init (name:String)
    {
        self.name = name
    }

    mutating func addPerson (person:Person)
    {
        people.append(person)
    }
}

var department = Department (name:"Engineering")
department.addPerson(Person(name:"Joe", age:30, yearsOfExperience:6))
department.addPerson(Person(name:"Karen", age:40, yearsOfExperience:18))
department.addPerson(Person(name:"Fred", age:50, yearsOfExperience:20))

printTable (rowLabels, columnLabels: columnLabels, data:data)
