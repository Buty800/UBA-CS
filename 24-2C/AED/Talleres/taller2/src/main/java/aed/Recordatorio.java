package aed;

public class Recordatorio {

    private String mensaje;
    private Fecha fecha;
    private Horario horario;
    
    public Recordatorio(String mensaje, Fecha fecha, Horario horario){
        this.mensaje = mensaje;
        this.fecha = new Fecha(fecha);
        this.horario = horario;
    }

    public Horario horario() {
        return this.horario;
    }

    public Fecha fecha() {
        return new Fecha(this.fecha);
    }

    public String mensaje() {
        return this.mensaje;
    }

    @Override
    public String toString() {
        // Implementar
        return this.mensaje + " @ " + this.fecha.toString() + " " + this.horario.toString();
    }

    @Override
    public boolean equals(Object otro) {
        if(otro == null || otro.getClass() != this.getClass()) return false;
        Recordatorio r = (Recordatorio) otro;
        return r.fecha.equals(this.fecha) && r.horario.equals(this.horario) && r.mensaje.equals(this.mensaje);
    }

}
