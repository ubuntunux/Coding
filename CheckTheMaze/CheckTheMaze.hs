import Data.List
import Control.Monad

data1 = lines "<     >"

data2 = lines
    "########\n\
    \#<     #\n\
    \#  ##  #\n\
    \#  ##  #\n\
    \#     >#\n\
    \########"

data3 = lines
    "#######\n\
    \#<    #\n\
    \##### #\n\
    \#     #\n\
    \# #####\n\
    \# #   #\n\
    \# # # #\n\
    \#   #>#\n\
    \#######"

data4 = lines "<   #   >"

data5 = lines
    "########\n\
    \#<     #\n\
    \#     ##\n\
    \#    #>#\n\
    \########"

data6 = lines
    "#< #  #\n\
    \#  #  #\n\
    \#  # >#"
    
startPoint = '<'
endPoint = '>'
checkedList = [()]
checkPattern = [(0, -1), (-1, 0), (1, 0), (0, 1)]

findStartPoint datas num
    | index /= Nothing = Just (num, n)
    | length datas <= num = Nothing
    | otherwise = findStartPoint datas (num + 1)
    where
        index = elemIndex startPoint (datas !! num)
        Just n = index


