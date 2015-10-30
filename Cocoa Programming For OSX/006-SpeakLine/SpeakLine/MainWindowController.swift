//
//  MainWindowController.swift
//  SpeakLine
//
//  Created by Craig Bennett on 10/29/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController, NSSpeechSynthesizerDelegate, NSWindowDelegate
{
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!

    let speechSynth = NSSpeechSynthesizer ()

    var isStarted: Bool = false
    {
        didSet
        {
            updateButtons()
        }
    }

    override var windowNibName: String
    {
        return "MainWindowController"
    }

    override func windowDidLoad()
    {
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        super.windowDidLoad()
        speechSynth.delegate = self
    }

    // MARK: - Action Methods

    @IBAction func SpeakIt (sender:NSButton)
    {
        // Get typed-in text as string
        let string = textField.stringValue
        if string.isEmpty
        {
            print ("String from \(textField) is empty")
        }
        else
        {
            print ("String is \(string)")
            speechSynth.startSpeakingString (string)
            isStarted = true
        }
    }

    @IBAction func stopIt (sender:NSButton)
    {
        print("Stop button clicked")
        speechSynth.stopSpeaking ()
    }

    func updateButtons ()
    {
        if isStarted
        {
            speakButton.enabled = false
            stopButton.enabled = true
        }
        else
        {
            speakButton.enabled = true
            stopButton.enabled = false
        }
    }

    // MARK: - NSSpeechSynthesizerDelegate Methods

    func speechSynthesizer (sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool)
    {
        isStarted = false
        print ("FinishedSpeaking = \(finishedSpeaking)")
    }

    // MARK: - NSWindowDelegate Methods

    func windowShouldClose(sender: AnyObject) -> Bool
    {
        return !isStarted
    }

}
