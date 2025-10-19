package aed;

class ArregloRedimensionableDeRecordatorios {

    private Recordatorio[] arr;
    private int longitud;

    public ArregloRedimensionableDeRecordatorios() {
        this.arr = new Recordatorio[0];
        this.longitud = 0;
    }

    public int longitud() {
        return this.longitud;
    }

    public void agregarAtras(Recordatorio i) {
        Recordatorio[] new_arr = new Recordatorio[longitud+1];
        for(int j = 0; j < longitud; j++) new_arr[j] = this.arr[j];
        new_arr[longitud] = i;
        this.arr = new_arr;
        longitud++;
    }

    public Recordatorio obtener(int i) {
        return this.arr[i];
    }

    public void quitarAtras() {
        Recordatorio[] new_arr = new Recordatorio[--longitud];
        for(int j = 0; j < longitud; j++) new_arr[j] = this.arr[j];
        this.arr = new_arr;
    }

    public void modificarPosicion(int indice, Recordatorio valor) {
        this.arr[indice] = valor;
    }

    public ArregloRedimensionableDeRecordatorios(ArregloRedimensionableDeRecordatorios vector) {
        this.arr = new Recordatorio[vector.longitud];
        this.longitud = vector.longitud;
        for(int j = 0; j < longitud; j++) this.arr[j] = vector.arr[j];
    }

    public ArregloRedimensionableDeRecordatorios copiar() {
        return new ArregloRedimensionableDeRecordatorios(this);
    }
}
