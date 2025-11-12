package org.uv.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO implements IEmpleadoDAO {

    @Override
    public void insertar(Empleado e) {
        String sql = "INSERT INTO empleados (nombre, direccion, telefono) VALUES (?, ?, ?)";
        try (Connection con = ConexionPG.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getDireccion());
            ps.setString(3, e.getTelefono());
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void actualizar(Empleado e) {
        String sql = "UPDATE empleados SET nombre=?, direccion=?, telefono=? WHERE clave=?";
        try (Connection con = ConexionPG.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getDireccion());
            ps.setString(3, e.getTelefono());
            ps.setInt(4, e.getClave());
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void eliminar(int clave) {
        String sql = "DELETE FROM empleados WHERE clave=?";
        try (Connection con = ConexionPG.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, clave);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public Empleado obtenerPorClave(int clave) {
        String sql = "SELECT * FROM empleados WHERE clave=?";
        try (Connection con = ConexionPG.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, clave);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Empleado(
                        rs.getInt("clave"),
                        rs.getString("nombre"),
                        rs.getString("direccion"),
                        rs.getString("telefono")
                );
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Empleado> listar() {
        List<Empleado> lista = new ArrayList<>();
        String sql = "SELECT * FROM empleados ORDER BY clave";
        try (Connection con = ConexionPG.getConexion();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                lista.add(new Empleado(
                        rs.getInt("clave"),
                        rs.getString("nombre"),
                        rs.getString("direccion"),
                        rs.getString("telefono")
                ));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }
}
