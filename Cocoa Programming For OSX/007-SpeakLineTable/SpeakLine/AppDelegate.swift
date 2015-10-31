//
//  AppDelegate.swift
//  SpeakLine
//
//  Created by Craig Bennett on 10/29/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{

    var mainWindowController: MainWindowController?

    func applicationDidFinishLaunching(notification: NSNotification)
    {
        // Create a window controller
        let mainWindowController = MainWindowController ()

        // Put the window of the window controlelr on the screen
        mainWindowController.showWindow (self)

        // Set the property to point to the window controller
        self.mainWindowController = mainWindowController
    }

}

