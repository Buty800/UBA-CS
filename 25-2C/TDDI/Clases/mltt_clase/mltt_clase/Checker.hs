
module Checker(checkProgram) where

import System.Exit(exitFailure)

import Pprint(pprintDeclaration, pprintExpr)
import Syntax(Id, Expr(..), Declaration(..))
import Infer(inferType, checkType, normalize)

die :: String -> IO a
die msg = do
  putStrLn "*** MLTT Error ***\n"
  putStrLn msg
  exitFailure 

checkProgram :: [Declaration] -> IO ()
checkProgram program = rec [] program
  where
    rec :: [Declaration] -> [Declaration] -> IO ()
    rec _ [] = return ()
    rec env (decl@(DeclAxiom name typ) : decls) = do
      putStrLn . pprintDeclaration $ decl
      case checkType env typ Type of
        Left msg -> die msg
        Right () -> return ()
      rec (decl : env) decls
    rec env (decl@(DeclDef name typ body) : decls) = do
      putStrLn . pprintDeclaration $ decl
      case checkType env typ Type of
        Left msg -> die msg
        Right () -> return ()
      case checkType env body typ of
        Left msg -> die msg
        Right () -> return ()
      rec (decl : env) decls
    rec env (decl@(DeclCheck expr) : decls) = do
      typ <- case inferType env expr of
               Left msg -> die msg
               Right typ -> return typ
      putStrLn . pprintDeclaration $ decl
      putStrLn ("  = " ++ pprintExpr (normalize env expr))
      putStrLn ("  : " ++ pprintExpr typ)
      rec (decl : env) decls

