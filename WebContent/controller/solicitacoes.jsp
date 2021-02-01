<%@page import="classes.Usuario"%>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	int logado = session.getAttribute("userlogin") == null ? 0 : (Integer) session.getAttribute("userlogin");
	
	Usuario conectado = new Usuario(logado);
	conectado.searchUser();
	
	String nome = conectado.getNome();
	int nivel = conectado.getIdNivelUsuario();

	if(logado == 0){%>
		<%@include file ="../views/headerDeslogado.html"%>
		<%@include file ="../views/footer.html" %>
	<%}else{%>
		<%@include file ="../views/headerLogado.jsp"%>
		<%@include file ="../views/footer.html" %>
	<%}
    %>
    <head>
    	<title>Solicitações</title>
		<meta charset="UTF-8">
		<meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
		<link href="//db.onlinewebfonts.com/c/12420e8c141ca7c3dff41de2d59df13e?family=BeaufortforLOL-Bold" rel="stylesheet" type="text/css"/>
		<link rel="shortcut icon" href="views/imgs/icone.png" type="image/x-icon"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
       		@font-face {font-family: "BeaufortforLOL-Bold"; src: url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.eot"); src: url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.eot?#iefix") format("embedded-opentype"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.woff2") format("woff2"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.woff") format("woff"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.ttf") format("truetype"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.svg#BeaufortforLOL-Bold") format("svg"); }
            p{
                font-size: large;
                color:white;
                text-align:center;
            }
            input{
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }
            a{
                text-decoration: none;
                color: white;
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
    </head>
    <body style="color:blue; background-image: url('../views/imgs/background_detalhar.jpg'); background-repeat: no-repeat; font-family:'BeaufortforLOL-Bold';background-size: cover; background-position: center;">
        <div class="container">
            <div class="bg-dark h-75 w-75 p-5" style="margin:auto; margin-top:6%; border-radius: 10px;">
                <h2 style="color:white; text-align: center;" class="mb-5">Solicitações</h2>
                <div class="row" style="color:white;">
                	<div class="col-12">
                    	<h3 style="text-align:center;">Qual o tipo de solicitação?</h3>
                    </div>
                 </div>
                 <br/><br/><br/>
                 <div class="row" style="color:white;">
	             	<div class="col-6" style="text-align:center;">
	                	<input type="radio" style="width:20%;" name="radio" id="radio1" checked>Solicitar cargo maior
	                </div>
	                <div class="col-6" style="text-align:center;">
                    	<input type="radio" style="width:20%;" name="radio" id="radio2">Solicitar adição de campeão
                    </div>
                 </div>
                 <div class="row w-50" style="margin-left:auto; margin-right:auto;">
                 	<div class="col-12" style="color:white; text-align:center;">
                    	<input type="radio" style="width:20%; margin-left: auto; margin-right: auto;" name="radio" id="radio3">Solicitar adição de item
                    </div>
                 </div>
                 <div class="h-50" style="display:none; border: solid; border-color:#F5BD43;" id="divCargo">
                 	<form id="solicitaCargo">
	                 	<p>Por que você deve virar moderador?</p>
	                 	<textarea form="solicitaCargo" name="motivosCargo" class="h-50 w-75" id="motivosCargo" style="margin-left:12.5%;"></textarea>
	                 	<div class="row mt-5">
		                        <div class="col-3" style="margin-left:auto; margin-right: auto;">
		                            <input type="button" style="background-color:#F5BD43; border-color: black;" class="form-control" value="Enviar" name="btn_enviar" id="btn_enviar_motivo">
		                        </div>
		                        <div class="col-3" style="margin-left:auto; margin-right: auto;">
		                            <input type="button" class="form-control" style="background-color:#F5BD43; border-color: black;" value="Cancelar" name="btn_cancelar" id="btn_cancelar">
		                        </div>
		                    </div>
	                </form>
                 </div>
                 <div class="h-50" id="divCampeao" style="display:none; border: solid; border-color:gold;">
                 	<form id="solicitaCampeao">
	                 	<p class="mt-5">Qual campeão precisamos adicionar?
	                 	<input type="text" id="nomeCampeao" name="nomeCampeao"></p>
	                 	<p>Qual o título do campeão?
	                 	<input type="text" id="tituloCampeao" name="tituloCampeao"></p>
	                 	<p>Qual a rota do campeão?
	                 	<input type="text" id="rotaCampeao" name="rotaCampeao"></p>
	                 	<div class="row mt-5">
		                        <div class="col-3" style="margin-left:auto; margin-right: auto;">
		                            <input type="button" style="background-color:#F5BD43; border-color: black;" class="form-control" value="Enviar" name="btn_solicitar_campeao" id="btn_solicitar_campeao">
		                        </div>
		                        <div class="col-3" style="margin-left:auto; margin-right: auto;">
		                            <input type="button" class="form-control" style="background-color:#F5BD43; border-color: black;" value="Cancelar" name="btn_cancelar" id="btn_cancelar1">
		                        </div>
		                    </div>
	                </form>
                 </div>
                 <div class="h-50" id="divItem" style="display:none; border: solid; border-color:gold;">
                 	<form id="solicitaItem">
	                 	<p class="mt-1">Qual item precisamos adicionar?
	                 	<input type="text" id="nomeItem" name="nomeItem"></p>
	                 	<p>Qual o preço do item?
	                 	<input type="text" id="precoItem" name="precoItem"></p>
	                 	<p>Nos conte seus efeitos?
	                 	<textarea form="solicitaItem" name="efeitosItem" class="h-50 w-75" id="efeitosItem" style="margin-left:12.5%;"></textarea>
	                 	<div class="row mt-5">
		                        <div class="col-3" style="margin-left:auto; margin-right: auto;">
		                            <input type="button" style="background-color:#F5BD43; border-color: black;" class="form-control" value="Enviar" name="btn_solicitar_item" id="btn_solicitar_item">
		                        </div>
		                        <div class="col-3" style="margin-left:auto; margin-right: auto;">
		                            <input type="button" class="form-control" style="background-color:#F5BD43; border-color: black;" value="Cancelar" name="btn_cancelar" id="btn_cancelar2">
		                        </div>
		                    </div>
	                </form>
                 </div>
            </div>
            <script type="text/javascript">
 
            	$(document).ready(
					function() {
						$("#radio1").click(
							function() {
								 document.getElementById("divCargo").style.display = "block";
								 document.getElementById("divCampeao").style.display = "none";
								 document.getElementById("divItem").style.display = "none";
							}	
						);
						$("#radio2").click(
							function() {
								document.getElementById("divCargo").style.display = "none";
								document.getElementById("divCampeao").style.display = "block";
								document.getElementById("divItem").style.display = "none";
							}	
						);
						$("#radio3").click(
							function() {
								document.getElementById("divCargo").style.display = "none";
								document.getElementById("divCampeao").style.display = "none";
								document.getElementById("divItem").style.display = "block";
							}	
						);


						$("#btn_enviar_motivo").click(
							function() {
								var formData = $("#solicitaCargo").serialize();
								$.post("../model/enviarEmailSolicitacao.jsp",formData,function(data,status) {
									alert("Solicitação enviada para análise!");
									window.location.href = "../index.jsp";
								});
							}	
						);
						
						$("#btn_solicitar_campeao").click(
								function() {
									var formData = $("#solicitaCampeao").serialize();
									$.post("../model/enviarEmailCampeao.jsp",formData,function(data,status) {
										alert("Solicitação enviada para análise!");
										window.location.href = "../index.jsp";
									});
								}	
							);
						
						$("#btn_solicitar_item").click(
								function() {
									var formData = $("#solicitaItem").serialize();
									$.post("../model/enviarEmailItem.jsp",formData,function(data,status) {
										alert("Solicitação enviada para análise!");
										window.location.href = "../index.jsp";
									});
								}	
							);
						
						$('#btn_cancelar').click(
								function() {
									window.location.href = "../index.jsp";
								}
							);
						$('#btn_cancelar1').click(
								function() {
									window.location.href = "../index.jsp";
								}
							);
						$('#btn_cancelar2').click(
								function() {
									window.location.href = "../index.jsp";
								}
							);
					}
				);
			</script>
        </div>
    </body>
</html>