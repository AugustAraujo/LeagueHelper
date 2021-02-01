<%@page import="classes.Campeao"%>
<%
	Campeao campeao = new Campeao();
	String lista = campeao.listAllMenu();
%>
<!DOCTYPE html>
<html lang="pt-BR">
  <head>
  	<title>League Helper</title>
    <meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link href="//db.onlinewebfonts.com/c/12420e8c141ca7c3dff41de2d59df13e?family=BeaufortforLOL-Bold" rel="stylesheet" type="text/css"/>
	<style>
		@font-face {font-family: "BeaufortforLOL-Bold"; src: url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.eot"); src: url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.eot?#iefix") format("embedded-opentype"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.woff2") format("woff2"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.woff") format("woff"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.ttf") format("truetype"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.svg#BeaufortforLOL-Bold") format("svg"); }
	</style>
	</head>
  <body style="
  	background-image: url('../views/imgs/background.png');   
  	background-repeat: no-repeat;
  	background-attachment: fixed;
 	background-position: center;
  	background-size:cover;
  	height:100%;
  	width:100%;
  	position:absolute;
  ">
	<%=lista %>
</body>
</html>