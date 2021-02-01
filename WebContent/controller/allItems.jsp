<!DOCTYPE HTML>

<%@page import="classes.Item"%>
<%@page import="classes.Usuario"%>
<%@page import="classes.Campeao"%>
<% 

Item item = new Item();
String lista = item.listAllMenu(); 

int logado = session.getAttribute("userlogin") == null ? 0 : (Integer) session.getAttribute("userlogin");
	
	Usuario conectado = new Usuario(logado);
	conectado.searchUser();
	
	String nome = conectado.getNome();

	if(logado == 0){%>
		<%@include file ="../views/headerDeslogado.html"%>
		<%@include file ="../views/footer.html" %>
	<%}else{%>
		<%@include file ="../views/headerLogado.jsp"%>
		<%@include file ="../views/footer.html" %>
<%
	}
%>

<html>
    <head>
        <meta charset="utf-8">
        <title>Itens</title>
        <link rel="shortcut icon" href="../views/imgs/favicon.png"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </head>
    <style>
        img{       
            height: 225px;
            object-fit: cover;
            width: 225px;  
        }
        .aligncenter {
            display: block;
            margin-left: auto;
            margin-right: auto;
            padding: 5px;
            text-align: center;
            background-color: black;
            border: 1px solid gold;
        }
        /* Dropdown Button */
		.dropbtn {
		  background-color: black;
		  color: white;
		  font-size: 15px;
		  border: none;
		}
		
		/* The container <div> - needed to position the dropdown content */
		.dropdown {
		  position: relative;
		  display: inline-block;
		}
		
		/* Dropdown Content (Hidden by Default) */
		.dropdown-content {
		  display: none;
		  position: absolute;
		  background-color: #f1f1f1;
		  min-width: 160px;
		  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		  z-index: 1;
		}
		
		/* Links inside the dropdown */
		.dropdown-content a {
		  color: black;
		  padding: 12px 16px;
		  text-decoration: none;
		  display: block;
		}
		
		/* Change color of dropdown links on hover */
		.dropdown-content a:hover {background-color: #ddd;}
		
		/* Show the dropdown menu on hover */
		.dropdown:hover .dropdown-content {display: block;}
		
		/* Change the background color of the dropdown button when the dropdown content is shown */
		.dropdown:hover .dropbtn {background-color: #3e8e41;}
    </style>
    <body style="background-image: url(../views/imgs/background_champions.jpg); background-repeat: no-repeat; background-size:cover; background-attachment: fixed;">
        <div class="container" style="background-color: rgba(0,0,0,0.5);">
            <div class="row ml-5 mt-5" style="color: black; padding-bottom:5%;">

			<%=lista %>
            </div>
        </div>
    </body>
</html>