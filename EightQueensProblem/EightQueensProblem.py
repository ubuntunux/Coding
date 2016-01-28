SIZE = 8
FULL_BIT_FLAG = (2**SIZE) - 1 # 8bit example => 11111111

def queens(accMask, leftMask, rightMask, acc_result, total_result):
    mask = FULL_BIT_FLAG & (accMask | leftMask | rightMask)
    for i in range(SIZE):
        q = 1 << i
        # safe
        if q & mask == 0:
            nextAccMask = accMask | q
            nextlLeftMask = (leftMask | q) << 1
            nextrRightMask = (rightMask | q) >> 1
            result = acc_result + [q]
            # problem solved
            if nextAccMask == FULL_BIT_FLAG:
                total_result.append(result)
                return
            else:
                queens(nextAccMask, nextlLeftMask, nextrRightMask, result, total_result)
    return total_result

# problem resolve    
final_result = queens(0, 0, 0, [], [])

# show
for result in final_result:
    # number to bit flag string
    print("\n".join(["{0:b}".format(num).zfill(SIZE) for num in result]) + "\n")
        
print("Total answer count : %d" % len(final_result))