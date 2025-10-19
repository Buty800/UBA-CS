module ParcialViejo where 

-- 1
suma :: (Num t) => [t] -> t
suma [] = 0 
suma (x:xs) = x + (suma xs)

golesDeNoGoleadores :: [(String,String)]->[Int]->Int->Int
golesDeNoGoleadores _ goles totalGoles = totalGoles - (suma goles) 

-- 2

unZip :: [(t,t)] -> [t]
unZip ((a,b):[]) = a:b:[]
unZip ((a,b):xs) = a:b:(unZip xs) 

pertenece ::(Eq t) => t -> [t] -> Bool
pertenece x [] = False
pertenece x (y:ys) = x == y || pertenece x ys

tieneReps ::(Eq t) => [t] -> Bool
tieneReps [] = False
tieneReps (x:xs) = (pertenece x xs) || tieneReps xs 

equiposValidos :: [(String,String)]->Bool
equiposValidos goleadoresPorEquipo = not (tieneReps (unZip goleadoresPorEquipo))

-- 3

indx :: [t] -> Int -> t
indx x i = iter i x 0
    where 
        iter i (x:xs) j | i == j = x
                        | otherwise = iter i xs (j+1)

indxof ::(Eq t) => t -> [t] -> Int
indxof x y = iter x y 0
    where
        iter x (y:ys) i | x == y = i
                      | otherwise = iter x ys (i+1)

porcentajeDeGoles :: String -> [(String,String)] -> [Int] -> Float
porcentajeDeGoles goleador goleadoresPorEquipo goles = golesGoleador / fromIntegral (suma goles)
    where
        takesnd ((a,b):[]) = [b]
        takesnd ((a,b):xs) = b:(takesnd xs)
        goleadores = takesnd goleadoresPorEquipo 
        golesGoleador = fromIntegral (indx goles (indxof goleador goleadores))

-- 4 

maximo :: (Ord t) => [t] -> t
maximo (x:[]) = x
maximo (x:xs) | x >= (maximo xs) = x
              | otherwise = maximo xs

botinDeOro :: [(String,String)] -> [Int] -> String 
botinDeOro goleadoresPorEquipo goles = snd (indx goleadoresPorEquipo maxgoles)
    where maxgoles = indxof (maximo goles) goles