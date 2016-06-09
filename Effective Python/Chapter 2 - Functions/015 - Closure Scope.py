# Effective Python
# 015 - Know how closures ineract with variable scope

# Closures are a handy way to conduct small operations

def sort_priority(values, group):
	
	def helper(x):
		if x in group:
			return (0, x)
		return (1, x)
		
	values.sort(key=helper)
	
# Now, what if you want to track a value during the sort?
# It looks like this will work, but it won't:
	
def sort_priority2(values, group):
	found = False
	
	def helper(x):
		if x in group:
			found = True
			return (0, x)
		return (1, x)
	values.sort(key=helper)
	
	return found
	
# Closures have a different scope, which means that the found
# assignment is made to a new variable in the closure scope

# One way to get the data out is the keyword 'nonlocal'
# This can be considered an anti-pattern for complex closures

def sort_priority3(values, group):
	found = False
	
	def helper(x):
		nonlocal found
		if x in group:
			found = True
			return (0, x)
		return (1, x)
	values.sort(key=helper)
	
	return found
	
# Another option is to use a helper class

class Sorter(object):
	def __init__(self,group):
		self.group = group
		self.found = False
		
	def __call__(self,x):
		if x in self.group:
			self.found = True
			return (0, x)
		return (1, x)
		
sorter = Sorter(group)
numbers.sort(key=sorter)
assert sorter.found is True