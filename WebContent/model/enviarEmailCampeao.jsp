<%@page import="classes.Usuario"%>
<%@page import="java.io.Console"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.DBQuery"%>
<%@page import="mail.SendMail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
	int logado = session.getAttribute("userlogin") == null ? 0 : (Integer) session.getAttribute("userlogin");
	
	Usuario conectado = new Usuario(logado);
	conectado.searchUser();

	String email = conectado.getEmail();
	String nome = conectado.getNome();
	
	String campeao = request.getParameter("nomeCampeao");
	String titulo = request.getParameter("tituloCampeao");
	String rota = request.getParameter("rotaCampeao");
	
	// por onde eu vou mandar esse email
	String smtpHost = "smtp.gmail.com"; 
	String smtpPort = "587"; 
	String username = "araujo.augusto144@gmail.com";
	String password = "Augusto1403#";
	String auth     = "tls";  
	SendMail sendMail =  new SendMail( smtpHost,  smtpPort,  username,  password,  auth  );
	
	// a mensagem do email e pra quem vou enviar
	
	System.out.println(email);
	
	String mailFrom 	= "araujo.augusto144@gmail.com"; 
 	String mailTo 		= "araujo.augusto144@gmail.com"; 
 	
 	String mailSubject 	= "Solicitação de inserção de campeão"; 
 	String mailBody 	= "Um usuário está solicitando a adição do campeão " + campeao + ", que tem titulo " + titulo + " e é usado na rota " + rota; 
	sendMail.send( mailFrom, mailTo, mailSubject, mailBody );
	
	String messagem = "foi enviado para o email "+ mailTo +" a senha gerada automaticamente!";

%>

