//
//  Zombie.swift
//  Chapter 15 - MonsterTown
//
//  Created by Craig Bennett on 1/31/16.
//  Copyright © 2016 Voxelwise. All rights reserved.
//

import Foundation

// The zombie class inherits from the monster superclass
class Zombie: Monster
{
    // New property that the monster superclass does not have
    var walksWithLimp = true

    // Internal access to getter, private access to setter
    // The setter cannot be more visible than the getter
    // internal private(set) var isFallingApart = false
    // With implicit internal call
    private(set) var isFallingApart = false
    
    // Override the base class implementation
    // The override keyword allows you to do this
    // The final keyword indicates that it cannot be overridden in a subclass
    final override func terrorizeTown()
    {
        if !isFallingApart
        {
            // Structs are copied when passed, so optional binding can't be used here
            // Optional chaining works best here
            town?.changePopulation(-10)
        }

        // Call the superclass implementation
        super.terrorizeTown()
    }

    func changeName (name:String, walksWithLimp:Bool)
    {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }

    // Type method, operates on the class and not the instance
    // These are like class methods in Objective-C
    // They cannot call instance methods of instance properties
    
    //    class func makeSpookyNoise() -> String
    //    {
    //        return "Brains..."
    //    }
    
    // Now, make the above type method into a computed property
    // Uses shorthand getter syntax.  If you don't have a setter...
    override class var spookyNoise:String
    {
            return "Brains..."
    }
    
}