import Numeric (showFFloat)

main = do
    s1 <- getLine 
    s2 <- getLine
    let 
        pos1 = count '+' s1 - count '-' s1
        pos2 = count '+' s2 - count '-' s2 
        n = count '?' s2
    putStrLn $ showFFloat Nothing (prob pos1 n pos2) ""

count :: Eq a => a -> [a] -> Int
count e = length.(filter (==e))  

prob :: Int -> Int -> Int -> Float
prob pos1 0 pos2 = if pos1 == pos2 then 1 else 0
prob pos1 n pos2 
    | n < abs (pos1 - pos2) = 0
    | otherwise = (prob pos1 (n-1) (pos2+1) + prob pos1 (n-1) (pos2-1))/2
