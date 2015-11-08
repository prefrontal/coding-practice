//
//  Document.swift
//  RaiseMan
//
//  Created by Craig Bennett on 11/1/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

import Cocoa

private var KVOContext: Int = 0

class Document: NSDocument, NSWindowDelegate
{

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var arrayController: NSArrayController!

    var employees: [Employee] = []
    {
        willSet
        {
            for employee in employees
            {
                stopObservingEmployee (employee)
            }
        }
        didSet
        {
            for employee in employees
            {
                startObservingEmployee (employee)
            }
        }
    }

    // MARK: - Actions

    @IBAction func addEmployee (sender: NSButton)
    {
        let windowController = windowControllers[0]
        let window = windowController.window!

        let endedEditing = window.makeFirstResponder(window)

        if !endedEditing
        {
            print ("Unable to end editing")
            return
        }

        let undo: NSUndoManager = undoManager!

        // Has an edit already occurred in this event?
        if undo.groupingLevel > 0
        {
            // Close the last group
            undo.endUndoGrouping()
            // Open a new group
            undo.beginUndoGrouping()
        }

        // Create the object
        let employee = arrayController.newObject() as! Employee

        // Add it to the array controller's contentArray
        arrayController.addObject(employee)

        // Re-sort (in case the user has sorted a column)
        arrayController.rearrangeObjects()

        // Get the sorted array
        let sortedEmployees = arrayController.arrangedObjects as! [Employee]

        // Find the object just added
        let row = sortedEmployees.indexOf (employee)!

        // Begin the edit in the first column
        print ("Starting edit of \(employee) in row \(row)")
        tableView.editColumn (0, row: row, withEvent: nil, select: true)
    }

    // MARK: - Controller Methods

    override init ()
    {
        super.init ()
        // Add your subclass-specific initialization here.
    }

    override func windowControllerDidLoadNib (aController: NSWindowController)
    {
        super.windowControllerDidLoadNib (aController)
        // Add any code here that needs to be executed once the windowController has loaded the document's window.
    }

    override class func autosavesInPlace () -> Bool
    {
        return true
    }

    override var windowNibName: String?
    {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
        return "Document"
    }

    override func dataOfType (typeName: String) throws -> NSData
    {
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
        throw NSError (domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func readFromData (data: NSData, ofType typeName: String) throws
    {
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
        throw NSError (domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    // MARK: - Accessors

    func insertObject (employee: Employee, inEmployeesAtIndex index: Int)
    {
        print ("Adding \(employee) to the employees array")

        // Add the inverse of this operation to the undo stack
        let undo: NSUndoManager = undoManager!
        undo.prepareWithInvocationTarget(self).removeObjectFromEmployeesAtIndex (employees.count)

        if !undo.undoing
        {
            undo.setActionName ("Add Person")
        }

        employees.append (employee)
    }

    func removeObjectFromEmployeesAtIndex (index: Int)
    {
        let employee: Employee = employees[index]
        print ("Removing \(employee) from the employees array")

        // Add the inverse of this operation to the undo stack
        let undo: NSUndoManager = undoManager!
        undo.prepareWithInvocationTarget(self).insertObject (employee, inEmployeesAtIndex: index)

        if !undo.undoing
        {
            undo.setActionName("Remove Person")
        }

        // Remove employee from the array
        employees.removeAtIndex(index)
    }

    // Mark: - Key Value Observing

    func startObservingEmployee (employee: Employee)
    {
        employee.addObserver (self, forKeyPath: "name", options: .Old, context: &KVOContext)
        employee.addObserver (self, forKeyPath: "raise", options: .Old, context: &KVOContext)
    }

    func stopObservingEmployee (employee: Employee)
    {
        employee.removeObserver(self, forKeyPath: "name", context: &KVOContext)
        employee.removeObserver(self, forKeyPath: "raise", context: &KVOContext)
    }

    override func observeValueForKeyPath (keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>)
    {
        if context != &KVOContext
        {
            // If the context does not match then this method is intended for the superclass
            super.observeValueForKeyPath (keyPath, ofObject: object, change: change, context: context)
            return
        }

        if let keyPath = keyPath, object = object, change = change
        {
            var oldValue: AnyObject? = change[NSKeyValueChangeOldKey]

            if oldValue is NSNull
            {
                oldValue = nil
            }

            let undo: NSUndoManager = undoManager!
            undo.prepareWithInvocationTarget(object).setValue(oldValue, forKeyPath: keyPath)

            print ("oldValue=\(oldValue)")
        }
    }

    // MARK: - NSWindowDelegate

    func windowWillClose(notification: NSNotification)
    {
        employees = []
    }
}

