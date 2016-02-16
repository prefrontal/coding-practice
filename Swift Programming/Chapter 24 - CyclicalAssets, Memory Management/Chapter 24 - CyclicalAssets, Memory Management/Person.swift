//
//  Person.swift
//  Chapter 24 - CyclicalAssets, Memory Management
//
//  Created by Craig Bennett on 2/15/16.
//  Copyright © 2016 Voxelwise. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible
{
    let name:String

    var description:String
        {
            return "Person(\(name))"
    }

    init (name:String)
    {
        self.name = name
    }

    deinit
    {
        print ("\(self) is being deallocated")
    }
}