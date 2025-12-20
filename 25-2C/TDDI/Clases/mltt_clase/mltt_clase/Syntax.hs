
module Syntax(Id, Expr(..), Declaration(..), freeVariables, splitArgs) where

import qualified Data.Set as S

type Id = String

data Expr = Type
          | Pi Id Expr Expr
          | Var Id
          | Lam Id Expr Expr
          | App Expr Expr
  deriving Show

data Declaration = DeclAxiom Id Expr
                 | DeclDef Id Expr Expr
                 | DeclCheck Expr
  deriving Show

freeVariables :: Expr -> S.Set Id
freeVariables Type          = S.empty
freeVariables (Pi x e1 e2)  = freeVariables e1 `S.union`
                              (freeVariables e2 S.\\ S.singleton x)
freeVariables (Var x)       = S.singleton x
freeVariables (Lam x e1 e2) = freeVariables e1 `S.union`
                              (freeVariables e2 S.\\ S.singleton x)
freeVariables (App e1 e2)   = freeVariables e1 `S.union` freeVariables e2

splitArgs :: Expr -> (Expr, [Expr])
splitArgs (App fun arg) =
  let (head, args) = splitArgs fun in
    (head, args ++ [arg])
splitArgs expr = (expr, [])

