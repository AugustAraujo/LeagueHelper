<%@page import="classes.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

Usuario conectado = new Usuario(idUsuario);

conectado.searchUser();

System.out.println(idUsuario);

conectado.setNome(request.getParameter("nome"));
conectado.setEmail(request.getParameter("email"));
conectado.setSenha(request.getParameter("senha"));

conectado.save();

%>
