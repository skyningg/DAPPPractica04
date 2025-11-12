package org.uv.modelo;

public class Empleado {
    private int clave;
    private String nombre;
    private String direccion;
    private String telefono;

    public Empleado() {}

    public Empleado(int clave, String nombre, String direccion, String telefono) {
        this.clave = clave;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public int getClave() { return clave; }
    public void setClave(int clave) { this.clave = clave; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }
}
