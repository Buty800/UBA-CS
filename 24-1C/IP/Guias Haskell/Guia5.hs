--Ej 1

longitud :: [t] -> Int 
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

ulitmo :: [t] -> t
ulitmo (x:[]) = x
ulitmo (x:xs) = ulitmo xs

principio :: [t] -> [t]
principio (x:[]) = []
principio  (x:xs) = x:principio xs

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = (reverso xs) ++ [x]

--Ej 2
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) = e == x || pertenece e xs

todosIguales:: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales (_:[]) = True
todosIguales (x:xs) = x == (head xs) && todosIguales xs

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) = (not (pertenece x xs)) && todosDistintos xs

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs)= pertenece x xs || hayRepetidos xs

quitar :: (Eq t) => t-> [t] -> [t]
quitar _ [] = []
quitar y (x:xs)  
    | y == x = xs
    | otherwise = x:(quitar y xs)

quitarTodos :: (Eq t) => t-> [t] -> [t]
quitarTodos _ [] = []
quitarTodos y (x:xs) 
    | y == x = quitarTodos y xs
    | otherwise = x:(quitarTodos y xs)

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = (x:eliminarRepetidos (quitarTodos x xs))

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [] y = False
mismosElementos x [] = False
mismosElementos (x:xs) y = pertenece x y && mismosElementos (quitarTodos x xs) (quitarTodos x y) 

capicua :: (Eq t) => [t] -> Bool
capicua x = x == reverso x

--Ej 3

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

maximo :: [Int] -> Int
maximo (x:[]) = x
maximo (x:xs) = max x (maximo xs)

sumarN :: Int -> [Int] -> [Int]
sumarN _ [] = []
sumarN n (x:xs) = (x+n):(sumarN n xs)

sumarElPrimero :: [Int] -> [Int]
sumarElPrimero (x:xs) = sumarN x (x:xs)

sumarElUltimo :: [Int] -> [Int]
sumarElUltimo x = sumarN (ulitmo x) x

pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) 
    | mod x 2 == 0 = x:(pares xs)
    | otherwise = pares xs

multiplosDeN :: Int -> [Int] -> [Int]
multiplosDeN n [] = []
multiplosDeN n (x:xs) 
    | mod x n == 0 = x:(multiplosDeN n xs)
    | otherwise = multiplosDeN n xs

ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar x = maxl:(ordenar(quitar maxl x))
    where maxl = maximo x

--Ej 4
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:[]) = [x]
sacarBlancosRepetidos (x:y:xs) 
    | x == y && x == ' ' = sacarBlancosRepetidos (y:xs)
    | otherwise = x:sacarBlancosRepetidos (y:xs)


contarPalabras :: [Char] -> Int
contarPalabras [] = 0
contarPalabras (x:[]) = 1
contarPalabras (x:y:xs) 
    | x == ' ' && y /= x = 1 + contarPalabras (y:xs)
    | otherwise = contarPalabras (y:xs)


palabras :: [Char] -> [[Char]]
palabras [] = [[]]
palabras (x:[]) 
    | x /= ' ' = [[x]]
    | otherwise = [[]]
palabras (x:xs) 
    | x /= ' ' = addToHead x (palabras xs)
    | head xs /= ' ' = []:(palabras xs)
    | otherwise = palabras xs
    where 
        addToHead :: t -> [[t]] -> [[t]]
        addToHead e (x:xs) = (e:x):xs

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga x = maxLength (palabras x)
    where
        maxLength (x:[]) = x
        maxLength (x:xs) 
            | (longitud x) > (longitud (maxLength xs)) = x 
            | otherwise = maxLength xs

aplanar :: [[Char]] -> [Char]
aplanar [] = "" 
aplanar (x:xs) = x ++ aplanar xs

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = ""
aplanarConBlancos (x:[]) = x
aplanarConBlancos (x:xs) = x ++ " " ++ aplanarConBlancos xs


aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] _ = ""
aplanarConNBlancos (x:[]) _ = x
aplanarConNBlancos (x:xs) n = x ++ (nBlancos n) ++ aplanarConNBlancos xs n
    where 
        nBlancos n | n<0 = error "n must be positive"
        nBlancos 0 = ""
        nBlancos n = " " ++ nBlancos (n-1)


--Ej 5

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [x] = [x]
sumaAcumulada (x:xs) = x:(sumaAcumulada(sumarAlPrimero x xs))
    where sumarAlPrimero n (x:xs) = (x+n):xs

factoresPrimos :: Int -> [Int]
factoresPrimos 1 = []
factoresPrimos n = menorDivisor(n):factoresPrimos(div n (menorDivisor n))
    where
        menorDivisor :: Int->Int
        menorDivisor n | n<0 = error "must be a positive number"
        menorDivisor 1 = 1
        menorDivisor n = tilldiv n 2
            where
                tilldiv n k | mod n k == 0 = k
                            | otherwise = tilldiv n (k+1)

descomponerEnPrimos :: [Int] -> [[Int]]
descomponerEnPrimos (x:[]) = [factoresPrimos x]
descomponerEnPrimos (x:xs) = (factoresPrimos x):(descomponerEnPrimos xs) 