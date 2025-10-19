% 3
natural(0).
natural(suc(X)) :- natural(X).
menorOIgual(X,X) :- natural(X).
menorOIgual(X,suc(Y)) :- menorOIgual(X, Y).

%4
juntar([],L,L).
juntar([X|L1],L2,[X|L3]) :- juntar(L1,L2,L3).

%5
ultimo(L,U) :- juntar(_,[U],L).

reverso([],[]).
reverso([H|T],R) :- reverso(T,TR), append(TR,[H],R).

prefijo(P,L) :- juntar(P,_,L).

sufijo(P,L) :- juntar(_,P,L).

sublista([],_).
sublista(S,L) :- juntar(_,R,L), juntar(S,_,R), S \= []. 

pertenece(X,L) :- juntar(_,R,L),juntar([X],_,R).

%nopertenece(_,[]).
%nopertenece(X,[H|L]) :- X \= H, nopertenece(X,L). 

%6
aplanar([],[]).
aplanar(X, [X]) :- not(is_list(X)).
aplanar([H|T],F) :- aplanar(H,HF), aplanar(T,TF), juntar(HF,TF,F).

%7
interseccion([],_,[]).
interseccion([H|L1],L2,[H|L3]) :- memberchk(H,L2), interseccion(L1,L2,L3).
interseccion([H|L1],L2,L3) :- not(memberchk(H,L2)), interseccion(L1,L2,L3).

% partir(+N,?L,?L1,?L2)
partir(0,L,[],L).
partir(N,[H|L],[H|L1],L2) :- N > 0, M is N - 1, partir(M,L,L1,L2).

borrar([],_,[]).
borrar([X|T],X,L) :- borrar(T,X,L).
borrar([H|T],X,[H|L]) :- X \= H, borrar(T,X,L).

sacarDuplicados([],[]).
sacarDuplicados([H|L1],L2) :- sacarDuplicados(L1,L2), memberchk(H,L1).
sacarDuplicados([H|L1],[H|L2]) :- sacarDuplicados(L1,L2), not(memberchk(H,L1)).

insertar(X,L,LX) :- append(I,D,L), append(I,[X|D],LX).

permutacion([],[]).
permutacion([H|L1],L2) :- permutacion(L1,P), insertar(H,P,L2).

reparto(L, N, LListas) :- length(LListas, N),append(LListas,L).

repartoSinVacias(L, LListas) :- length(L,N), between(1,N,M),reparto(L,M,LListas), not(member([],LListas)).

%9
desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

desdeReversible(X,Y) :- var(Y), desde(X,Y).
desdeReversible(X,Y) :- nonvar(Y), X =< Y.

%11

vacio(nil).

raiz(bin(_,v,_),v).

%aux
maximo(A,B,A) :- A > B.
maximo(A,B,B) :- B >= A.

altura(nil,0).
altura(bin(I,_,R),N) :- altura(I,IH), altura(R,RH), maximo(IH,RH,M), N is M + 1.

cantidadDeNodos(nil,0).
cantidadDeNodos(bin(I,_,R),N) :- cantidadDeNodos(I,CI),cantidadDeNodos(R,CR),N is CR+CI+1.

%12

inorder(nil,[]).
inorder(bin(I,V,R),L) :- inorder(I,IL), inorder(R,RL), append(IL, [V|RL], L).

arbolConInorder([],nil).
arbolConInorder(L,bin(I,V,R)) :- append(IL, [V|RL],L), arbolConInorder(IL,I), arbolConInorder(RL, R).


aBB(nil).
aBB(bin(nil,_,nil)).



aBBInsertar(X,nil,bin(nil,X,nil)).
aBBInsertar(X,bin(I,V,R), bin(I,V,RV)) :- X > V, aBBInsertar(X,R,RV).
aBBInsertar(X,bin(I,V,R), bin(IV,V,R)) :- X < V, aBBInsertar(X,I,IV).

%parcial viejo

notas([(a,plp,2),(b,plp,8),(a,tda,6),(c,tda,3),(c,tda,7)]).
tieneMateriaAprobada(E,M) :- notas(X), between(4,10,N), member((E,M,N),X). 
tieneMateriaAprobada(E,M,L) :- between(4,10,N), member((E,M,N),L). 

eliminarAplazos([],[]).
eliminarAplazos([(E,M,N)|NS],L) :- tieneMateriaAprobada(E,M,NS),N<4, eliminarAplazos(NS,L).  
eliminarAplazos([(E,M,N)|NS],[(E,M,N)|L]) :- N >= 4, eliminarAplazos(NS,L).
eliminarAplazos([(E,M,N)|NS],[(E,M,N)|L]) :- not(tieneMateriaAprobada(E,M,NS)), N < 4, eliminarAplazos(NS,L).

suma([],0).
suma([X|XS],N) :- suma(XS,N2), N is X+N2.
%notasde(+E,-NS)
notasde(_,[],[]).
notasde(E,[(E,_,N)|N1],[N|N2]) :- notasde(E,N1,N2). 
notasde(E1,[(E2,_,_)|N1],N2) :- E1 \= E2, notasde(E1,N1,N2). 

prom(XS,N) :- length(XS,L), suma(XS,S), N is S / L.
promedio(E,N) :- notas(XS), eliminarAplazos(XS,AS), notasde(E,AS,NS), prom(NS,N).

esRotacion(A,B) :- append(X,Y,A), append(Y,X,B), X \= [].

mod(A,B,M) :- M is A mod B.

collatz(N,N).
collatz(N,S):- N > 1, mod(N,2,0), N2 is N/2, collatz(N2,S).
collatz(N,S):- N > 1, mod(N,2,1), N2 is 3*N+1, collatz(N2,S).


collatzMax(1,1).
collatzMax(N,M) :- N>1, mod(N,2,0), N2 is N/2, collatzMax(N2,M2), maximo(N,M2,M).
collatzMax(N,M) :- N>1, mod(N,2,1), N2 is 3*N+1, collatzMax(N2,M2), maximo(N,M2,M).
