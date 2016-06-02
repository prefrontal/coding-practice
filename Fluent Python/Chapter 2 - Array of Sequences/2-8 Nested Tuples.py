# Example 2-8
# Nested tuple unpacking

metro_areas = [
	('Tokyo', (35.589722, 139.691667)),
	('Sao Paulo', (-23.547778, -46.635833))
]

for name, (latitude, longitude) in metro_areas:
	print(name, latitude, longitude)