# Effective Python
# 013 - Take advantage of each block in try/except/else/finally

# Incomplete example of reading JSON data
def example_mthod (path):
	handle = open(path, 'r+')
	try:
		data = handle.read()
		op = json.loads(data)
		value = (op['numerator'] / op['denominator'])
	except ZeroDivisionError as e:
		return UNDEFINED
	else:
		op['result'] = value
		result = json.dumps(op)
		return value
	finally:
		handle.close()