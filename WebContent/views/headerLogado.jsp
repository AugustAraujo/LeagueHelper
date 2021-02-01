<style>
	#linkHeader:hover{
		color: red;
	}
</style>
<div id="header" style="background-color:black; height:45px; font-size:15px; width:100%; position:fixed; top:0; z-index:4;" class="mx-auto p-1">
	<div class="row mt-2" style="width:100%;">
		<div class="row ml-5 pl-5" style="width:20%;">
			<div class="col"><a href="http://localhost:8080/LeagueHelper/controller/campeoes.jsp" style="color:white;" id="linkHeader">Personagens</a></div>
			<div class="col"><a href="http://localhost:8080/LeagueHelper/controller/allItems.jsp" style="color:white;"  class="linkHeader" id="itens">Itens</a></div>
		</div>
		<div class="row mr-5 pr-5 w-25" style="right:0; width:30%; position:fixed;">
			<div class="dropdown col">
				<button class="dropbtn"><%=nome %></button>
				<div class="dropdown-content">
			    	<a href="http://localhost:8080/LeagueHelper/controller/solicitacoes.jsp">Solicitar</a>
			    	
			    	<%
			    		if(conectado.getIdNivelUsuario() == 1){
			    			%>
			    				<a href="http://localhost:8080/LeagueHelper/controller/adminPage.jsp">Gerenciar</a>
			    				<a href="http://localhost:8080/LeagueHelper/controller/inserirCampeao.jsp">Adicionar Personagem</a>
			    				<a href="http://localhost:8080/LeagueHelper/controller/inserirItem.jsp">Adicionar Item</a>
			    			<%
			    		}
			    	%>
			    	
			    	<a href="http://localhost:8080/LeagueHelper/controller/opcoes.jsp">Alterar dados pessoais</a>
			    	<a href="http://localhost:8080/LeagueHelper/model/desconectaUsuario.jsp">Desconectar</a>
			  	</div>
			</div>
		</div>
	</div>
	
</div>

