//
//  MainWindowController.swift
//  Thermostat
//
//  Created by Craig Bennett on 11/1/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController
{
    // "dynamic" makes changes to temperature KVO-compliant
    private var privateTemperature = 68
    dynamic var isEnabled = true

    dynamic var temperature: Int
    {
        set
        {
            print ("Set temperature to \(newValue)")
            privateTemperature = newValue
        }

        get
        {
            print ("Get temperature")
            return privateTemperature
        }
    }

    override var windowNibName: String
    {
        return "MainWindowController"
    }

    override func windowDidLoad()
    {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    @IBAction func makeWarmer (sender:NSButton)
    {
        // First method to change value in a KVO-compliant way
        // let newTemeprature = temperature + 1
        // setValue (newTemeprature, forKey: "temperature")

        // Second method to change value in a KVO-compliant way
        // willChangeValueForKey("temperature")
        // temperature++
        // didChangeValueForKey("temperature")

        // Third way, now using "dynamic" keyword
        temperature++
    }

    @IBAction func makeCooler (sender:NSButton)
    {
        // First method to change value in a KVO-compliant way
        // let newTemperature = temperature - 1
        // setValue (newTemperature, forKey: "temperature")

        // Second method to change value in a KVO-compliant way
        // willChangeValueForKey("temperature")
        // temperature--
        // didChangeValueForKey("temperature")

        // Third way, now using "dynamic" keyword
        temperature--
    }

    // Called when KVC tries to set a value as nil
    override func setNilValueForKey (key: String)
    {
        switch key
        {
            case "temperature":
                temperature = 68
            default:
                super.setNilValueForKey(key)
        }
    }
}
