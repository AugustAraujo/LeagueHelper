<%@page import="classes.Item"%>

<%

int idItem = Integer.parseInt(request.getParameter("idItem"));

Item item = new Item(idItem);

item.searchItem();

item.setNome_item(request.getParameter("nomeItem"));
item.setDescricao_item("");
item.setLogo_item(request.getParameter("fotoItem"));
item.setPreco_item(Integer.parseInt(request.getParameter("item_preco")));
item.setStatus_item1(request.getParameter("item_efeito1"));
item.setStatus_item2(request.getParameter("item_efeito2"));
item.setStatus_item3(request.getParameter("item_efeito3"));
item.setStatus_item4(request.getParameter("item_efeito4"));

item.save();

%>
