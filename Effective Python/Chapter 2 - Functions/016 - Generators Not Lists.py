# Effective Python
# 016 - Consider generators instead of returning lists

# Example returning a list

def index_words(text):
	result = []
	if text:
		result.append(0)
	for index, letter in enumerate(text):
		if letter == ' ':
			result.append(index+1)
	return result
	
address = 'Four score and seven years ago'
result = index_words(address)

# A generator function that produces the same results

def index_words_iter(text):
	if text:
		yield 0
	for index, letter in enumerate(text):
		if letter == ' ':
			yield index + 1
			
result = list(index_words_iter(address))

# This pattern can be useful for opening large text files