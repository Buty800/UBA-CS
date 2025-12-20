module Infer(inferType, checkType, normalize) where

import qualified Data.Map as M
import qualified Data.Set as S

import Pprint(pprintExpr)
import Syntax(Id, Expr(..), Declaration(..), freeVariables)

reportError :: String -> Either String a
reportError = Left

---- Alpha equivalence ----

type Renaming = M.Map Id Id

freshVariable :: Id -> S.Set Id -> Id
freshVariable prefix forbidden =
  let candidates = prefix : [prefix ++ show n | n <- [1..]]
   in head (filter (`S.notMember` forbidden) candidates)

domR :: Renaming -> S.Set Id
domR = M.keysSet

freeVariablesR :: Renaming -> S.Set Id
freeVariablesR r = S.fromList (M.elems r)

alphaEquivalent :: Expr -> Expr -> Bool
alphaEquivalent e1 e2 = rec M.empty M.empty e1 e2
  where
    rec :: Renaming -> Renaming -> Expr -> Expr -> Bool
    rec _  _  Type Type = True
    rec r1 r2 (Var x) (Var y) =
      M.findWithDefault x x r1 == M.findWithDefault y y r2
    rec r1 r2 (Pi x s1 t1) (Pi y s2 t2)   = recBinder r1 r2 x s1 t1 y s2 t2
    rec r1 r2 (Lam x s1 t1) (Lam y s2 t2) = recBinder r1 r2 x s1 t1 y s2 t2
    rec r1 r2 (App s1 t1) (App s2 t2)     = rec r1 r2 s1 s2 && rec r1 r2 t1 t2
    rec _ _ _ _ = False
    recBinder r1 r2 x s1 t1 y s2 t2 =
      let forbidden = ((freeVariables t1 S.\\ domR r1) `S.union` freeVariablesR r1)
                      `S.union` 
                      ((freeVariables t2 S.\\ domR r2) `S.union` freeVariablesR r2)
          z = freshVariable x forbidden
          r1' = M.insert x z r1
          r2' = M.insert y z r2
       in rec r1 r2 s1 s2
       && rec r1' r2' t1 t2

---- Substitution ----

type Substitution = M.Map Id Expr

domS :: Substitution -> S.Set Id
domS = M.keysSet

freeVariablesS :: Substitution -> S.Set Id
freeVariablesS sub = S.unions (map freeVariables (M.elems sub))

substitute :: Substitution -> Expr -> Expr
substitute sub Type          = Type
substitute sub (Pi x e1 e2)  = substituteBinder sub Pi x e1 e2
substitute sub (Var x)       = M.findWithDefault (Var x) x sub
substitute sub (Lam x e1 e2) = substituteBinder sub Lam x e1 e2
substitute sub (App e1 e2)   = App (substitute sub e1) (substitute sub e2)
substituteBinder sub binder x e1 e2 =
  let forbidden = (freeVariables e2 S.\\ domS sub) `S.union` freeVariablesS sub
      z = freshVariable x forbidden
      sub' = M.insert x (Var z) sub
   in binder z (substitute sub e1) (substitute sub' e2)

---- Reduction ----

reduce1 :: [Declaration] -> Expr -> Maybe Expr
reduce1 env Type          = Nothing
reduce1 env (Pi x e1 e2)  = reduce1Binder env Pi x e1 e2
reduce1 env (Var x)       = lookupVar env x
  where
    lookupVar [] _ = Nothing
    lookupVar (DeclAxiom y _ : _) x | x == y = Nothing
    lookupVar (DeclDef y _ e : _) x | x == y = Just e
    lookupVar (_ : decls)         x          = lookupVar decls x
reduce1 env (Lam x e1 e2) = reduce1Binder env Lam x e1 e2
reduce1 env (App (Lam x _ body) arg)  =
  Just (substitute (M.insert x arg M.empty)  body)
reduce1 env (App e1 e2) =
  case reduce1 env e1 of
    Just e1' -> Just (App e1' e2)
    Nothing  ->
      case reduce1 env e2 of
        Just e2' -> Just (App e1 e2')
        Nothing  -> Nothing
reduce1Binder env binder x e1 e2 =
  case reduce1 env e1 of
    Just e1' -> Just (binder x e1' e2)
    Nothing ->
      case reduce1 (DeclAxiom x e1 : env) e2 of
        Just e2' -> Just (binder x e1 e2')
        Nothing  -> Nothing

normalize :: [Declaration] -> Expr -> Expr
normalize env expr =
  case reduce1 env expr of
    Just expr' -> normalize env expr'
    Nothing    -> expr

interconvertible :: [Declaration] -> Expr -> Expr -> Bool
interconvertible env e1 e2 =
  alphaEquivalent (normalize env e1) (normalize env e2)

---- Type checking ----

{-
data Expr = Type
          | Pi Id Expr Expr
          | Var Id
          | Lam Id Expr Expr
          | App Expr Expr
-}

inferType :: [Declaration] -> Expr -> Either String Expr
inferType env Type = return Type
inferType env (Pi x e1 e2) = do
  checkType env e1 Type
  checkType (DeclAxiom x e1 : env) e2 Type
  return Type
inferType env (Var x) = lookupVar env x
  where
    lookupVar []             _ =
      reportError (
        "La variable " ++ x ++ " no está declarada."
      )
    lookupVar (DeclAxiom y typ : decls) x | x == y = return typ
    lookupVar (DeclDef y typ _ : decls) x | x == y = return typ
    lookupVar (_  : decls) x = lookupVar decls x
inferType env (Lam x e1 e2) = do
  checkType env e1 Type
  returnType <- inferType (DeclAxiom x e1 : env) e2
  return (Pi x e1 returnType)
inferType env (App e1 e2) = do
  funcType <- inferType env e1
  case normalize env funcType of
    Pi x argType returnType -> do
      checkType env e2 argType
      return $ substitute (M.insert x e2 M.empty) returnType
    _ -> reportError (
            "En la aplicación " ++ pprintExpr (App e1 e2)
         ++ " la función tiene tipo " ++ pprintExpr funcType
         ++ ", que no es un tipo funcional."
         )

checkType :: [Declaration] -> Expr -> Expr -> Either String ()
checkType env expr typ = do
  typ' <- inferType env expr 
  if interconvertible env typ typ'
   then return ()
   else reportError $ unlines [
          "Se esperaba que " ++ pprintExpr expr
        , " tenga tipo " ++ pprintExpr typ
        , " pero tiene tipo " ++ pprintExpr typ'
        ]

