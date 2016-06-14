# Effective Python
# 020 - Use None and Docstrings to specify dynamic default arguments

# In the following function, the datetime call will only be made once

	def log(message, when=datetime.now()):
		print('%s: %s' % (when, message))
	
# The best practice is to use None and then drop a default value in later
# You really, really need to document this behavior in the docstring

	def log(message, when=None):
		when = datetime.now() if when is None else when
		print('%s: %s' % (when, message))
	
# This goes for assignments as well. The following only yields one dictionary

	def decode(data, default={}):
		try:
			return json.loads(data)
		except ValueError:
			return default
		
# So, use the same trick as above

	def decode(data, default=None):
		if default is None:
			default = {}
		try:
			return json.loads(data)_
		except ValueError:
			return default
		
		