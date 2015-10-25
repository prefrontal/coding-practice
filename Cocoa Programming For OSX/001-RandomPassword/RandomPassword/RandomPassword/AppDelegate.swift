//
//  AppDelegate.swift
//  RandomPassword
//
//  Created by Craig Bennett on 10/24/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{

    var mainWindowController: MainWindowController?


    func applicationDidFinishLaunching (aNotification: NSNotification)
    {
        // Insert code here to initialize your application

        // Create a windows controller with a XIB file of the same name
        //let mainWindowController = MainWindowController (windowNibName: "MainWindowController")
        let mainWindowController = MainWindowController ()

        // Put the window of the controlelr on the screen
        mainWindowController.showWindow (self)

        // Set the propert y ot point to the window controller
        self.mainWindowController = mainWindowController
    }

    func applicationWillTerminate (aNotification: NSNotification)
    {
        // Insert code here to tear down your application
    }


}

