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

getEnableCheckPoint::(Foldable t, Foldable t1) => [t1 a] -> (Int, Int) -> t (Int, Int) -> [(Int, Int)]
getEnableCheckPoint datas curPoint checkedList =
    [(sumX, sumY) | (x,y) <- checkPattern, 
        let sumX = (x + fst curPoint)
            sumY = (y + snd curPoint),
        not (elem (sumX, sumY) checkedList) && sumY >= 0,
        sumY < length (datas) && sumX >= 0,
        sumX < length (datas !! sumY)]
        
getEnableCheckPoint' datas curPoint checkedList = do
    (x,y) <- checkPattern
    let 
        sumX = (x + fst curPoint)
        sumY = (y + snd curPoint)
    guard (not (elem (sumX, sumY) checkedList) && sumY >= 0)
    guard (sumY < length (datas) && sumX >= 0)
    guard (sumX < length (datas !! sumY))
    return (sumX, sumY)

findStartPoint'::[String] -> Int -> Maybe (Int, Int)
findStartPoint' datas num
    | index /= Nothing = Just (num, n)
    | length datas <= num = Nothing
    | otherwise = findStartPoint' datas (num + 1)
    where
        index = elemIndex startPoint (datas !! num)
        Just n = index
        
findStartPoint datas = findStartPoint' datas 0


isEndPoint datas (x,y) = (datas !! y) !! x == '>'


findEndPoint' datas curPoint@(x,y) checkedList =  
    let patterns = getEnableCheckPoint datas curPoint checkedList
        (results, points) = foldr (\(x, y) (accA, accB) ->
            let result = isEndPoint datas (x, y)
            in (result:accA, (x, y):accB)) ([],[]) patterns
        result = elemIndex True results
        Just index = result
    in if result /= Nothing then show (points !! index) else concat (map (\nextPoint->findEndPoint' datas nextPoint (patterns ++ checkedList)) patterns)
