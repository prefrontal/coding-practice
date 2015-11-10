//: Playground - noun: a place where people can play

import Cocoa

class Student : NSObject
{
    var name = ""
    var gradeLevel = 0
}

let s = Student ()

// Set values using KVC
s.setValue("Kelly", forKey: "name")
s.setValue(3, forKey: "gradeLevel")

// Get values using KVC
s.valueForKey("name")
s.valueForKey("gradeLevel")


