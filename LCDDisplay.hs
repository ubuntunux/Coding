import Data.Char (digitToInt)

material = ["   ", " - ", "|  ", "| |", "  |"]
numToDigit = [[1, 3, 0, 3, 1], [0, 4, 0, 4, 0], [1, 4, 1, 2, 1], [1, 4, 1, 4, 1], [0, 4, 1, 4, 0], [1, 2, 1, 4, 1], [1, 2, 1, 3, 1], [1, 4, 0, 4, 0], [1, 3, 1, 3, 1], [1, 3, 1, 4, 0]]

chain xs n
    | n == 0 = []
    | otherwise = xs ++ (chain xs (n-1))

showDigit size num = [getMaterial curDigitNum i | i <- [0..4], curDigitNum <- digitNums]
    where
        digitNums = [digitToInt n |  n <- show num]
        getMaterial digitNum i = (numToDigit !! digitNum) !! i
    
            

-- Run
main = do mapM_ print $ showDigit 2 12345