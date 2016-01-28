def balance(weights, left, right):
	weight = weights.pop()
	closedValue = 0
	minDiff = 999
	for x in weights:
		diff = abs(weight - x)
		if diff < minDiff:
			minDiff = diff
			closedValue = x
	left += weight
	right += closedValue
	weights.remove(closedValue)
	if len(weights) != 0:
		return balance(weights, left, right)	
	return (left, right) if left < right else (right, left)

count = int(input("Input Count : "))
array = [max(1, min(450, int(input("%d. Input weight : " % (x+1))))) for x in range(count)]

if len(array) % 2 == 1:
	array.append(0)
	
print(balance(array, 0, 0))