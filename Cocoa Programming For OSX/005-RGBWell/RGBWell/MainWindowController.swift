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
    var r = 0.0
    var g = 0.0
    var b = 0.0
    var a = 1.0

    @IBOutlet weak var redSlider: NSSlider!
    @IBOutlet weak var greenSlider: NSSlider!
    @IBOutlet weak var blueSlider: NSSlider!

    @IBOutlet weak var colorWell: NSColorWell!

    override var windowNibName: String?
    {
        return "MainWindowController"
    }

    override func windowDidLoad()
    {
        super.windowDidLoad()
        redSlider.doubleValue = r
        greenSlider.doubleValue = g
        blueSlider.doubleValue = b
        updateColor()
    }

    @IBAction func adjustRed (sender: NSSlider)
    {
        r = sender.doubleValue
        print ("Red slider value is \(r)")
        updateColor()
    }

    @IBAction func adjustGreen (sender: NSSlider)
    {
        g = sender.doubleValue
        print ("Green slider value is \(g)")
        updateColor()
    }

    @IBAction func adjustBlue (sender: NSSlider)
    {
        b = sender.doubleValue
        print ("Blue slider value is \(b)")
        updateColor()
    }

    func updateColor ()
    {
        let newColor = NSColor (calibratedRed: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
        colorWell.color = newColor
    }
}
