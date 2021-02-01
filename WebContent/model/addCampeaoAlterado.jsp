<%@page import="classes.Build"%>
<%@page import="classes.Campeao"%>
<% 
	
	int idCampeao = Integer.parseInt(request.getParameter("idCampeao"));
	int idBuild = Integer.parseInt(request.getParameter("idBuild"));
	
	Campeao campeao = new Campeao(idCampeao);
	Build build = new Build(idBuild);
	
	campeao.setNomeCampeao(request.getParameter("nomeCampeao"));
	campeao.setTituloCampeao(request.getParameter("tituloCampeao"));
	campeao.setSplashCampeao(request.getParameter("fotoCampeao"));
	campeao.setId_rota(Integer.parseInt(request.getParameter("rota")));
	
	campeao.save();
	
	build.setId_build(idBuild);
	build.setId_campeao(idCampeao);
	build.setId_item1(Integer.parseInt(request.getParameter("build1")));
	build.setId_item2(Integer.parseInt(request.getParameter("build2")));
	build.setId_item3(Integer.parseInt(request.getParameter("build3")));
	build.setId_item4(Integer.parseInt(request.getParameter("build4")));
	build.setId_item5(Integer.parseInt(request.getParameter("build5")));
	build.setId_item6(Integer.parseInt(request.getParameter("build6")));
	
	build.save();
%>