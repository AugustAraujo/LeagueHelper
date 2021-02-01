<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="classes.Usuario"%>
<% 

int idUsuario = Integer.parseInt(request.getParameter("id"));

Usuario conectado = new Usuario(idUsuario);

conectado.delete();

String index = "http://localhost:8080/LeagueHelper";
response.sendRedirect(index);

%>