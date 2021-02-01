
<%@page import="classes.Usuario"%>
<%@page import="multitool.RandomCode"%>
<%@page import="mail.SendMail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 
	//  faz a recepção de dados
	String nome = request.getParameter("nome");
    String email = request.getParameter("user");
	if (email == null)
		email = "";
	
	if (nome == null)
		nome = "";
    
	String gerarSenha = new Usuario(email).newPassword();
	Usuario usuario = new Usuario(0, nome, email, gerarSenha, 2, 0);
	//  Inserir no banco de Dados o usuário com esta senha
	usuario.save();


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
 	String mailTo 		= email; 
 	String mailSubject 	= "Testando envio automatizado"; 
 	String mailBody 	= " Foi gerado pro sistema tal, usuário "+ mailTo +
 						  " e senha "+ gerarSenha ; 
	sendMail.send( mailFrom, mailTo, mailSubject, mailBody );
	
	String messagem = "Foi enviado para o email "+ mailTo +" a senha gerada automaticamente!";
%>


</body>
</html>