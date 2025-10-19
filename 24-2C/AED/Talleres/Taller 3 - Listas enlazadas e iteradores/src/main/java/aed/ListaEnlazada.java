package aed;

import java.util.*;

public class ListaEnlazada<T> implements Secuencia<T> {
    
    private Nodo first;
    private Nodo last;
    private int length;

    private class Nodo {
        T val;
        Nodo next;
        Nodo prev;
        Nodo(T v){this.val=v;}
    }

    public ListaEnlazada() {
        this.first = new Nodo(null);
        this.last = new Nodo(null);
        this.length = 0;

    }

    public int longitud() {
        return this.length;
    }

    public void agregarAdelante(T elem) {
        Nodo newNodo = new Nodo(elem);
        if(this.length == 0) this.last = newNodo;
        else{
            this.first.prev = newNodo;
            newNodo.next = this.first;
        }
        this.first = newNodo;
        this.length++;
    }

    public void agregarAtras(T elem) {
        Nodo newNodo = new Nodo(elem);
        if(this.length == 0) this.first = newNodo;
        else{
            this.last.next = newNodo;
            newNodo.prev = this.last;
        }
        this.last = newNodo;
        this.length++;
    }

    public T obtener(int i) {
        Nodo act = this.first;
        for(int j = 0; j<i; j++) act = act.next;
        return act.val;
        
    }

    public void eliminar(int i) {
        if(i == 0){
            this.first = this.first.next;
            this.first.prev = new Nodo(null);
        }else if(i == this.length-1){
            this.last = this.last.prev;
            this.last.next = new Nodo(null); 
        }else{
            Nodo act = this.first;
            for(int j = 0; j<i; j++) act = act.next;
            (act.prev).next = act.next;
            (act.next).prev = act.prev;
        }
        this.length--;
    }

    public void modificarPosicion(int indice, T elem) {
        Nodo act = this.first;
        for(int j = 0; j<indice; j++) act = act.next;
        act.val = elem;
    }

    public ListaEnlazada(ListaEnlazada<T> lista) {
        this.first = new Nodo(null);
        this.last = new Nodo(null);
        this.length = 0;
        for(int i =0;i<lista.length;i++) this.agregarAtras(lista.obtener(i));
    }
    
    @Override
    public String toString() {
        String res = "[";
        for(int i =0;i<this.length;i++){
            if(i!=0) res+=", ";
            res += this.obtener(i).toString();
        }
        res += "]";
        return res;
    }

    private class ListaIterador implements Iterador<T> {

    	private Nodo pointer;

        private ListaIterador(ListaEnlazada<T> list){
            ListaEnlazada<T> temp_list = new ListaEnlazada<T>(list);
            temp_list.agregarAdelante(null);
            temp_list.agregarAtras(null);
            this.pointer = temp_list.first;
        }

        public boolean haySiguiente() {
	        return pointer.next.next != null;
        }
        
        public boolean hayAnterior() {
            return pointer.prev != null; 
        }

        public T siguiente() {
	        pointer = pointer.next;
            return pointer.val;
        }
        

        public T anterior() {
	        pointer = pointer.prev;
            return pointer.next.val;
        }
    }

    public Iterador<T> iterador() {
	    return new ListaIterador(this);
    }

}
