checkPattern = [(0, -1), (-1, 0), (1, 0), (0, 1)]
checkedFlag = "o"

def checkNode(datas, x, y):
    datas[y][x] = checkedFlag
    for pattern in checkPattern:
        coord = (x + pattern[0], y + pattern[1])
        if (0 <= coord[1] < len(datas)) and (0 <= coord[0] < len(datas[coord[1]])):
            data = datas[coord[1]][coord[0]]
            #### DEBUG START
            print("")
            datas[y][x] = "*"
            datas[coord[1]][coord[0]] = "?"
            for line in datas:
                print("".join(line))
            datas[y][x] = checkedFlag
            datas[coord[1]][coord[0]] = checkedFlag
            #### END OF DEBUG
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
        
#-------------------#
# Test
#-------------------#
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

data4="""<   #   >"""

data5 = """########
#<     #
#     ##
#    #>#
########"""

data6 = """#< #  #
#  #  #
#  # >#"""

isPossible(data1)
isPossible(data2)
isPossible(data3)
isPossible(data4)
isPossible(data5)
isPossible(data6)