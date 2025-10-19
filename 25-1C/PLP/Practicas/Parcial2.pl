arbol(nil).

append_t(nil,bin(nil,_,nil)).
append_t(bin(I,_,D),bin(IA,_,D)) :- append_t(I,IA).
append_t(bin(I,_,D),bin(I,_,DA)) :- append_t(D,DA).

arbol_n(0,nil).
arbol_n(N,T) :- N > 0,N is N1+1, arbol_n(N1,T1), append_t(T1,T).


p(a).
q(a).
q(b).

miembro(X, [X|_]).
miembro(X, [_|XS]) :- miembro(X,XS).

esSubLista(_,[]).
esSubLista(L,[X|XS]) :- member(X,L), esSubLista(L,XS).

esSucc(X,suc(X)).
