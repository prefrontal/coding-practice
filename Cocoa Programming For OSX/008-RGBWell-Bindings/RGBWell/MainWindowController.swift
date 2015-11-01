//
//  MainWindowController.swift
//  RGBWell
//
//  Created by Craig Bennett on 10/28/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

import Cocoa

class MainWindowController : NSWindowController
{
    dynamic var r = 0.0
    dynamic var g = 0.0
    dynamic var b = 0.0
    dynamic var a = 1.0

    dynamic var currentColor : NSColor = NSColor.blackColor()

    override var windowNibName: String?
    {
        return "MainWindowController"
    }

    override func windowDidLoad()
    {
        super.windowDidLoad()
    }

    @IBAction func adjustRed (sender: NSSlider)
    {
        updateColor()
    }

    @IBAction func adjustGreen (sender: NSSlider)
    {
        updateColor()
    }

    @IBAction func adjustBlue (sender: NSSlider)
    {
        updateColor()
    }

    func updateColor ()
    {
        let newColor = NSColor (calibratedRed: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
        currentColor = newColor
    }
}
