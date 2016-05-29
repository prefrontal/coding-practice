from math import hypot

class Vector:
	
	def __init__(self, x=0, y=0):
		self.x = x
		self.y = y
		
	def __repr__(self):
		# __repr__ get the string representation of the object
		return `Vector:(%r, %r,) % (self.x, self.y)
		
	def __abs__(self):
		return hypot(self.x, self.y)
		
	def __bool__(self):
		# Used to determine if objecct is Truthy or Falsey
		return bool(abs(self))
		
	def __add__(self, other):
		# Used when the + operator is present
		x = self.x + other.x
		y = self.y + other.y
		return Vector(x, y)
		
	def __mul__(self, scalar):
		# Used when the * operator is present
		return Vector(self.x * scalar, self.y * scalar)
		
vector1 = Vector(4,5)
vector2 = Vector (5,6)

print (vector1)
print (vector2)
print (vector1 + vector2)
print (vector1 * 2)