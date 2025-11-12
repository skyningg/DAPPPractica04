<%@ page import="org.uv.modelo.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String accion = request.getParameter("accion");
    EmpleadoDAO dao = new EmpleadoDAO();

    if ("crear".equals(accion)) {
        Empleado e = new Empleado();
        e.setNombre(request.getParameter("nombre"));
        e.setDireccion(request.getParameter("direccion"));
        e.setTelefono(request.getParameter("telefono"));
        dao.insertar(e);
    } else if ("actualizar".equals(accion)) {
        Empleado e = new Empleado();
        e.setClave(Integer.parseInt(request.getParameter("clave")));
        e.setNombre(request.getParameter("nombre"));
        e.setDireccion(request.getParameter("direccion"));
        e.setTelefono(request.getParameter("telefono"));
        dao.actualizar(e);
    } else if ("eliminar".equals(accion)) {
        int clave = Integer.parseInt(request.getParameter("clave"));
        dao.eliminar(clave);
    }

    response.sendRedirect("empleados.jsp");
%>
