# Effective Python
# 025 - Initialize parent classes with super

# You can directly call the __init__ method of a parent class

class MyBaseClass(object):
	def __init__(self, value):
		self.value = value
		
class MyChildClass(MyBaseClass):
	def __init__(self):
		MyBaseClass.__init__(self, 5)
		
# Directly calling __init__ can break multiple inheritance
# Calling super is a much better solution. Here it is in Python 3

class Explicit(MyBaseClass):
	def __init__(self, value):
		super(__class__, self).__init__(value * 2)
		
class Implicit(MyBaseClass):
	def __init__(self, value):
		super().__init__(value * 2)

