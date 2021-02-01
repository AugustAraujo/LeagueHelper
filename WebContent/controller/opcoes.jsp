<%@page import="classes.Usuario"%>
<html>
	<%
	int logado = session.getAttribute("userlogin") == null ? 0 : (Integer) session.getAttribute("userlogin");
	
	Usuario conectado = new Usuario(logado);
	conectado.searchUser();
	
	String nome = conectado.getNome();
	String email = conectado.getEmail();
	String senha = conectado.getSenha();
	
	%>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="//db.onlinewebfonts.com/c/12420e8c141ca7c3dff41de2d59df13e?family=BeaufortforLOL-Bold" rel="stylesheet" type="text/css"/>
        <style>
        @font-face {font-family: "BeaufortforLOL-Bold"; src: url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.eot"); src: url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.eot?#iefix") format("embedded-opentype"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.woff2") format("woff2"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.woff") format("woff"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.ttf") format("truetype"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.svg#BeaufortforLOL-Bold") format("svg"); }
            p{
                font-size: large;
                color:white;
                text-align:left;
            }
            
            input{
                margin-left: auto;
                margin-right: auto;
            }
            
            a{
                text-decoration: none;
            }
            
            div#conteudo{
            	margin-left: auto;
                margin-right: auto;
            }
            
            div#container{
            	margin: 0;
            }
            
            form{
			box-shadow: 0px 0px 40px -3px #1bb1cb;
			}
			
			#btn_enviar, #btn_cancelar{
				border-color: #1bb1cb;
				color: black;
				background-image: -webkit-linear-gradient(45deg, #1bb1cb 50%, transparent 50%);
				background-image: linear-gradient(45deg, #1bb1cb 50%, transparent 50%);
				background-position: 100%;
				background-size: 400%;
				-webkit-transition: background 300ms ease-in-out;
				transition: background 300ms ease-in-out;
			}
			
			#btn_enviar, #btn_cancelar {
				background-position: 0;
			}
			
        </style>
    </head>
    <body style="height:100%;color:blue; background-image: url('../views/imgs/background_detalhar.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center; font-family:'BeaufortforLOL-Bold'; ">
        <div class="container">
        <br/><br/><br/>
            <form class="bg-dark h-75 w-75 p-5" style="margin-left:auto;margin-right:auto;border-radius: 10px;" id="alteraDados">
                <h2 style="color:white; text-align: center;" class="mb-5">Seus Dados</h2>
               		<div id="conteudo" class="w-50">
	                    <div class="row">
	                        <div class="col-12">
	                            <p>Nome:</p>
	                            <input type="text" class="form-control w-100" value="<%=nome %>" name="nome">
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-12">
	                            <br/>
	                            <p>Email:</p>
	                            <input type="text" class="form-control w-100" value="<%=email %>" name="email">
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-12">
	                            <br/>
	                            <p>Senha:</p>
	                            <input type="password" class="form-control w-100" name="senha" value="<%=senha %>">
	                        </div>
	                    </div>
	                    <div class="row mt-5">
	                        <div class="col-6 mt-5" style="margin-left:auto; margin-right: auto;">
	                            <input type="button" class="form-control" value="Confirmar" name="btn_enviar" id="btn_enviar">
	                        </div>
	                        <div class="col-6 mt-5" style="margin-left:auto; margin-right: auto;">
	                            <input type="button" class="form-control" value="Cancelar" name="btn_cancelar" id="btn_cancelar">
	                        </div>
	                    </div>
                    </div>
            </form>
            <script type="text/javascript">
				$(document).ready(
						function() {
							$("#btn_enviar").click(
								function() {
									var formData = $("#alteraDados").serialize();
									$.post("../model/salvaAlteracoes.jsp",formData,function(data,status) {
										alert("Dados alterados!");
										window.location.href = "../index.jsp";
									});
								}	
							);
							$("#btn_cancelar").click(
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