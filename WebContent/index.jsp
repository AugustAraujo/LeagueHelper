<!DOCTYPE html>
<%@page import="classes.Usuario"%>
<%@page import="java.sql.ResultSet"%>

<% 
	int logado = session.getAttribute("userlogin") == null ? 0 : (Integer) session.getAttribute("userlogin");
	
	Usuario conectado = new Usuario(logado);
	conectado.searchUser();
	
	String nome = conectado.getNome();
	int nivel = conectado.getIdNivelUsuario();

	if(logado == 0){%>
		<%@include file ="views/headerDeslogado.html"%>
		<%@include file ="views/footer.html" %>
	<%}else{%>
		<%@include file ="views/headerLogado.jsp"%>
		<%@include file ="views/footer.html" %>
	<%}
	
	
%>
<html lang="pt-BR">
  <head>
  	<title>League Helper</title>
    <meta charset="UTF-8">
	<meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link href="//db.onlinewebfonts.com/c/12420e8c141ca7c3dff41de2d59df13e?family=BeaufortforLOL-Bold" rel="stylesheet" type="text/css"/>
	<link rel="shortcut icon" href="views/imgs/icone.png" type="image/x-icon"/>
	<style>
		@font-face {font-family: "BeaufortforLOL-Bold"; src: url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.eot"); src: url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.eot?#iefix") format("embedded-opentype"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.woff2") format("woff2"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.woff") format("woff"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.ttf") format("truetype"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.svg#BeaufortforLOL-Bold") format("svg"); }
				
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
		
		a{
			text-decoration: none;
			color:white;
		}
	</style>
	</head>
  <body style="
  	background-image: url('views/imgs/background.png');   
  	background-repeat: no-repeat;
  	background-attachment: fixed;
 	background-position: center;
  	background-size:cover;
  	height:100%;
  	width:100%;
  	position:absolute;
  ">
    <header></header>
    <div id="" style="
    	font-family:'BeaufortforLOL-Bold'; 
    	color:white; 
    	align-items: center;
		display: flex;
		flex-direction: column;
		flex-wrap: wrap;
		justify-content: center;
		line-height:1;
		margin-top: 5%;
	">
    	<p style="font-size:72px;" class="mt-3">Bem-vindos ao</p>
    	<p style="font-size:72px;" class="">LeagueHelper</p>
    </div>
    <div class="w-100 mt-5">
    <table class="mx-5 px-5 mt-5" style="color:white; width:95%;" border=2>
    	<tr style="height:100px;" >
	    	<td colspan=2 style="font-size:25px; background-color: rgba(0,0,0,0.7);">
	    		<p style="margin-left:auto; margin-right:auto; width:50%;" class="mt-1">Descubra como itemizar seu personagem favorito para chegar ao topo do rank!</p>
	    	</td>
	   </tr>
	 </table>
	 <br/>
	 <table class="ml-5 pl-5" style="color:white; width:95%;" border=2>
	   <tr style="height:100px;">
	    	<td style="font-size:25px; background-color: rgba(0,0,0,1); width:30%;">
	    		<a href="controller/allChampions.html"><p style="margin-left:auto; margin-right:auto; width:30%;" class="mt-2">Personagens</p></a>
	    	</td>
	    	<td style="font-size:25px; background-color: rgba(0,0,0,0.6);">
	    		<p style="margin-left:auto; margin-right:auto; width:50%;" class="mt-1">Descubra como itemizar seu personagem favorito para chegar ao topo do rank!</p>
	    	</td>
	   </tr>
    </table>
    <br/>
    <table class="ml-5 pl-5" style="color:white; width:95%;" border=2>
	   <tr style="height:100px;">
	    	<td style="font-size:25px; background-color: rgba(0,0,0,0.6);">
	    		<p style="margin-left:auto; margin-right:auto; width:30%;" class="mt-2">Analise os itens e seus efeitos!</p>
	    	</td>
	    	<td style="font-size:25px; background-color: rgba(0,0,0,1); width:30%; ">
	    		<a href=""><p style="margin-left:auto; margin-right:auto; width:15%;" class="mt-2">Itens</p></a>
	    	</td>
	   </tr>
    </table>
    </div>  
    <footer></footer>
  </body>
  
</html>