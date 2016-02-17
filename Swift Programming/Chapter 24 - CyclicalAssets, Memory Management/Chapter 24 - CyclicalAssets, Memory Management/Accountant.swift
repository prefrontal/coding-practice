//
//  Accountant.swift
//  Chapter 24 - CyclicalAssets, Memory Management
//
//  Created by Craig Bennett on 2/16/16.
//  Copyright © 2016 Voxelwise. All rights reserved.
//

import Foundation

class Accountant
{
    typealias NetWorthChanged = (Double) -> ()
    
    var netWorthChangedHandler:NetWorthChanged? = nil
    
    var netWorth:Double = 0.0
    {
        didSet
        {
            netWorthChangedHandler? (netWorth)
        }
    }
    
    func gainedNewAsset (asset:Asset)
    {
        netWorth += asset.value
    }
}