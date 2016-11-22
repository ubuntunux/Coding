import Data.List
import Control.Monad

data1 = lines "<     >"

data2 = lines
    "########\n\
    \#<     #\n\
    \#> ##  #\n\
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

getEnableCheckPoint datas curPoint checkedList =
    filter (\(x, y) -> 
        let
            sumX = (x + fst curPoint)
            sumY = (y + snd curPoint)
        in
            not (elem (sumX, sumY) checkedList) &&
            sumY >= 0 && sumY < length (datas) &&
            sumX >= 0 && sumX < length (datas !! sumY))
        checkPattern
        
findStartPoint datas num
    | index /= Nothing = Just (num, n)
    | length datas <= num = Nothing
    | otherwise = findStartPoint datas (num + 1)
    where
        index = elemIndex startPoint (datas !! num)
        Just n = index

findEndPoint datas curPoint@(x,y) checkedList = do
    (pX, pY) <- getEnableCheckPoint datas curPoint checkedList
    let
        sX = (x + pX)
        sY = (y + pY)
    if (datas !! sY) !! sX == '>' then [(True, (sX, sY))] else [(False, (sX, sY))]

