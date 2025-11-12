package org.uv.modelo;

import java.util.List;

public interface IEmpleadoDAO {
    void insertar(Empleado empleado);
    void actualizar(Empleado empleado);
    void eliminar(int clave);
    Empleado obtenerPorClave(int clave);
    List<Empleado> listar();
}
