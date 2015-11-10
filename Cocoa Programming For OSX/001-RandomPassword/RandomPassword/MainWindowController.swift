//
//  MainWindowController.swift
//  RandomPassword
//
//  Created by Craig Bennett on 10/24/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController
{

    @IBOutlet weak var textField: NSTextField!

    override var windowNibName: String?
    {
        return "MainWindowController"
    }

    override func windowDidLoad()
    {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    @IBAction func generatePassword (sender: AnyObject)
    {
        // Get a random string of length 8
        let length = 8
        let password = generateRandomString(length)

        // Tell the text field to display the string
        textField.stringValue = password
    }
    
}
