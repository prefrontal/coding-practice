# Effective Python
# 023 - Accept functions for simple interfaces instead of classes

# Hook that logs each time a key is missing and returns 0 for the default value

def log_missing():
	print('Key added')
	return 0
	
current = {'green':12, 'blue':3}
increments = [
	('red', 5),
	('blue', 17),
	('orange', 9)
]

result = defaultdict(log_missing, current)
print('Before:', dict(result))

for key, amount in increments:
	result[key] += amount

print('After', dict(result))

# Helper function using a stateful closure as the default value hook
# This maintains state across successive calls

def increment_with_report(current, increments):
	added_count = 0
	
	def missing():
		nonlocal added_Count	# stateful closure
		added_count += 1
		return 0
		
	result - defaultdict(missing, current)
	for key, amount in increments:
		result[key] += amount
		
	return result, added_count
	
# You could use a small class to do the same thing

class CountMissing(object):
	def __init__(self):
		self.added = 0
		
	def missing(self):
		self.added += 1
		return 0
		
# Using the __call__ method allows an object to be called like a method

class BetterCountMissing(object):
	def __init__(self):
		self.added = 0
		
	def __call__(self):
		self.added += 1
		return
		
counter = BetterCountMIssing()
counter()
assert callable(counter)

