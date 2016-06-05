# Effective Python
# 012 - Avoid else blocks after for a while loops

# Python lets you have an else block following a LookupError
for i in range(3):
	print (i)
else:
	print ("Else")
	
# Break statements will skip the else block
for i in range(3):
	print (i)
	if i == 1:
		break
else:
	print ("Else")
	
# Else runs immediately when an empty list is evaluated 
# or when a while loop is False

for x in []:
	print ("Nope")
else:
	print ("Yep")
	
while False:
	print ("Nu-uh")
else:
	print ("Yep yep")