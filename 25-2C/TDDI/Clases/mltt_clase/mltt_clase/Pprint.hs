module Pprint(pprintProgram, pprintDeclaration, pprintExpr) where

import qualified Data.Set as S

import Syntax(Id, Expr(..), Declaration(..), freeVariables, splitArgs)

pprintProgram :: [Declaration] -> String
pprintProgram declarations = unlines (map pprintDeclaration declarations)

pprintDeclaration :: Declaration -> String
pprintDeclaration (DeclAxiom name typ)    =
  "axiom " ++ pprintId name ++ " : " ++ pprintExpr typ 
pprintDeclaration (DeclDef name typ expr) =
  "def " ++ pprintId name ++ " : " ++ pprintExpr typ ++ " =\n"
  ++ "  " ++ pprintExpr expr
pprintDeclaration (DeclCheck expr) =
  "check " ++ pprintExpr expr

pprintId :: Id -> String
pprintId id = id

pprintExpr :: Expr -> String
pprintExpr Type    = "Type"
pprintExpr (Var x) = pprintId x
pprintExpr (Pi x typ body) =
  if x `S.member` freeVariables body
   then "(" ++ pprintId x ++ " : " ++ pprintExpr typ ++ ")" ++ " -> " ++ pprintExpr body
   else parenPprintExpr typ ++ " -> " ++ pprintExpr body
pprintExpr (Lam x typ body) =
  "\\ " ++ "(" ++ pprintId x ++ " : " ++ pprintExpr typ ++ ")"
        ++ " -> " ++ pprintExpr body
pprintExpr expr@(App _ _) =
    let (head, args) = splitArgs expr
     in unwords (map parenPprintExpr (head : args))

parenPprintExpr :: Expr -> String
parenPprintExpr expr = parenthesize expr (pprintExpr expr)
  where
    parenthesize :: Expr -> String -> String
    parenthesize Type    s = s
    parenthesize (Var _) s = s
    parenthesize _       s = "(" ++ s ++ ")"
