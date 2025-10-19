data AT a = NilT | Tri a (AT a) (AT a) (AT a) deriving Show

at1 = Tri 1 (Tri 2 NilT NilT NilT) (Tri 3 (Tri 4 NilT NilT NilT) NilT NilT) (Tri 5 NilT NilT NilT)

foldAT :: (a->b->b->b->b) -> b -> AT a -> b
foldAT cT cN t = case t of
    NilT -> cN
    Tri v i m d -> cT v (rec i) (rec m) (rec d)
    where rec = foldAT cT cN

preorder :: AT a -> [a]
preorder = foldAT (\v i m d -> v : (i ++ m ++ d)) []

mapAT :: (a->b) -> AT a -> AT b
mapAT f = foldAT (\v i m d -> Tri (f v) i m d) NilT 

nivel :: AT a -> Int -> [a]
nivel = foldAT (\v i m d n ->  if n==0 then [v] else i (n-1) ++ m (n-1) ++ d (n-1)) (const [])

data Buffer a = Empty | Write Int a (Buffer a) | Read Int (Buffer a)

foldBuffer cW cR cE Empty = cE
foldBuffer cW cR cE (Write i v buf') = cW i v (foldBuffer cW cR cE buf')
foldBuffer cW cR cE (Read i buf') = cR i (foldBuffer cW cR cE buf')
recBuffer cW cR cE Empty = cE;recBuffer cW cR cE (Write i v buf') = cW i v buf' (recBuffer cW cR cE buf')
recBuffer cW cR cE (Read i buf') = cR i buf' (recBuffer cW cR cE buf')

contenido n = foldBuffer (\i v r-> if i==n then (Just v) else r) (\i r-> if i==n then Nothing else r) Nothing

puedeCompletarLecturas = foldr (\_ _ r -> r) (\i r -> r && not $ null contenido n )

deshacer = recBuffer (\_ _ buf r i -> if i==0 then buf else r (i+1)) (\_ buf r i-> if i==0 then buf else r (i+1)) (const Empty)foldBuffer cW cR cE Empty = cE;foldBuffer cW cR cE (Write i v buf') = cW i v (foldBuffer cW cR cE buf');foldBuffer cW cR cE (Read i buf') = cR i (foldBuffer cW cR cE buf')

recBuffer cW cR cE Empty = cE
recBuffer cW cR cE (Write i v buf') = cW i v buf' (recBuffer cW cR cE buf')
recBuffer cW cR cE (Read i buf') = cR i buf' (recBuffer cW cR cE buf')

