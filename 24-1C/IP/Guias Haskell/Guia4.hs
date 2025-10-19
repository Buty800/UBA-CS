--Ej 1
fib :: Int -> Int 
fib n | n<0 = error "must be a positive number"
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

--Ej 2

parteEntera :: Float -> Int
parteEntera 0 = 0
parteEntera x | x>0 = isless x 0 | x<0 = - isless (abs x) 0  
    where
        isless :: Float -> Int -> Int
        isless x i
            | x>fromIntegral(i) = isless x (i+1) 
            | otherwise = i-1

--Ej 3  
esDivisible :: Int -> Int -> Bool
esDivisible x y = elem x [y*a | a <- [0..x]]

--Ej 4
sumaImpares :: Int -> Int
sumaImpares x | x<0 = error "must be a positive number"
sumaImpares 0 = 0
sumaImpares n = 2*n-1 + sumaImpares (n-1) 

--Ej 5
medioFac :: Int -> Int 
medioFac x | x<0 = error "must be a positive number"
medioFac 0 = 1
medioFac 1 = 1
medioFac n = n * medioFac (n-2)

--Ej 6
sumaDigitos :: Int -> Int 
sumaDigitos 0 = 0
sumaDigitos n = 
    let m = abs n in 
    unidad m + sumaDigitos (div m 10)
    where unidad m = mod m 10

--Ej 7 
todosDigitosIguales :: Int -> Bool 
todosDigitosIguales n   
    | n<0 = error "must be a positive number"
    | n < 10 = True
    | otherwise = unidad == decena && todosDigitosIguales(div n 10)
    where  
        unidad = mod n 10
        decena = mod (div n 10) 10

--Ej 8
cantidadDigitos :: Int -> Int 
cantidadDigitos 0 = 1
cantidadDigitos n | n < 10 = 1
cantidadDigitos n = 1 + cantidadDigitos(div n 10)

iesimoDigito :: Int -> Int -> Int
iesimoDigito n i
    | n<=0 = error "first argument must be grater than 0"
    | i>cantidadDigitos n && i>=1= error "i must be grater than 1 and equal or less than the number of digits"
    | otherwise = mod (div n (10^(cantidadDigitos (n)-i)))  10

--Ej  9
esCapicua :: Int ->Bool
esCapicua n 
    | n<0 = error "must be a positive number"
    | n < 10 = True
esCapicua n = iesimoDigito n (cantidadDigitos n) == iesimoDigito n 1 && esCapicua (next n)
    where next n = div (n - (10^(cantidadDigitos (n)-1)) * iesimoDigito n 1) 10 

--Ej 10

f1 :: Int -> Int 
f1 n | n<0 = error "must be a positive number"
f1 0 = 1
f1 n = 2^n + f1 (n-1)

f2 :: Int -> Float -> Float
f2 n _ | n<=0 = error "must be a positive number"
f2 1 q = q
f2 n q = q^n + f2 (n-1) q

f3 :: Int -> Float -> Float
f3 n q = f2 (2*n) q

f4 :: Int -> Float -> Float
f4 n q = (f3 n q) - (f2 n q) + (q^n)

--Ej 11
eAprox :: Int -> Float
eAprox n | n<0 = error "must be a positive number"
eAprox 0 = 1
eAprox n = eAprox (n-1) + 1/fac(n)
    where 
        fac :: (Num a) => Int -> a
        fac 0 = 1
        fac n = fromIntegral(n) * fac(n-1)

e :: Float
e = eAprox 10

--Ej 12 
raizDe2Aprox :: Int -> Float
raizDe2Aprox n | n<0 = error "must be a positive number"
raizDe2Aprox 1 = 1
raizDe2Aprox n = 2 + 1/raizDe2Aprox(n-1)

--Ej 13 
sumsum :: Int->Int->Int
sumsum n m | n<=0 || m<=0 = error "must be a positive number"
sumsum 1 m = m 
sumsum n m = (sum n m) + (sumsum (n-1) m)
    where 
        sum :: Int->Int->Int
        sum n 1 = n 
        sum n m = n^m + sum n (m-1)

--Ej 14
sumaPotencias :: Int->Int->Int->Int
sumaPotencias q n m = sum [q^(a+b) | a<-[1..n], b<-[1..m]]


--Ej 15
sumaRacionales :: Int->Int->Float
sumaRacionales n m = sum [fromIntegral(p)/fromIntegral(q) | p<-[1..n],q<-[1..m]]


--Ej 16 

--a
menorDivisor :: Int->Int
menorDivisor n | n<0 = error "must be a positive number"
menorDivisor 1 = 1
menorDivisor n = tilldiv n 2
    where
        tilldiv n k | mod n k == 0 = k
                    | otherwise = tilldiv n (k+1)

--b
esPrimo :: Int->Bool
esPrimo 1 = False
esPrimo n = (menorDivisor n) == n

--c
factoresPrimos :: Int -> [Int]
factoresPrimos 1 = [1]
factoresPrimos n = menorDivisor(n):factoresPrimos(div n (menorDivisor n))

intersect [] _ = []
intersect (x:xs) y | elem x y = x:(intersect xs y) | otherwise = intersect xs y

sonCoprimos :: Int->Int->Bool
sonCoprimos n k = (intersect (factoresPrimos n) (factoresPrimos k)) == [1]

--d
nEsimoPrimo :: Int ->Int
nEsimoPrimo n = [p | p<-[0..], esPrimo p]!!(n-1)

--17
esFibonacci :: Int -> Bool
esFibonacci n = isfib 0 n 
    where
        isfib x n | x == n = fib x == n
        isfib x n = fib x == n || isfib (x+1) n

--18 
mayorDigitoPar :: Int -> Int
mayorDigitoPar n 
    | (abs n)<10 = unidadpar n 
    | otherwise = max (unidadpar n) (mayorDigitoPar (div n 10)) 
    where
        unidadpar :: Int -> Int
        unidadpar x | even (mod (abs x) 10) = mod (abs x) 10
        unidadpar x | otherwise = -1

--19 
esSumaInicialDePrimos :: Int -> Bool
esSumaInicialDePrimos n = issum n n 
    where
        primeSum :: Int -> Int
        primeSum 1 = 2
        primeSum n = nEsimoPrimo(n) + primeSum (n-1)
        issum :: Int -> Int ->  Bool
        issum n 0 = False
        issum n i = (primeSum i == n) || issum n (i-1) 


--20 
tomaValorMax :: Int -> Int -> Int
tomaValorMax n1 n2 
    | n1 > n2 = error "Second argument must be grater than the first one"
    | n1 == n2 = sumaDivisores n2
    | otherwise = max (sumaDivisores n2) (tomaValorMax n1 (n2-1)) 
    where 
        sumaDivisores n = sum [d | d <- [1..n], mod n d == 0]


--21
pitagoras :: Int -> Int -> Int -> Int
pitagoras m n r = length [1 | p<-[0..m],q<-[0..n], p^2 + q^2 <= r^2]