package aed;

public class Fecha {

    private int dia;
    private int mes;


    public Fecha(int dia, int mes) {
        this.dia = dia;
        this.mes = mes;
    }

    public Fecha(Fecha fecha) {
        this.dia = fecha.dia;
        this.mes = fecha.mes;
    }

    public Integer dia() {
        return this.dia;
    }

    public Integer mes() {
        return this.mes;
    }

    public String toString() {
        return Integer.toString(this.dia) + "/" + Integer.toString(this.mes);
    }

    @Override
    public boolean equals(Object otra) {
        if(otra == null || otra.getClass() != this.getClass()) return false;
        Fecha f = (Fecha) otra;
        return f.dia == this.dia && f.mes == this.mes;
    }

    public void incrementarDia() {
        this.dia = (this.dia%this.diasEnMes(this.mes)) +1;
        if(this.dia == 1) this.mes = (this.mes%12) + 1;
    }

    private int diasEnMes(int mes) {
        int dias[] = {
                // ene, feb, mar, abr, may, jun
                31, 28, 31, 30, 31, 30,
                // jul, ago, sep, oct, nov, dic
                31, 31, 30, 31, 30, 31
        };
        return dias[mes - 1];
    }

}
