package aed;

import java.util.*;

// Todos los tipos de datos "Comparables" tienen el método compareTo()
// elem1.compareTo(elem2) devuelve un entero. Si es mayor a 0, entonces elem1 > elem2
public class ABB<T extends Comparable<T>> implements Conjunto<T> {
    
    private Nodo raiz;
    private int cardinal = 0;

    private class Nodo {
        
        private T val;

        private Nodo perent;
        private Nodo lchild = null;
        private Nodo rchild = null;

        public Nodo(T v,Nodo p){
            this.val = v;
            this.perent = p;
        };

    }

    public ABB(){this.raiz = null;}

    public int cardinal(){return this.cardinal;}

    public T minimo(){
        if(this.raiz == null) return null;
        Nodo min = this.raiz;
        while(min.lchild != null) min = min.lchild;
        return min.val; 
    }

    public T maximo(){
        if(this.raiz == null) return null;
        Nodo max = this.raiz;
        while(max.rchild != null) max = max.rchild;
        return max.val; 
    }

    private void insertarNodo(Nodo node){
        if(node == null) return;
        
        if(this.raiz == null){
            node.perent = null;
            this.raiz = node;
            return;
        }

        Nodo perent = this.raiz;
        T elem = node.val;
        
        while(true){
            if(perent.val.compareTo(elem) == 0) return;

            if(perent.val.compareTo(elem) > 0){
                if(perent.lchild == null){
                    node.perent = perent;
                    perent.lchild = node;
                }
                perent = perent.lchild;
            }
                
            if(perent.val.compareTo(elem) < 0){
                if(perent.rchild == null){
                    node.perent = perent;
                    perent.rchild = node;
                }
                perent = perent.rchild;
            }
        }


    }

    public void insertar(T elem){
        if(!this.pertenece(elem)){
            this.insertarNodo(new Nodo(elem, null));
            this.cardinal++;
        }
    }

    private Nodo encontrarNodo(T elem){
        Nodo actual = this.raiz;
        while (actual != null) {
            if(actual.val.compareTo(elem) == 0) return actual;
            else if(actual.val.compareTo(elem) > 0) actual = actual.lchild;
            else if(actual.val.compareTo(elem) < 0) actual = actual.rchild;
        }
        return null;
    }

    public boolean pertenece(T elem){return this.encontrarNodo(elem) != null;}

    public void eliminar(T elem){    
        Nodo actual = this.encontrarNodo(elem);        
        
        if(actual == null) return;
        
        if(actual.perent == null){
            this.raiz = actual.rchild;
            this.insertarNodo(actual.lchild);
            if(this.raiz != null) this.raiz.perent = null;
        } 
        else if(actual.perent.lchild == actual){
            actual.perent.lchild = actual.lchild;
            if(actual.lchild != null) actual.lchild.perent = actual.perent;
            this.insertarNodo(actual.rchild);
        }
        else if(actual.perent.rchild == actual){
            actual.perent.rchild = actual.rchild;
            if(actual.rchild != null) actual.rchild.perent = actual.perent;
            this.insertarNodo(actual.lchild);
        }

        this.cardinal--;


    }

    public String toString(){
        String res = "{";
        Iterador<T> iterador = iterador();
        if(iterador.haySiguiente()) res += iterador.siguiente().toString(); 
        while (iterador.haySiguiente()) res += "," + iterador.siguiente().toString();
        res += "}";
        return res;
    }

    private class ABB_Iterador implements Iterador<T> {
        private Nodo actual = encontrarNodo(minimo());     

        public boolean haySiguiente() {            
            return actual != null;
        }
    
        public T siguiente() {
            T res = actual.val;
            
            if(actual.rchild != null){
                actual = actual.rchild;
                while (actual.lchild != null) actual = actual.lchild; 
            }
            else{
                while(actual != null && actual.val.compareTo(res) <= 0){
                    actual = actual.perent;
                }
            } 
                
            return res;
            
        }
    }

    public Iterador<T> iterador() {
        return new ABB_Iterador();
    }

}
