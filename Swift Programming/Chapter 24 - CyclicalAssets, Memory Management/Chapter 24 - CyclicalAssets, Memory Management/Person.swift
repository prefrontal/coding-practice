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
    let accountant = Accountant()
    var assets = [Asset]()

    var description:String
    {
        return "Person(\(name))"
    }

    init (name:String)
    {
        self.name = name
        
        accountant.netWorthChangedHandler =
        {
            [weak self] netWorth in
            self?.netWorthDidChange (netWorth)
            return
        }
    }

    deinit
    {
        print ("\(self) is being deallocated")
    }
    
    func takeOwnershipOfAsset (asset:Asset)
    {
        asset.owner = self
        assets.append (asset)
        accountant.gainedNewAsset (asset)
    }
    
    func netWorthDidChange (netWorth:Double)
    {
        print ("The net worth of \(self) is now \(netWorth)")
    }
}