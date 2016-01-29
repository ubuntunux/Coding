def balance(weights, left, right):
    weight = weights.pop()
    # find closed number with weight
    closedValue = min([(999, 0)] + [(abs(weight-x), x) for x in weights])[1]
    weights.remove(closedValue)
    #print("left, right, weight, closedValue", left, right, weight, closedValue)
    if left > right:
        left += min(weight, closedValue)
        right += max(weight, closedValue)
    else:
        left += max(weight, closedValue)
        right += min(weight, closedValue)
    if len(weights) != 0:
        return balance(weights, left, right)    
    return (left, right) if left < right else (right, left)

while True:
  # input count and weights
  count = int(input("Input Count : "))
  array = []
  for x in range(count):
    array.append(max(1, min(450, int(input("%d. Input weight : " % (x+1))))))
  # make even length
  if len(array) % 2 == 1:
      array.append(0)
  # show result
  print("Result : %d %d\n" % balance(array, 0, 0))
