//
//  MainWindowController.swift
//  SpeakLine
//
//  Created by Craig Bennett on 10/29/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController, NSSpeechSynthesizerDelegate, NSTableViewDataSource, NSTableViewDelegate, NSWindowDelegate
{
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var tableView: NSTableView!

    let speechSynth = NSSpeechSynthesizer ()

    let voices = NSSpeechSynthesizer.availableVoices() as! [String]

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

        for voice in voices
        {
            print (voiceNameForIdentifier(voice)!)
        }

        let defaultVoice = NSSpeechSynthesizer.defaultVoice()

        if let defaultRow = voices.indexOf(defaultVoice)
        {
            let indices = NSIndexSet (index: defaultRow)
            tableView.selectRowIndexes (indices, byExtendingSelection: false)
            tableView.scrollRowToVisible (defaultRow)
        }
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

    func voiceNameForIdentifier (identifier: String) -> String?
    {
        let attributes = NSSpeechSynthesizer.attributesForVoice (identifier)
        return attributes[NSVoiceName] as? String
    }

    // MARK: - NSSpeechSynthesizerDelegate Methods

    func speechSynthesizer (sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool)
    {
        isStarted = false
        print ("FinishedSpeaking = \(finishedSpeaking)")
    }

    // MARK: - NSWindowDelegate Methods

    func windowShouldClose (sender: AnyObject) -> Bool
    {
        return !isStarted
    }

    // MARK: - NSTableViewDataSource Methods

    func numberOfRowsInTableView (tableView: NSTableView) -> Int
    {
        return voices.count
    }

    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject?
    {
        let voice = voices[row]
        let voiceName = voiceNameForIdentifier(voice)
        return voiceName
    }

    // MARK: - NSTableViewDelegate Mathods

    func tableViewSelectionDidChange(notification: NSNotification)
    {
        let row = tableView.selectedRow

        // Set the voice back to default if no rows are selected
        if row == -1
        {
            speechSynth.setVoice(nil)
            return
        }

        let voice = voices[row]
        speechSynth.setVoice(voice)
    }

}
