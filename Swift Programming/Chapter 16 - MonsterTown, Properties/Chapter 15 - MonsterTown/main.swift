//
//  main.swift
//  Chapter 15 - MonsterTown
//
//  Created by Craig Bennett on 1/31/16.
//  Copyright © 2016 Voxelwise. All rights reserved.
//

import Foundation

var myTown = Town()

let ts = myTown.townSize
print (ts)

myTown.changePopulation(500)
myTown.printTownDescription()

//let gm = Monster()
//gm.town = myTown
//gm.terrorizeTown()

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()

fredTheZombie.changeName("Fred the Zombie", walksWithLimp: false)

print ("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print ("Victim pool: \(fredTheZombie.victimPool)")

print (Zombie.spookyNoise)
if Zombie.isTerrifying
{
    print ("Run away!")
}