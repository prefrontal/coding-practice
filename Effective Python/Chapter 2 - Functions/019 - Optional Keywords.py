# Effective Python
# 019 - Provide optional behavior with keyword arguments

# You can use keywords instead of positional arguments

	def remainder (number, divisior):
		return number % divisor
	
	remainder(20, 7)
	remainder(20, divisor=7)
	remainder(number=20, divisor=7)
	remainder(divisor=7, number=20)

# Positional argument must come before keywords
# The following is an error

	remainder(number=20, 7)
	
# Keywords can have a default value, which makes it optional

	def flow_rate(weight_diff, time_diff, period=1)
		return (weight_diff / time_diff) * period
		
# Best practice is to always specify by keyword for clarity