package aed;

public class Horario {

    private int hora;
    private int minutos;

    public Horario(int hora, int minutos) {
        this.hora = hora;
        this.minutos = minutos;
    }

    public int hora() {
        return this.hora;
    }

    public int minutos() {
        return minutos;
    }

    @Override
    public String toString() {
        return Integer.toString(this.hora) + ":" + Integer.toString(this.minutos);
    }

    @Override
    public boolean equals(Object otro) {
        if(otro == null || otro.getClass() != this.getClass()) return false;
        Horario h = (Horario) otro;
        return h.hora == this.hora && h.minutos == this.minutos;
    }

}
