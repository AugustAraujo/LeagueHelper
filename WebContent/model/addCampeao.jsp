<%@page import="classes.Build"%>
<%@page import="classes.Campeao"%>
<% 
	Campeao campeao = new Campeao();
	Build build = new Build();

	campeao.setIdCampeao(0);
	campeao.setNomeCampeao(request.getParameter("nomeCampeao"));
	campeao.setTituloCampeao(request.getParameter("tituloCampeao"));
	campeao.setSplashCampeao(request.getParameter("fotoCampeao"));
	campeao.setId_rota(Integer.parseInt(request.getParameter("rota")));
	
	campeao.save();
	
	int lastID = campeao.returnLastChamp();
	
	build.setId_build(0);
	build.setId_campeao(lastID);
	build.setId_item1(Integer.parseInt(request.getParameter("build1")));
	build.setId_item2(Integer.parseInt(request.getParameter("build2")));
	build.setId_item3(Integer.parseInt(request.getParameter("build3")));
	build.setId_item4(Integer.parseInt(request.getParameter("build4")));
	build.setId_item5(Integer.parseInt(request.getParameter("build5")));
	build.setId_item6(Integer.parseInt(request.getParameter("build6")));
	
	build.save();
%>