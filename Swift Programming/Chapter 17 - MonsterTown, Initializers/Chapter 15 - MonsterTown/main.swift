//
//  main.swift
//  Chapter 15 - MonsterTown
//
//  Created by Craig Bennett on 1/31/16.
//  Copyright © 2016 Voxelwise. All rights reserved.
//

import Foundation

// Use free member-wise initializer
// Paramter names are the variable names
// This initializer is not available if you define a custom initializer
// var myTown = Town (population:10000, stoplights:6)

// Now use a custom initializer
var myTown = Town (population:10000, stoplights:6)
myTown?.printTownDescription()

let ts = myTown?.townSize
print (ts)

myTown?.changePopulation(500)
myTown?.printTownDescription()

//let gm = Monster()
//gm.town = myTown
//gm.terrrorizeTown()

var fredTheZombie:Zombie? = Zombie (limp:false, fallingApart:false, town:myTown, monsterName:"Fred")
fredTheZombie?.town = myTown
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printTownDescription()

fredTheZombie?.changeName("Fred the Zombie", walksWithLimp: false)

var convenientZombie = Zombie (limp:true, fallingApart:false)

print ("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500
print ("Victim pool: \(fredTheZombie?.victimPool)")

// Calling a type method
print (Zombie.spookyNoise)
if Zombie.isTerrifying
{
    print ("Run away!")
}

// Deallocate the zombie
fredTheZombie = nil