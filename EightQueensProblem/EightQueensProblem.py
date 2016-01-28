n=0
size = 8
full = (2**size)-1
def bitToStr(num):
	s = str(bin(num))[2:]
	return (size - len(s)) * "0" + s
	
def queens(parentMask, lMask, rMask, depth, result):
	mask = full & (parentMask | lMask | rMask)
	for i in range(size):
		q = 1 << i
		# safe
		if q & mask == 0:
			nextMask = parentMask | q
			nextlMask = full & ((lMask | q) << 1)
			nextrMask = full & ((rMask | q) >> 1)
			#print(str(depth) + " " + bitToStr(q) + " & " + bitToStr(mask) + " >> " +bitToStr(nextMask))

			if nextMask == full:
				print("\n".join(result+[bitToStr(q)]) + "\n")
				global n
				n+=1
				return
			else:
				queens(nextMask, nextlMask, nextrMask, depth+1, result+[bitToStr(q)])
queens(0, 0, 0, 0, [])
print(n)
		
