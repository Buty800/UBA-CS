cd :: Int -> [Int] -> Int
cd k [] = if k < 0 then -1000000000 else 0 
cd k (p:ps) = max (cd k ps) (p + cd (k-p) ps)


ss :: [Int] -> Int -> Bool
ss [] k = k == 0
ss (x:xs) k = ss xs k || ss xs (k-x)

ss' :: [Int] -> [Int] -> Int -> [[Int]]
ss' curr [] k = if k==0 then [curr] else []
ss' curr (x:xs) k = ss' curr xs k ++ ss' (x:curr) xs (k-x)

subsetsums :: [Int] -> Int -> [[Int]]
subsetsums = ss' []