import os
import time
from subprocess import Popen

devnull = open(os.devnull, 'wb')

p = [] # ip -> process
for n in range(1, 255): # start ping processes
    ip = "10.0.1.%d" % n
    p.append((ip, Popen(['ping', '-c', '3', ip], stdout=devnull)))
    #NOTE: you could set stderr=subprocess.STDOUT to ignore stderr also

while p:
    for i, (ip, proc) in enumerate(p[:]):
        if proc.poll() is not None: # ping finished
            p.remove((ip, proc)) # this makes it O(n**2)
            if proc.returncode == 0:
                print('%s active' % ip)
            #elif proc.returncode == 2:
            #    print('%s no response' % ip)
            #else:
            #    print('%s error' % ip)
    time.sleep(.04)
devnull.close()