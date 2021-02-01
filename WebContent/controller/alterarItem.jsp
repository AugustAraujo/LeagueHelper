<%@page import="classes.Usuario"%>
<%@page import="classes.Item"%>
<html>
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
	
		int idItem = Integer.parseInt(request.getParameter("id"));
		Item item = new Item(idItem);
		
		item.searchItem();
		
		String nomeItem = item.getNome_item();
		String fotoItem = item.getLogo_item();
		String efeito1 = item.getStatus_item1();
		String efeito2 = item.getStatus_item2();
		String efeito3 = item.getStatus_item3();
		String efeito4 = item.getStatus_item4();
		int itemPreco = item.getPreco_item();
		
	%>
    <head>
        <title>League Helper</title>
    <meta charset="UTF-8">
	<meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
	<link href="//db.onlinewebfonts.com/c/12420e8c141ca7c3dff41de2d59df13e?family=BeaufortforLOL-Bold" rel="stylesheet" type="text/css"/>
	<link rel="shortcut icon" href="views/imgs/icone.png" type="image/x-icon"/>
	<style>
		@font-face {font-family: "BeaufortforLOL-Bold"; src: url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.eot"); src: url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.eot?#iefix") format("embedded-opentype"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.woff2") format("woff2"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.woff") format("woff"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.ttf") format("truetype"), url("//db.onlinewebfonts.com/t/12420e8c141ca7c3dff41de2d59df13e.svg#BeaufortforLOL-Bold") format("svg"); }
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
        </style>
    </head>
    <body style="color: white;font-style:BeaufortforLOL-BoldL; background-image: url('../views/imgs/background_detalhar.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center;">
        <div class="container">
            <form class="bg-dark h-75 w-75 p-5" style="margin:auto; margin-top:6%; border-radius: 10px; font-weight: bold;" id="insereItem">
                <div class="centralizar w-50" style="margin-left: auto; margin-right: auto;">
                    <h2 style="color:white; text-align: center;" class="mb-5">Inserir item</h2>
                    <div class="row">
                        <div class="col-12">
                            <p>Nome:</p>
                            <input type="text" class="form-control" id="nomeItem" name="nomeItem" value="<%=nomeItem %>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <p>Foto:</p>
                            <input type="text" class="form-control" id="fotoItem" name="fotoItem" value="<%=fotoItem %>">
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-6">
                            <p>Efeito 1:</p>
                                <input type="text" class="form-control" id="item_efeito1" name="item_efeito1" value="<%=efeito1 %>">
                            
                        </div>
                        <div class="col-6">
                            <p>Efeito 2: </p>
                                <input type="text" class="form-control" id="item_efeito2" name="item_efeito2" value="<%=efeito2 %>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <p>Efeito 3:</p>
                                <input type="text" class="form-control" id="item_efeito3" name="item_efeito3" value="<%=efeito3 %>">
                            
                        </div>
                        <div class="col-6">
                            <p>Efeito 4: </p>
                                <input type="text" class="form-control" id="item_efeito4" name="item_efeito4" value="<%=efeito4 %>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <p>Preço:</p>
                                <input type="text" class="form-control" id="item_preco" name="item_preco" value="<%=itemPreco %>">    
                        </div>
                    </div>
                    <input type="hidden" id="idItem" name="idItem" value="<%=idItem %>">
                    <div class="row">
                        <div class="col-6 mt-5" style="margin-left:auto; margin-right: auto;">
                            <a href="#"><input type="button" class="form-control" value="Confirmar" id="btn_enviar"></a>
                        </div>
                        <div class="col-6 mt-5" style="margin-left:auto; margin-right: auto;">
                            <a href="#"><input type="button" class="form-control" value="Cancelar" id="btn_cancelar"></a>
                        </div>
                    </div>
                </div>
            </form>
            <script type="text/javascript">
			
				$(document).ready(
					function() { 
						$("#btn_enviar").click(
							function() {
								var formData = $("#insereItem").serialize();
								$.post("../model/salvaAlteracaoItem.jsp",formData,function(data,status) {
									alert("Item inserido!");
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