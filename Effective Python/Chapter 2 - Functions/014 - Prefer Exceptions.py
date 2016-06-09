# Effective Python
# 014 - Prefer exceptions to returning None

# It seems really convenient to return None from a method

def divide(a, b):
	try:
		return a/b
	except ZeroDivisionError:
		return None
		
# The flexible interpretation of None can be a problem
# Perhaps a tuple could be better?

def divide (a, b):
	try:
		return True, a/b
	except ZeroDivisionError:
		return False, None
		
# This is better, but the caller can ignore the status result
# Using an exception is generally best

def divide (a, b):
	try:
		return a/b
	except ZeroDivisionError as e:
		raise ValueError('Invalid inputs') from e