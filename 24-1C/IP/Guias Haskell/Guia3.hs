--Ej 1

f :: Int -> Int 
f 1 = 8
f 4 = 131
f 16 = 16

g :: Int -> Int
g 8 = 16
g 16 = 4
g 131 = 1

h :: Int -> Int
h n = f (g n)

k :: Int -> Int
k n = g (f n)

--Ej 2

absoluto :: Int -> Int
absoluto n = if n > 0 then n else -n

maximoabsoluto :: Int -> Int -> Int
maximoabsoluto a b = max (absoluto a) (absoluto b)

maximo3 :: Int -> Int -> Int -> Int
maximo3 a b c = max (max a b) c

algunoEs0 :: Float -> Float -> Bool
algunoEs0 a b = a == 0 || b == 0

ambosSon0 :: Float -> Float -> Bool
ambosSon0 a b = a == 0 && b == 0

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo a b = (a <= 3 && b <= 3) || (a > 7 && b > 7) || (a <= 7 && b <= 7 && a > 3 && b > 3)  

sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos a b c | (a == b) && (a == c) && (b == c) = 0
                    | (a == b) = c
                    | (a == c) = b
                    | (b == c) = a
                    | otherwise = a + b + c

esMultiploDe :: Int -> Int -> Bool
esMultiploDe a b = mod a b == 0 

digitoUnidades :: Int -> Int
digitoUnidades n = abs(n) - 10 * (div (abs n) 10)

digitoDecenas :: Int -> Int 
digitoDecenas n = digitoUnidades (div (abs n) 10)

--Ej 3

--Ej 4 

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt p1 p2 = fst p1 * fst p2 + snd p1 * snd p2

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor p1 p2 = fst p1 < fst p2 && snd p1 < snd p2

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos p1 p2 = sqrt (((fst p1 - fst p2) ** 2)  + ((snd p1 - snd p2) ** 2))

posPrimerPar :: (Int,Int,Int) -> Int
posPrimerPar (x,y,z) | mod x 2 == 0 = 1
                     | mod y 2 == 0 = 2
                     | mod z 2 == 0 = 3
                     | otherwise = 4

--Ej 6

bisiesto :: Int -> Bool
bisiesto year = not (mod year (4) /= 0 || (mod year (100) == 0 && mod year (400) /= 0))

--Ej 7

distanciaManhattan:: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (x1,y1,z1) (x2,y2,z2) = abs (x1-y1) + abs(y1-y2) + abs(z1-z2) 

--Ej 8

sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos n = digitoDecenas n + digitoUnidades n

comparar :: Int -> Int -> Int
comparar x y = sign (sumaUltimosDosDigitos (x) - sumaUltimosDosDigitos (y))






-- auxiliar
sign :: (Real a) => a -> Int
sign x = if x > 0 then 1 else if x < 0 then -1 else 0
