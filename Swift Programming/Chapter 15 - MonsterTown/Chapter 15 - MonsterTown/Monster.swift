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
    var town:Town?
    var name = "Monster"

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