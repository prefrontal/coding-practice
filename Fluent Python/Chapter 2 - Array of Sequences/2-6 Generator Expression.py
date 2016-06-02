# Example 2-6
# Cartesian product using a generator expression

colors = ['black', 'white']
sizes = ['S', 'M', 'L']

for tshirt in ('%s %s' % (c, s) for c in colors for s in sizes):
	print(tshirt)