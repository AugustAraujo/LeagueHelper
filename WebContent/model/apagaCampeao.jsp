<%@page import="classes.Campeao"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<% 

int idCampeao = Integer.parseInt(request.getParameter("id"));

Campeao conectado = new Campeao(idCampeao);

conectado.delete();

String index = "http://localhost:8080/LeagueHelper";
response.sendRedirect(index);

%>