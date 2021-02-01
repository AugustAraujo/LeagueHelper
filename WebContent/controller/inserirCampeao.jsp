<%@page import="classes.Item"%>
<%@page import="classes.Usuario"%>
<html>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
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
	<%}
	
	Item build = new Item();
	String select = build.selectItem();
	 
	 %>
	
    <head>
        <meta charset="UTF-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
		<link href="//db.onlinewebfonts.com/c/12420e8c141ca7c3dff41de2d59df13e?family=BeaufortforLOL-Bold" rel="stylesheet" type="text/css"/>
		<link rel="shortcut icon" href="views/imgs/icone.png" type="image/x-icon"/>
	<style>
            p{
                font-size: large;
                color:white;
                text-align:left;
            }
            input{
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }
            a{
                text-decoration: none;
            }
            select.itens{
                width: 64px;
                height: 64px;
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
    <body style="color:blue; background-image: url('../views/imgs/background_detalhar.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center;">
        <div class="container">
            <form class="bg-dark h-75 w-75 p-5" style="margin:auto; margin-top:6%; border-radius: 10px;" id="insereCampeao">
                <div class="centralizar w-50" style="margin-left: auto; margin-right: auto;">
                    <h2 style="color:white; text-align: center;" class="mb-5">Inserir campeão</h2>
                    <div class="row">
                        <div class="col-12">
                            <p>Nome:</p>
                            <input type="text" class="form-control" id="nomeCampeao" name="nomeCampeao">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <p style="margin-bottom:0; margin-top:2%;">Titulo:</p>
                            <input type="text" class="form-control" id="tituloCampeao" name="tituloCampeao">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <p style="margin-bottom:0; margin-top:2%;">Foto:</p>
                            <input type="text" class="form-control" id="fotoCampeao" name="fotoCampeao">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12" style="margin-left: 25%;">
                            <br/>
                            <p style=>Rota: 
                            <select name="rota" id="rota">
                                <option value="1">Top</option>
                                <option value="2" selected>Mid</option>
                                <option value="5">Jungle</option>
                                <option value="4">Atirador</option>
                                <option value="3">Suporte</option>
                            </select></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <br/>
                            <p>Build:</p>
                            <div style="margin-left:12.5%;">
	                            <select name="build1" id="build1" class="col-3">
	                            	<%=select %>
	                            </select>
	                            <select name="build2" id="build2" class="col-3">
	                            	<%=select %>
	                            </select>
	                            <select name="build3" id="build3" class="col-3">
	                            	<%=select %>
	                            </select>
	                            <select name="build4" id="build4" class="col-3">
	                            	<%=select %>
	                            </select>
	                            <select name="build5" id="build5" class="col-3">
	                            	<%=select %>
	                            </select>
	                            <select name="build6" id="build6" class="col-3">
	                            	<%=select %>
	                            </select>
							</div>
							<br/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 mt-2" style="margin-left:auto; margin-right: auto;">
                            <input type="button" class="form-control" value="Confirmar" id="btn_enviar">
                        </div>
                        <div class="col-6 mt-2" style="margin-left:auto; margin-right: auto;">
                            <input type="button" class="form-control" value="Cancelar" id="btn_cancelar">
                        </div>
                    </div>
                </div>
            </form>
            
            <script type="text/javascript">
			
				$(document).ready(
					function() { 
						$("#btn_enviar").click(
							function() {
								var formData = $("#insereCampeao").serialize();
								$.post("../model/addCampeao.jsp",formData,function(data,status) {
								},'json');
								window.location.href = "../index.jsp";
							}
						);
						$('#btn_cancelar').click(
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