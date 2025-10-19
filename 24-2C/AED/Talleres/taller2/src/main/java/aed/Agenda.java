package aed;

public class Agenda {

    private Fecha fechaActual;
    private ArregloRedimensionableDeRecordatorios recordatorios;

    public Agenda(Fecha fechaActual) {
        this.recordatorios = new ArregloRedimensionableDeRecordatorios();
        this.fechaActual = new Fecha(fechaActual);
    }

    public void agregarRecordatorio(Recordatorio recordatorio) {
        this.recordatorios.agregarAtras(recordatorio);
    }

    @Override
    public String toString() {
        String res = this.fechaActual.toString() + "\n" + "=====" + "\n";
        for(int i = 0; i < this.recordatorios.longitud(); i++){
            Recordatorio recordatorio = this.recordatorios.obtener(i);
            if(this.fechaActual.equals(recordatorio.fecha())){
                res += recordatorio.toString() + "\n"; 
            }
        }
        return res;

    }

    public void incrementarDia() {
        this.fechaActual.incrementarDia();
    }

    public Fecha fechaActual() {
        return new Fecha(this.fechaActual);
    }

}
