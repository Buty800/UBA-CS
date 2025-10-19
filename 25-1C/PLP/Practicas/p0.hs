-- 2 

valorAbsoluto :: Float -> Float
valorAbsoluto n | n > 0 = n
                | otherwise = -n

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

--cantDivisoresPrimos :: Int -> Int

--3
inverso :: Float -> Maybe Float
inverso 0 = Nothing 
inverso n = Just (1/n) 

aEntero :: Either Int Bool -> Int
aEntero (Left n) = n 
aEntero (Right True) = 1
aEntero (Right False) = 0

--4
limpiar :: String -> String -> String
limpiar l s = foldl limpiarCaracter s l
    where limpiarCaracter s c = filter (c/=) s


difPromedio :: [Float] -> [Float]
difPromedio l = map (-promedio+) l
    where promedio = sum l / fromIntegral (length l)


todosIguales :: [Int] -> Bool
todosIguales (_:[]) = True
todosIguales (x:xs) = (x == head xs) && todosIguales xs

--5
data AB a = Nil | Bin (AB a) a (AB a)

vacioAB :: AB a -> Bool
vacioAB Nil = True
vacioAB _ = False

negacionAB :: AB Bool -> AB Bool
negacionAB Nil = Nil
negacionAB (Bin l v r) = Bin (negacionAB l) (not v) (negacionAB r) 

productoAB :: AB Int -> Int
productoAB Nil = 1
productoAB (Bin l v r) = v * (productoAB l) * (productoAB r)





buscar :: Eq a => a -> AB (a, b) -> Maybe b
buscar _ Nil = Nothing
buscar k (Bin r (c,v) l)| k == c = Just v
                        | not (null ls) = ls
                        | otherwise = rs
    where   ls = buscar k l
            rs = buscar k r
