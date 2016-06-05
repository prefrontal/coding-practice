# Effective Python
# 010 - Prefer enumerate instead of range

letter_list = ['a', 'b', 'c', 'd']

# Range example
for i in range(len(letter_list)):
	letter = letter_list[i]
	print (letter)
	
# Enumerate example
for i,letter in enumerate(letter_list):
	print (i, letter)

# Enumerate example with start number
for i,letter in enumerate(letter_list,1):
	print (i, letter)