import Data.Char
import Data.Set

generated n = n + sum([digitToInt x | x <- show(n)])

self_numbers xs = toAscList result
    where result = difference (fromDistinctAscList xs) (fromDistinctAscList [generated(x) | x <- xs])

main = do 
    num <- getLine
    print $ sum $ self_numbers [1..(read(num)::Int)] 
