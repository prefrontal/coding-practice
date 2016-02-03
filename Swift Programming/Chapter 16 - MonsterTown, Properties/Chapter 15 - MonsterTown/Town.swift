//
//  Town.swift
//  Chapter 15 - MonsterTown
//
//  Created by Craig Bennett on 1/31/16.
//  Copyright © 2016 Voxelwise. All rights reserved.
//

import Foundation

struct Town
{
    // Type property that is common to all instances of Town
    // Stored type properties have to be given a type value
    // Classes can also have stored and computed type classes
    static let region = "South"
    
    // Read/write property with default value
    var numberOfStoplights = 4
    
    // Read-only property with a default value
    // let region = "South"
    
    // Read/write property, default value, and observer
    // The didSet observer will report just after a value has been changed
    var population = 5422
    {
        didSet (oldPopulation)
        {
            print ("The population has changed to \(population) from \(oldPopulation)")
        }
    }
    

    
    // Nested type
    // This is an enumeration embedded in the Town struct
    // It cannot be used outside of the Town struct
    enum Size
    {
        case Small
        case Medium
        case Large
    }
    
    // Lazy loading property
    // Delay the value calcuation until the first time it is accessed
    // When accessed, the closure will calculate the value
    // The end parentheses mean that the closure will be executed and not assigned
    // Lazy properties are only calcualted *once*
    
    //    lazy var townSize:Size =
    //    {
    //        switch self.population
    //        {
    //        case 0...10000:
    //            return Size.Small
    //        case 10001...100000:
    //            return Size.Medium
    //        default:
    //            return Size.Large
    //        }
    //    }()
    
    // Computed property
    // Provides a getter and a setter to work with values
    // You must provide type information with a computed property
    
    var townSize:Size
    {
        get
        {
            switch self.population
            {
            case 0...10000:
                return Size.Small
            case 10001...100000:
                return Size.Medium
            default:
                return Size.Large
            }
        }
    }

    // Method that just uses data
    func printTownDescription ()
    {
        print ("Population: \(population), Number of stoplights: \(numberOfStoplights)")
    }

    // Method that mutates data
    // The mutating keyword allows the method to change structure values
    mutating func changePopulation (amount:Int)
    {
        population += amount
    }
}