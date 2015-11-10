//
//  Employee.swift
//  RaiseMan
//
//  Created by Craig Bennett on 11/4/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

import Foundation

class Employee : NSObject
{
    var name: String? = "New Employee"
    var raise: Float = 0.05

    func validateRaise (raiseNumberPointer: AutoreleasingUnsafeMutablePointer<NSNumber?>) throws
    {
        let raiseNumber = raiseNumberPointer.memory

        if (raiseNumber == nil)
        {
            let domain = "UserInputValidationErrorDomain"
            let code = 0
            let userInfo = [NSLocalizedDescriptionKey : "An employee's raise must be a number."]
            throw NSError(domain: domain, code: code, userInfo: userInfo)
        }
    }

}