#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Eliminacion Gausianna
"""
import numpy as np

def elim_gaussiana(A):
    cant_op = 0
    m=A.shape[0]
    n=A.shape[1]
    Ac = A.copy()
    
    if m!=n:
        print('Matriz no cuadrada')
        return
    
    ## desde aqui -- CODIGO A COMPLETAR


    for j in range(n):
        for i in range(j+1,n):
            Ac[i,j] = Ac[i,j] / Ac[j,j]
            cant_op += 1
            Ac[i,j+1:] -= Ac[i,j]*Ac[j,j+1:] 
            cant_op += 2*(n-j-1)

    ## hasta aqui
            
    L = np.tril(Ac,-1) + np.eye(A.shape[0]) 
    U = np.triu(Ac)
    
    return L, U, cant_op

def sol_tril(L,b):
    """
    para L triangular inferior 
    """
    sol = b.copy()
    n=L.shape[1]

    for i in range(n):
            sol[i] -= sum(sol[:i] * L[i,:i]) 
            sol[i] /= L[i,i]

    return sol

def sol_triu(U,b):
    """
    para U triangular superior
    """
    sol = b.copy()
    n=U.shape[1]
    for i in range(n-1,-1,-1):
            sol[i] -= sum(sol[i+1:] * U[i,i+1:]) 
            sol[i] = sol[i] / U[i,i]
    
    return sol

def main():
    n = 50
    B = np.eye(n) - np.tril(np.ones((n,n)),-1) 
    B[:n,n-1] = 1
    print('Matriz B \n', B)
    
    L,U,cant_oper = elim_gaussiana(B)
    
    print('Matriz L \n', L)
    print('Matriz U \n', U)
    print('Cantidad de operaciones: ', cant_oper)
    print('B=LU? ' , 'Si!' if np.allclose(np.linalg.norm(B - L@U, 1), 0) else 'No!')
    print('Norma infinito de U: ', np.max(np.sum(np.abs(U), axis=1)) )

if __name__ == "__main__":
    #main()
    A = np.array([[2,1,2,3],[4,3,3,4],[-2,2,-4,-12],[4,1,8,-3]], dtype=float)
    L,U,c = elim_gaussiana(A)
    b = np.array([1,1,1,1], dtype=float)
    print((L @ sol_tril(L,b)) == b)
    print(U @ sol_triu(U,b) == b)