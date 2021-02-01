<%@page import="classes.Item"%>
<%@page import="classes.Build"%>
<%@page import="classes.Rota"%>
<%@page import="classes.Campeao"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.Usuario"%>
<% 
	int logado = session.getAttribute("userlogin") == null ? 0 : (Integer) session.getAttribute("userlogin");
	
	//Conexão do usuário
	Usuario conectado = new Usuario(logado);
	conectado.searchUser();
	String nome = conectado.getNome();
	
	//Seleção do campeão
	int idCampeao = Integer.parseInt(request.getParameter("id"));
	Campeao selecionado = new Campeao(idCampeao);
	selecionado.searchChampion();
	
	//Coleta dados
	String nomeCampeao = selecionado.getNomeCampeao();
	String tituloCampeao = selecionado.getTituloCampeao();
	String fotoCampeao = selecionado.getSplashCampeao();
	int id_lane = selecionado.getId_rota();
	
	//Coleta foto da rota
	Rota rota = new Rota(id_lane);
	rota.searchRota();
	String foto_rota = rota.getFoto_lane();
	
	//Coleta build
	Build build = new Build(idCampeao);
	build.searchBuild();
	
	Item item = new Item(build.getId_item1());
	
	item.searchItem();
	String espaco1 = item.getLogo_item();
	
	item.setId_item(build.getId_item2());
	item.searchItem();
	String espaco2 = item.getLogo_item();
	
	item.setId_item(build.getId_item3());
	item.searchItem();
	String espaco3 = item.getLogo_item();
	
	item.setId_item(build.getId_item4());
	item.searchItem();
	String espaco4 = item.getLogo_item();
	
	item.setId_item(build.getId_item5());
	item.searchItem();
	String espaco5 = item.getLogo_item();
	
	item.setId_item(build.getId_item6());
	item.searchItem();
	String espaco6 = item.getLogo_item();
	
	
	//Verificação de qual header usar
	if(logado == 0){%>
		<%@include file ="../views/headerDeslogado.html"%>
		<%@include file ="../views/footer.html" %>
	<%}else{%>
		<%@include file ="../views/headerLogado.jsp"%>
		<%@include file ="../views/footer.html" %>
	<%}
	
	
%>
<html lang="pt-BR">
  <head>
  	<title>League Helper</title>
    <meta charset="UTF-8">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
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
		
		div.container{
			box-shadow: 0px 0px 40px -3px #bbbbbb;
		}
		a{
			text-decoration: none;
		}
	</style>
	</head>
    <body style="color:blue; 
    			background-image: url('../views/imgs/background_champions.jpg'); 
    			background-repeat: no-repeat; 
    			background-size: cover; 
    			background-position: center;">
        <div class="container w-75 mt-5" style="background-image: linear-gradient(rgba(0,0,0,0.3),rgba(0,0,0,0.4)), url('../views/imgs/campeoes/<%=fotoCampeao %>'); height: 88.5%; background-size: cover; background-size:100% 100%; background-repeat: no-repeat; position:relative;">
            <div class="w-50" style="margin-left: auto; margin-right: auto;">
                <br/>
                <table style="background-color: rgba(0,0,0,0.3); text-align: center;" class="w-100 mt-5">
                    <tr>
                        <td>
                            <p style="color:white; font-size:4rem; font-weight: bold;"><%=nomeCampeao %></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p style="color:white; font-size:2rem; font-weight: bold;"><%=tituloCampeao %></p>
                        </td>
                    </tr>
                </table>
            </div>

            <div style="width:97%; bottom:15; position: absolute;">
                <br/>
                <table style="background-color: rgba(0,0,0,0.3);" class="w-100 mt-5">
                    <tr>
                        <td class="w-50" style="text-align: center;">
                            <p style="color:white; font-size:4rem; font-weight: bold;">Rota: 
                                <img src="../views/imgs/Lanes/<%=foto_rota %>" style="width:20%; height:20%;" /></p>
                        </td>
                        <td style="text-align: center;">
                            <p style="color:white; font-size:2rem; font-weight: bold;">Build recomendada:</p>
                            <p class="build">
                                <img src="../views/imgs/itens_pic/<%=espaco1%>" style="width:12%; height:5%;" />
                                <img src="../views/imgs/itens_pic/<%=espaco2%>" style="width:12%; height:5%;" />
                                <img src="../views/imgs/itens_pic/<%=espaco3%>" style="width:12%; height:5%;" />
                                <img src="../views/imgs/itens_pic/<%=espaco4%>" style="width:12%; height:5%;" />
                                <img src="../views/imgs/itens_pic/<%=espaco5%>" style="width:12%; height:5%;" />
                                <img src="../views/imgs/itens_pic/<%=espaco6%>" style="width:12%; height:5%;" />
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
            
        </div>
    </body>
</html>