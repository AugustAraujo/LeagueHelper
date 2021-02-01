<%@page import="classes.Item"%>
<% 
	Item item = new Item();
	int logado = session.getAttribute("userlogin") == null ? 0 : (Integer) session.getAttribute("userlogin");
	
	item.setId_item(0);
	item.setLogo_item(request.getParameter("fotoItem"));
	item.setNome_item(request.getParameter("nomeItem"));
	item.setPreco_item(Integer.parseInt(request.getParameter("item_preco")));
	item.setStatus_item1(request.getParameter("item_efeito1"));
	item.setStatus_item2(request.getParameter("item_efeito2"));
	item.setStatus_item3(request.getParameter("item_efeito3"));
	item.setStatus_item4(request.getParameter("item_efeito4"));
	item.setDescricao_item("");
	
	item.save();
	
	%>
