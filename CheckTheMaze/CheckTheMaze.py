checkPattern = [(0, -1), (-1, 0), (1, 0), (0, 1)]
checkedFlag = "o"

def checkNode(datas, x, y):
    datas[y][x] = checkedFlag
    for pattern in checkPattern:
        coord = (x + pattern[0], y + pattern[1])
        if (0 <= coord[1] < len(datas)) and (0 <= coord[0] < len(datas[coord[1]])):
            data = datas[coord[1]][coord[0]]
            if data != checkedFlag:                
                if data == ">": 
                    print("Found '>' at", coord)
                    return True
                elif data == " ":
                    result = checkNode(datas, coord[0], coord[1])
                    if(result):
                        return True
    return False
    
def isPossible(data):
    lines = data.split("\n")
    datas = []
    sX, sY = 0, 0
    for y in range(len(lines)):
        datas.append([])
        for x in range(len(lines[y])):
            datas[y].append(lines[y][x])
            if lines[y][x] == "<":
                sX, sY = x, y                    
    if not checkNode(datas, sX, sY):
        print("Not found.")
    
# Run!!
data1="""<     >"""

data2="""########
#<     #
#  ##  #
#  ##  #
#     >#
########"""

data3="""#######
#<    #
##### #
#     #
# #####
# #   #
# # # #
#   #>#
#######"""

isPossible(data1)
isPossible(data2)
isPossible(data3)