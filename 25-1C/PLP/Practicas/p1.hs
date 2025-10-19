--3

--i
sum' :: (Foldable t, Num a) => t a -> a
sum' = foldr (+) 0 

elem' :: (Foldable t, Eq a) => a -> t a -> Bool
elem' e = foldr (\a b -> a == e || b) False

concat' :: [a] -> [a] -> [a]
concat' = flip (foldr (:)) 

filter' :: (a -> Bool) -> [a] -> [a]
filter' f = foldr (helper f) []
    where
    helper f a  | f a = (a:)
                | otherwise = id 

map' :: (a -> b) -> [a] -> [b]
map' f = foldr ((:).f) []

--ii
mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f (x:xs) = foldr (\a b -> if f a b then a else b ) x xs

--iii
sumasParciales :: Num a => [a] -> [a]
sumasParciales = foldr (\x xs -> x:map (+x) xs) [] 

--iv
sumaAlt :: Num a => [a] -> a
sumaAlt = foldr (-) 0

--4

prefijos :: [a] -> [[a]]
prefijos xs = map (`take` xs) [0..length xs]

--5
entrelazar :: [a] -> [a] -> [a]
entrelazar = foldr (\x f ys -> if null ys then x:(f []) else x : head ys : f (tail ys)) id 
--entrelazar [] = id
--entrelazar (x:xs) = \ys -> if null ys then x : entrelazar xs [] else x : head ys : entrelazar xs (tail ys)

--6
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x:xs) = f x xs (recr f z xs)

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna e = recr (\x xs r -> if x==e then xs else x:r) []
{-
sacarUna _ [] = []
sacarUna e (x:xs) | e==x = xs
                  | otherwise = x:(sacarUna e xs)]
-}

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e = recr (\x xs r -> if e>x then x:e:xs else x:r) [e] 

{- 
insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado e [] = [e]
insertarOrdenado e (x:xs)   | e>x = x:e:xs 
                            | otherwise = x:insertarOrdenado e xs 
-}

--7
mapPares :: (a->b->c) -> [(a,b)] -> [c]
mapPares f = foldr ((:).(uncurry f)) []

armarPares :: [a] -> [b] -> [(a,b)]
armarPares = foldr (\x f ys->if null ys then f [] else (x,(head ys)):f (tail ys)) (const [])
{-
armarPares [] ys = []
armarPares xs [] = []
armarPares (x:xs) (y:ys) = (x,y):(armarPares xs ys)
-}
--armarPares [] = const []
--armarPares (x:xs) = \ys -> if null ys then [] else (x,head ys):armarPares xs (tail ys)

mapDoble :: (a->b->c) -> [a] -> [b] -> [c]
mapDoble f xs ys = mapPares f (armarPares xs ys) 

----partcita 1/04
data AEB a = Hoja a | Bin (AEB a) a (AEB a)

foldAEB :: (a->b) -> (b->a->b->b) -> AEB a -> b
foldAEB fBin fHoja (Hoja a) = fBin a
foldAEB fBin fHoja (Bin l x r) = fHoja (foldAEB fBin fHoja l) x (foldAEB fBin fHoja r)

rama :: AEB a -> [[a]]
rama = foldAEB ((:[]).(:[])) (\l x r-> (map (x:) l) ++ (map (x:) r))

altura :: AEB a -> Int
altura = foldAEB (const 1) (\l _ r-> 1+max l r)


data Pol a = X | Cte a | Suma (Pol a) (Pol a) | Prod (Pol a) (Pol a) 

foldPol :: b -> (a->b) -> (b->b->b) -> (b->b->b) -> Pol a -> b
foldPol x fc fs fp (X) = x 
foldPol x fc fs fp (Cte k) = fc k
foldPol x fc fs fp (Suma p q) = fs (foldPol x fc fs fp p) (foldPol x fc fs fp q) 
foldPol x fc fs fp (Prod p q) = fp (foldPol x fc fs fp p) (foldPol x fc fs fp q)

ev :: (Num a) => a -> Pol a -> a
ev x = foldPol x (id) (+) (*) 


data RoseTree a = Rose a [RoseTree a]

foldRose :: (a->[b]->b) -> RoseTree a -> b 
foldRose f (Rose x rs) = f x (map (foldRose f) rs)  

alturaRT = foldRose (\_ r-> 1+(if null r then 0 else (maximum r))) 


type Conj a = (a->Bool)

vacio :: Conj a
vacio = const False

agregar :: (Eq a) => a -> Conj a -> Conj a
agregar e conj = \x -> if x == e then True else conj x
--agregar e conj = \x -> x==e||conj x