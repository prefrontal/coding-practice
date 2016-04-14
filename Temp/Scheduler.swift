// Scheduler.swift
// 
// Basic task scheduling and execution

import Foundation

// Objects of the Entry class represent
// individual pieces of work for execution
class Entry
{
	var taskToExecute = {print ("Uninitialized")}
	var executionTime = 0.0
	
	init (task:()->(), time:Double)
	{
		taskToExecute = task
		executionTime = time
	}
}

// This class manages the priority queue
// It allows for scheduling new tasks and 
// then executing them as a batch
class Scheduler
{
	var queue:[Entry] = []
	
	// Add a new Entry to the queue
	func Schedule (task:()->(), time:Double)
	{	
		// We are given the number of seconds from now to execute the task
		// Convert that from a relative to an absolute time
		let systemEpochTime = NSDate().timeIntervalSince1970
		let absoluteTime = systemEpochTime + time
		
		let newEntry = Entry (task:task, time:absoluteTime)
		
		queue.append(newEntry)
		queue.sortInPlace({$0.executionTime < $1.executionTime})
	}
	
	func Execute ()
	{
		print ("Executing tasks in queue...")
		
		while (queue.count > 0)
		{
			let systemEpochTime = NSDate().timeIntervalSince1970
			let nextTaskTime = queue[0].executionTime
			let timeToNextTask = nextTaskTime - systemEpochTime
			
			if (timeToNextTask > 0)
			{
				sleep (UInt32(timeToNextTask))
			}
				
			queue[0].taskToExecute()
			queue.removeAtIndex(0)
		}
		
		print ("Queue is now empty")
	}
	
}

// Test the operation of the Scheduler class

func taskOne ()
{
	print ("One")
}

func taskTwo ()
{
	print ("Two")	
}

var myScheduler = Scheduler()
myScheduler.Schedule (taskOne, time:2)
myScheduler.Schedule (taskTwo, time:4)
myScheduler.Execute()


