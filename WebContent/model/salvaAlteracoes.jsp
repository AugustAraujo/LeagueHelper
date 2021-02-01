<%@page import="classes.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

int logado = session.getAttribute("userlogin") == null ? 0 : (Integer) session.getAttribute("userlogin");

Usuario conectado = new Usuario(logado);

conectado.searchUser();

conectado.setNome(request.getParameter("nome"));
conectado.setEmail(request.getParameter("email"));
conectado.setSenha(request.getParameter("senha"));

conectado.save();

%>
