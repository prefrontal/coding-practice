//
//  Asset.swift
//  Chapter 24 - CyclicalAssets, Memory Management
//
//  Created by Craig Bennett on 2/16/16.
//  Copyright © 2016 Voxelwise. All rights reserved.
//

import Foundation

class Asset:CustomStringConvertible
{
    let name:String
    let value:Double
    weak var owner:Person?
    
    var description:String
    {
        if let actualOwner = owner
        {
            return "Asset (\(name), worth \(value), owned by \(actualOwner))"
        }
        else
        {
            return "Asset (\(name), worth \(value), not owned by anyone)"
        }
    }
    
    init (name:String, value:Double)
    {
        self.name = name
        self.value = value
    }
    
    deinit
    {
        print ("\(self) is being deallocated")
    }
}