//
//  Monster.swift
//  Chapter 15 - MonsterTown
//
//  Created by Craig Bennett on 1/31/16.
//  Copyright © 2016 Voxelwise. All rights reserved.
//

import Foundation

class Monster
{
    // Static property
    static let isTerrifying = true
    
    // Computed type property
    class var spookyNoise:String
    {
        return "Grrr..."
    }
    
    var town:Town?
    var name = "Monster"

    // Computed property with a setter and a getter
    var victimPool:Int
    {
        get
        {
            return town?.population ?? 0
        }
        
        set (newVictimPool)
        {
            town?.population = newVictimPool
        }
    }
    
    func terrorizeTown()
    {
        if town != nil
        {
            print ("\(name) is terrorizing a town!")
        }
        else
        {
            print ("\(name) hasn't found a town to terrorize yet...")
        }
    }
}