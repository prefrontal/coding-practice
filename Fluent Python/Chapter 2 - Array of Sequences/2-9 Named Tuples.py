# Example 2-9
# Named tuples

from collections import namedtuple

City = namedtuple('City', 'name coordinates')

tokyo = City('Tokyo', (35.689, 139.691))

print(tokyo)
print(tokyo.name)
print(tokyo.coordinates)