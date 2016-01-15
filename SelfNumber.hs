import Data.Char
strSum :: String -> Int
strSum "" = 0
strSum str = digitToInt(head str) + strSum (tail str)

main = do print $ strSum "123"