#!/bin/python
f = open('firmware.bin', 'rb')
coe = open('firmware.coe', 'w')
hexlist = ["{:02x}".format(c) for c in f.read()]
s = ""
l = 2
if(len(hexlist)%l!=0):
    exit(1)
for x in range(int(len(hexlist)/l)+1): 
    tf = hexlist[l*(x-1):l*x]
    tf.reverse()
    if (x > 1): s += ","
    s += ''.join(x for x in tf)
coe.write("""memory_initialization_radix=16;
memory_initialization_vector=""" + s + ";")
