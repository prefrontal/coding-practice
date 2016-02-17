//
//  main.swift
//  Chapter 24 - CyclicalAssets, Memory Management
//
//  Created by Craig Bennett on 2/15/16.
//  Copyright © 2016 Voxelwise. All rights reserved.
//

import Foundation

var bob:Person? = Person (name:"Bob")
print ("Created \(bob)")

var laptop:Asset? = Asset (name:"Shiny Laptop", value:1500.0)
var hat:Asset? = Asset (name:"Cowboy Hat", value:175.0)
var backpack:Asset? = Asset (name:"Blue Backpack", value:45.0)

bob?.takeOwnershipOfAsset (laptop!)
bob?.takeOwnershipOfAsset (hat!)

print ("Whil bob is alive, hat's owner is \(hat!.owner)")
bob = nil
print ("The bob variable is now \(bob)")
print ("After bob is deallocated, hat's owner is \(hat!.owner)")

laptop = nil
hat = nil
backpack = nil