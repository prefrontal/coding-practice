# Effective Python
# 021 - Enforce clarity with keyword-only arguments

# You can mandate that calls to a function use keywords
# This requires use of a * symbol in the function definition

	def safe_division(number, divisor, *, ignore_overflow=False, ignore_zero=False)

# This is now an error

	safe_division(1, 500, True, False)
	
# This works though

	safe_division(1, 0, ignore_zero=True)
	
# You can also do this is Python 2, but it is more complicated