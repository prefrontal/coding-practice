# Scheduler.rb
# 
# Basic task scheduling and execution

# Objects of the Entry class represent
# individual pieces of work for execution
class Entry
	attr_reader :taskToExecute
	attr_reader :executionTime
	
	def initialize(task,time)
		@taskToExecute = task
		@executionTime = time
	end
end

# This class manages the priority queue
# It allows for scheduling new tasks and 
# then executing them as a batch
class Scheduler
	def initialize()
		@queue = []
	end
	
	# Add a new Entry to the queue
	def Schedule(task,time)
		# We are given the number of seconds from now to execute the task
		# Convert that from a relative to an absolute time
		systemEpochTime = Time.now.to_i
		absoluteTime = systemEpochTime + time
		
		newEntry = Entry.new(task,absoluteTime)
		
		@queue.push(newEntry)
		@queue.sort! {|x,y| x.executionTime <=> y.executionTime}
	end
	
	def Execute()
		puts ("Executing tasks in queue...")
		
		while (@queue.count > 0)
			systemEpochTime = Time.now.to_i
			nextTaskTime = @queue[0].executionTime
			timeToNextTask = nextTaskTime - systemEpochTime
			
			if (timeToNextTask > 0)
				sleep(timeToNextTask)
			end
				
			@queue[0].taskToExecute.call
			@queue.delete_at(0)
		end
		
		puts ("Queue is now empty")
	end
	
end

# Test the operation of the Scheduler class
taskOne = Proc.new {
	puts ("Hello, World!")
	$myScheduler.Schedule(taskOne,1.0)}
taskTwo = Proc.new {puts ("Two")}
taskThree = Proc.new {puts ("Three")}

$myScheduler = Scheduler.new
$myScheduler.Schedule(taskOne,1.0)
$myScheduler.Schedule(taskTwo,4.0)
$myScheduler.Schedule(taskThree,8.0)
$myScheduler.Execute()
 

