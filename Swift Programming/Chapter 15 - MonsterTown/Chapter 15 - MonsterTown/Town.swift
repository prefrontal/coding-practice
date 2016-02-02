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
    // Properties with default values
    var population = 5422
    var numberOfStoplights = 4

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