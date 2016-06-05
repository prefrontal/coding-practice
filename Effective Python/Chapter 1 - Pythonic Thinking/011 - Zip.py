# Effective Python
# 011 - Use zip to process iterators in parallel

names = ['Cecilia', 'Lise', 'Marie', 'Michael']
letters = [len(n) for n in names]

# Using enumerate to find longest name
longest_name = None
max_letters = 0

for i,name in enumerate(names):
	count = letters[i]
	if count > max_letters:
		longest_name = name
		max_letters = count
		
print (longest_name, max_letters)
		
# Using zip to find longest name
for name,count in zip(names,letters):
	if count > max_letters:
		longest_name = name
		max_letters = letters
	
print (longest_name, max_letters)
	
# With three lists
letters2 = [len(n)+1 for n in names]

for name,count1,count2 in zip(names,letters, letters2):
	print (name, count1, count2)