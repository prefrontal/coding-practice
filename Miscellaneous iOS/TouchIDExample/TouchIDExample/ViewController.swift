//
//  ViewController.swift
//  TouchIDExample
//
//  Created by Craig Bennett on 3/19/16.
//  Copyright © 2016 Voxelwise. All rights reserved.
//

import UIKit
import LocalAuthentication


class ViewController: UIViewController
{
    @IBOutlet weak var buttonCheckTouchID: UIButton!
    @IBOutlet weak var buttonAuthenticateTouchID: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        buttonAuthenticateTouchID.enabled = false
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func CheckTouchID (sender: AnyObject)
    {
        let context = LAContext()
        var error:NSError?
        
        let isTouchIdAvailable = context.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error:&error)
        buttonAuthenticateTouchID.enabled = isTouchIdAvailable
        
        // Touch ID is not available
        if isTouchIdAvailable == false
        {
            NSLog("Touch ID is not available")
            
            let alertController = UIAlertController (title: "Touch ID", message: "Touch ID is not available", preferredStyle: .Alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {
            NSLog("Touch ID is available")
        }
    }
    
    @IBAction func authenticateTouchID (sender: AnyObject)
    {
        
        let context = LAContext()
        var error:NSError?
        
        let reason = "Please authenticate with Touch ID to access your private information"
        
        context.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: {(success:Bool, error:NSError?) in
            
            if success
            {
                // The user was authenticated
                NSLog("Authenticated!")
            }
            else
            {
                // The user was not authenticated
                NSLog("Not authenticated!")
            }
        })
        
    }

}

