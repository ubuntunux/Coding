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
blockPoint = '#'
checkPattern = [(0, -1), (-1, 0), (1, 0), (0, 1)]
        
getEnableCheckPoint datas (cX, cY) checkedList = do
    (x,y) <- checkPattern
    let 
        sumX = (x + cX)
        sumY = (y + cY)
        numLines = length datas
        character = (datas !! sumY) !! sumX
    guard (
        cY >=0 && cY < numLines && cX >= 0 && cX < length (datas !! cY) &&
        not (elem (sumX, sumY) checkedList) &&
        sumY >= 0 && sumY < numLines &&
        sumX >= 0 && sumX < length (datas !! sumY) &&
        character /= startPoint && character /= blockPoint
        )
    return (sumX, sumY)

findStartPoint datas num
    | index /= Nothing = Just (num, n)
    | length datas <= num = Nothing
    | otherwise = findStartPoint datas (num + 1)
    where
        index = elemIndex startPoint (datas !! num)
        Just n = index
    
findEndPoint datas (x,y) checkedList = result
    where
        patterns = getEnableCheckPoint datas (x,y) checkedList
        isEndPoint datas (x, y) = (datas !! y) !! x == endPoint
        result =
            foldr
                (\(x, y) acc ->
                    if isEndPoint datas (x, y)
                    then Just (x, y)
                    else case acc of
                        Nothing -> findEndPoint datas (x,y) (patterns ++ checkedList)
                        otherwise -> acc)
                Nothing
                patterns
        
checkTheMaze =
    fmap
        (\maze -> do
            startPoint <- findStartPoint maze 0
            findEndPoint maze startPoint [])
        [data1, data2, data3, data4, data5, data6]