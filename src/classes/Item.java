package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Item {
	
	private int id_item;
	private String nome_item;
	private String logo_item;
	private String status_item1;
	private String status_item2;
	private String status_item3;
	private String status_item4;
	private String descricao_item;
	private int preco_item;

	private String tableName = "db_leaguehelper.tb_item";
	private String fieldsName = "id_item, nome_item, logo_item, status_item1,status_item2,status_item3,status_item4, descricao_item, preco_item";
	private String keyField = "id_item";
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, keyField);
	
	public Item() {
		this.tableName = "db_leaguehelper.tb_item";
		this.fieldsName = "id_item, nome_item, logo_item, status_item1,status_item2,status_item3,status_item4, descricao_item, preco_item";
		this.keyField = "id_item";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public Item(int idCampeao, String nivel) {
		this.tableName = "db_leaguehelper.tb_item";
		this.fieldsName = "id_item, nome_item, logo_item, status_item1,status_item2,status_item3,status_item4, descricao_item, preco_item";
		this.keyField = "id_item";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setId_item(idCampeao);

	}
	
	public Item(int idItem) {
		this.tableName = "db_leaguehelper.tb_item";
		this.fieldsName = "id_item, nome_item, logo_item, status_item1,status_item2,status_item3,status_item4, descricao_item, preco_item";
		this.keyField = "id_item";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		this.setId_item(idItem);
	}
	
	public void searchItem() {
        try {
            ResultSet resultSet = this.select("id_item=" + this.getId_item());
            while (resultSet.next()) {
                this.setNome_item(resultSet.getString("nome_item"));
                this.setLogo_item(resultSet.getString("logo_item"));
                this.setStatus_item1(resultSet.getString("status_item1"));
                this.setStatus_item2(resultSet.getString("status_item2"));
                this.setStatus_item3(resultSet.getString("status_item3"));
                this.setStatus_item4(resultSet.getString("status_item4"));
                this.setDescricao_item(resultSet.getString("descricao_item"));
                this.setPreco_item(resultSet.getInt("preco_item"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	public String selectItem() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		try {
			while(rs.next()) {
				saida += "<option value='" + rs.getString("id_item") + "'>" + rs.getString("nome_item") + "</option>";		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return(saida);
	}
	
	public ResultSet select( String where ) {
		ResultSet resultset = this.dbQuery.select(where);
		return(resultset);
	}
	
	
	public void save() {
		if((this.getId_item() == 0)) {
			this.dbQuery.insert(this.toArray());
		}else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	private String[] toArray() {
		
		String[] temp =  new String[] {
				this.getId_item() + "",
				this.getNome_item(),
				this.getLogo_item(),
				this.getStatus_item1(),
				this.getStatus_item2(),
				this.getStatus_item3(),
				this.getStatus_item4(),
				this.getDescricao_item(),
				this.getPreco_item() + ""
		};
		return(temp);
	}
	
	public void delete() {
		if(this.getId_item() > 0) {
			this.dbQuery.delete(this.toArray());
		}
	}
	
	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1 style='color:white; text-align:center; margin-bottom: 5%;' class='bg-dark'>";
		saida += "<tr>";
		saida += "<td ID </td>";
		saida += "<td> NOME </td>";
		saida += "<td> FOTO </td>";
		saida += "<td> STATUS 1 </td>";
		saida += "<td> STATUS 2 </td>";
		saida += "<td> STATUS 3 </td>";
		saida += "<td> STATUS 4 </td>";
		saida += "<td> DESCRIÇÃO </td>";
		saida += "<td> PREÇO </td>";
		saida += "<td></td>";
		saida += "<td></td>";
		try {
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("id_item") + "</td>";
				saida += "<td>" + rs.getString("nome_item") + "</td>";
				saida += "<td><img src='../views/imgs/itens_pic/" + rs.getString("logo_item") + "'></td>";
				saida += "<td>" + rs.getString("status_item1") + "</td>";
				saida += "<td>" + rs.getString("status_item2") + "</td>";
				saida += "<td>" + rs.getString("status_item3") + "</td>";
				saida += "<td>" + rs.getString("status_item4") + "</td>";
				saida += "<td>" + rs.getString("descricao_item") + "</td>";
				saida += "<td>" + rs.getString("preco_item") + "</td>";
				saida += "<td style='width: 32px; height: 32px;'><a href='../controller/alterarItem.jsp?id="+ rs.getString("id_item") +"'><img src='../views/imgs/edit.png' class='aligncenter' style='width: 32px; height: 32px;'></a></td>";
				saida += "<td style='width: 32px; height: 32px;'><a href='../model/apagaItem.jsp?id="+ rs.getString("id_item") +"'><img src='../views/imgs/exclude.png' class='aligncenter' style='width: 32px; height: 32px;'></a></td>";
				saida += "</tr>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}
	
	public String listAllMenu() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		try {
			while(rs.next()) {
				saida += "<div class='col-3' style='margin-top:5%;'>";
				saida += "<table style='background-color: rgba(42,69,96,0.8); border: 1px solid gold; border-collapse: separate;>";
				saida += "<tr style='height:2'>";
				saida += "<td colspan='2' align='center' style='text-align: center;'>";
				saida += "<img src='../views/imgs/itens_pic/"+ rs.getString("logo_item") +"' class='aligncenter' style='border-bottom-left-radius: 45%; border-bottom-right-radius: 45%;'></a>";
				saida += "</td>";
				saida += " </tr>";
				saida += "<tr>";
				saida += "<td style='text-align: center; font-size: 1.0rem;'>";
				saida += "<p style='font-weight: bold; margin:0; margin-top: 5%; width:100%; background-color: rgba(30,57,83,0.8)'>"+ rs.getString("nome_item") +"</p>";
				saida += "</td>";
				saida += "</tr>";
				saida += "<tr>";
				saida += "<td style='text-align: center; font-size: 0.8rem;'>";
				saida += "<p style='margin-top: 5%; margin-bottom: 7%;'>>"+ rs.getString("status_item1") +"<</p> ";
				saida += "</td>";
				saida += "</tr>";
				saida += "<tr>";
				saida += "<td style='text-align: center; font-size: 0.8rem;'>";
				saida += "<p style='margin-top: 5%; margin-bottom: 7%;'>>"+ rs.getString("status_item2") +"<</p> ";
				saida += "</td>";
				saida += "</tr>";
				saida += "<tr>";
				saida += "<td style='text-align: center; font-size: 0.8rem;'>";
				saida += "<p style='margin-top: 5%; margin-bottom: 7%;'>>"+ rs.getString("status_item3") +"<</p> ";
				saida += "</td>";
				saida += "</tr>";
				saida += "<tr>";
				saida += "<td style='text-align: center; font-size: 0.8rem;'>";
				saida += "<p style='margin-top: 5%; margin-bottom: 5%'>>"+ rs.getString("status_item4") +"<</p> ";
				saida += "</td>";
				saida += "</tr>";
				saida += "</table>";
				saida += "</div>";
		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (saida);
	}

	public int getId_item() {
		return id_item;
	}

	public void setId_item(int id_item) {
		this.id_item = id_item;
	}

	public String getNome_item() {
		return nome_item;
	}

	public void setNome_item(String nome_item) {
		this.nome_item = nome_item;
	}

	public String getLogo_item() {
		return logo_item;
	}

	public void setLogo_item(String logo_item) {
		this.logo_item = logo_item;
	}

	public String getStatus_item1() {
		return status_item1;
	}

	public void setStatus_item1(String status_item1) {
		this.status_item1 = status_item1;
	}

	public String getStatus_item2() {
		return status_item2;
	}

	public void setStatus_item2(String status_item2) {
		this.status_item2 = status_item2;
	}

	public String getStatus_item3() {
		return status_item3;
	}

	public void setStatus_item3(String status_item3) {
		this.status_item3 = status_item3;
	}

	public String getStatus_item4() {
		return status_item4;
	}

	public void setStatus_item4(String status_item4) {
		this.status_item4 = status_item4;
	}

	public String getDescricao_item() {
		return descricao_item;
	}

	public void setDescricao_item(String descricao_item) {
		this.descricao_item = descricao_item;
	}

	public int getPreco_item() {
		return preco_item;
	}

	public void setPreco_item(int id_rota) {
		this.preco_item= id_rota;
	}
}
	
	
