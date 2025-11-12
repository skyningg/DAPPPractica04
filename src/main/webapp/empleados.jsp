<%@ page import="org.uv.modelo.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    EmpleadoDAO dao = new EmpleadoDAO();
    List<Empleado> empleados = dao.listar();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRUD Empleados (PostgreSQL + JSP + DAO)</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #fdf6f9;
            margin: 20px;
            color: #333;
        }
        h2 {
            text-align: center;
            color: #4CAF50;
        }
        form {
            max-width: 600px;
            margin: 20px auto;
            background: #fff0f5;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        label {
            display: inline-block;
            width: 100px;
            font-weight: bold;
        }
        input[type="text"] {
            width: calc(100% - 120px);
            padding: 6px;
            margin-bottom: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            margin-right: 8px;
        }
        button:hover {
            background-color: #45a049;
        }
        .btn-delete {
            background-color: #ff4d6d;
        }
        .btn-delete:hover {
            background-color: #ff1a4d;
        }
        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 20px;
            text-align: left;
        }
        th {
            background: linear-gradient(45deg, #4CAF50, #81C784);
            color: white;
        }
        tr:nth-child(even) {
            background-color: #fff0f5;
        }
        tr:hover {
            background-color: #d0f0c0;
        }
    </style>
</head>
<body>
<h2>Gestión de Empleados</h2>

<form method="POST" action="controlador.jsp">
    <input type="hidden" name="accion" value="crear" id="accion">
    <input type="hidden" name="clave" id="clave">
    <label>Nombre:</label><input type="text" name="nombre" id="nombre" required><br>
    <label>Dirección:</label><input type="text" name="direccion" id="direccion" required><br>
    <label>Teléfono:</label><input type="text" name="telefono" id="telefono" required><br>
    <button type="submit">Guardar</button>
</form>

<table>
    <tr>
        <th>Clave</th><th>Nombre</th><th>Dirección</th><th>Teléfono</th><th>Acciones</th>
    </tr>
    <% for (Empleado e : empleados) { %>
        <tr>
            <td><%= e.getClave() %></td>
            <td><%= e.getNombre() %></td>
            <td><%= e.getDireccion() %></td>
            <td><%= e.getTelefono() %></td>
            <td>
                <form method="POST" action="controlador.jsp" style="display:inline">
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="clave" value="<%= e.getClave() %>">
                    <button type="submit" class="btn-delete">Eliminar</button>
                </form>
                <button onclick="editar('<%= e.getClave() %>', '<%= e.getNombre() %>', '<%= e.getDireccion() %>', '<%= e.getTelefono() %>')">Editar</button>
            </td>
        </tr>
    <% } %>
</table>

<script>
function editar(clave, nombre, direccion, telefono) {
    document.getElementById('clave').value = clave;
    document.getElementById('nombre').value = nombre;
    document.getElementById('direccion').value = direccion;
    document.getElementById('telefono').value = telefono;
    document.getElementById('accion').value = 'actualizar';
}
</script>
</body>
</html>
