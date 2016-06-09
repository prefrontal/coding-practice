# Effective Python
# 018 - Reduce visual noise with variable positional arguments

# Sometimes you want more than one argument, but it is only occasionally used
# This leads to visual noise

def log(message, values):
	if not values:
		print(message)
	else:
		values_str = ', '.join(str(x) for x in values)
		print('%s: %s' % (message, values_str))
		
log('My numbers are', [1, 2])
log('Hi there', [])

# Variable arguments make this much more straightforward

def log(messages, *values):
	if not values:
		print(message)
	else:
		values_str = ', '.join(str(x) for x in values)
		print('%s: %s' % (message, values_str))

log('My numbers are', *[1, 2])
log('My numbers are', 1, 2)
log('Hi there')

# Generators, when dropped in as an argument, will be exhausted

def my_generator():
	for i in range(10:
		yield i
		
def my_func(*args)
	print args
	
it = my_generator()
my_func(*it)