<%@page import="classes.Item"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<% 

int idItem = Integer.parseInt(request.getParameter("id"));

Item item = new Item(idItem);

item.delete();

String index = "http://localhost:8080/LeagueHelper";
response.sendRedirect(index);

%>