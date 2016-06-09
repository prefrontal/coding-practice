# Effective Python
# 017 - Be defensive when iterating over arguments

# Normalize some data

def normalize(numbers):
	total = sum(numbers)
	result = []
	for value in numbers:
		percent = 100 * value / total
		result.append(percent)
	return result

visits = [15, 35, 80]
percentages = normalize(visits)
	
# This function will work fine with a list, but will break with a generator
# An iterator only produces results a single time

def read_visits(data_path):
	with open(data_path) as f:
		for line in f:
			yield int(line)
			
it = read_visits('my_numbers.txt')
percentages = normalize(it)

# You could make a copy of the list around, that works but takes a lot of memory

def normalize_copy(numbers):
	numbers = list(numbers)
	total = sum(numbers)
	result = []
	for value in numbers:
		percent = 100 * value / total
		result.append(percent)
	return result
	
it = read_visits('my_numbers.txt')
percentages = normalize_copy(it)

# Another option is to accept a function that returns a new iterator each time
# This is pretty clumsy though

def normalize_func(get_iter):
	total = sum(get_inter())
	result = []
	for value in get_iter():
		percent = 100 * value / total
		result.append(percent)
	return result
	
percentages = normalize_func(lambda: read_visits(path))

# The best option is to have a container class that implements the iterator protocol
# This provides a new iterator for each caller

class ReadVisits(object):
	def __init__(self, data_path):
		self.data_path = data_path
		
	def __iter__(self):
		with open(self.data_path) as f:
			for line in f:
				yield int(line)
				
visits = ReadVisits(path)
percentages = normalize(visits)

# You should code defensively to test that inputs are actually containers
# Iterators passed in just return themselves when __iter__ is called

def normalize_defensive(numbers):
	if iter(numbers) is iter(numbers):
		raise TypeError('Must supply a container!')
	total = sum(numbers)
	result = []
	for value in numbers:
		percent = 100 * value / total
		result.append(percent)
	return result