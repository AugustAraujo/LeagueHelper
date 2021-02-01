package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Campeao {
	
	private int idCampeao;
	private String nomeCampeao;
	private String tituloCampeao;
	private String splashCampeao;
	private int id_counter1;
	private int id_counter2;
	private int id_rota;

	private String tableName = "db_leaguehelper.tb_campeao";
	private String fieldsName = "id_campeao, nome_campeao, titulo_campeao, splash_campeao, id_counter1, id_counter2, id_rota";
	private String keyField = "id_campeao";
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, keyField);
	
	public Campeao() {
		this.tableName = "db_leaguehelper.tb_campeao";
		this.fieldsName = "id_campeao, nome_campeao, titulo_campeao, splash_campeao, id_counter1, id_counter2, id_rota";
		this.keyField = "";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public Campeao(int idCampeao, String nivel) {
		this.tableName = "db_leaguehelper.tb_campeao";
		this.fieldsName = "id_campeao, nome_campeao, titulo_campeao, splash_campeao, id_counter1, id_counter2, id_rota";
		this.keyField = "id_campeao";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdCampeao(idCampeao);

	}
	
	public Campeao(int idCampeao) {
		this.setIdCampeao(idCampeao);
	}
	
	public int returnLastChamp() {
		 ResultSet resultSet = this.dbQuery.selectLastID();
		 try {
			if(resultSet.next()) {
				 return resultSet.getInt("ID");
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return 0;
	}
	
	public void searchChampion() {
        try {
            ResultSet resultSet = this.select("id_campeao=" + this.getIdCampeao());
            while (resultSet.next()) {
                this.setNomeCampeao(resultSet.getString("nome_campeao"));
                this.setTituloCampeao(resultSet.getString("titulo_campeao"));
                this.setSplashCampeao(resultSet.getString("splash_campeao"));
                this.setId_counter1(resultSet.getInt("id_counter1"));
                this.setId_counter2(resultSet.getInt("id_counter2"));
                this.setId_rota(resultSet.getInt("id_rota"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	public ResultSet select( String where ) {
		ResultSet resultset = this.dbQuery.select(where);
		return(resultset);
	}
	
	
	public void save() {
		if((this.getIdCampeao() == 0)) {
			this.dbQuery.insert(this.toArray());
		}else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	private String[] toArray() {
		
		String[] temp =  new String[] {
				this.getIdCampeao() + "",
				this.getNomeCampeao(),
				this.getTituloCampeao(),
				this.getSplashCampeao(),
				this.getId_counter1() + "",
				this.getId_counter2() + "",
				this.getId_rota() + ""
		};
		return(temp);
	}
	
	public void delete() {
		if(this.getIdCampeao() > 0) {
			this.dbQuery.delete(this.toArray());
		}
	}
	
	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1 style='color:white; text-align:center; margin-bottom:8%;' class='w-100 bg-dark'>";
		saida += "<tr>";
		saida += "<td style='font-weight: bold;'> ID </td>";
		saida += "<td style='font-weight: bold;'> NOME </td>";
		saida += "<td style='font-weight: bold;'> TITULO </td>";
		saida += "<td style='font-weight: bold;'> FOTO </td>";
		saida += "<td style='font-weight: bold;'> COUNTER 1 </td>";
		saida += "<td style='font-weight: bold;' > COUNTER 2 </td>";
		saida += "<td style='font-weight: bold;'> ROTA </td>";
		saida += "<td></td>";
		saida += "<td></td>";
		saida += "</tr>";
		try {
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("id_campeao") + "</td>";
				saida += "<td>" + rs.getString("nome_campeao") + "</td>";
				saida += "<td>" + rs.getString("titulo_campeao") + "</td>";
				saida += "<td><img src='../views/imgs/campeoes/" + rs.getString("splash_campeao") + " ' style='width:64px; height: 64px;'></td>";
				saida += "<td>" + rs.getString("id_counter1") + "</td>";
				saida += "<td>" + rs.getString("id_counter2") + "</td>";
				saida += "<td>" + rs.getString("id_rota") + "</td>";
				saida += "<td style='width: 32px; height: 32px;'><a href='../controller/alterarCampeao.jsp?id="+ rs.getString("id_campeao") +"'><img src='../views/imgs/edit.png' class='aligncenter' style='width: 32px; height: 32px;'></a></td>";
				saida += "<td style='width: 32px; height: 32px;'><a href='../model/apagaCampeao.jsp?id="+ rs.getString("id_campeao") +"'><img src='../views/imgs/exclude.png' class='aligncenter' style='width: 32px; height: 32px;'></a></td>";
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
				saida += "<table style='background-color: rgba(42,69,96,0.8); border: 1px solid gold; border-collapse: separate;'>";
				saida += "<tr>";
					saida += "<td colspan='2' align='center' style='text-align: center;'>";
							saida += "<a href='detalhamento.jsp?id="+ rs.getString("id_campeao") +"'><img src='../views/imgs/campeoes/"+ rs.getString("splash_campeao") +"' class='aligncenter' style='border-bottom-left-radius: 45%; border-bottom-right-radius: 45%;'></a>";
							saida += "</td>";
				saida += " </tr>";
				saida += "<tr>";
					saida += "<td style='text-align: center; font-size: 1.5rem;'>";
						saida += "<p style='font-weight: bold; margin:0; margin-top: 5%; width:100%; background-color: rgba(30,57,83,0.8)'>"+ rs.getString("nome_campeao") +"</p>";
					saida += "</td>";
				saida += "</tr>";
				saida += "<tr>";
				saida += "<td style='text-align: center; font-size: 0.8rem;'>";
				saida += "<p style='margin-top: 5%; margin-bottom: 5%;'>"+ rs.getString("titulo_campeao") +"</p> ";
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
	
	
	
	public int getIdCampeao() {
		return idCampeao;
	}
	
	public void setIdCampeao(int idCampeao) {
		this.idCampeao = idCampeao;
	}

	public String getNomeCampeao() {
		return nomeCampeao;
	}

	public void setNomeCampeao(String nomeCampeao) {
		this.nomeCampeao = nomeCampeao;
	}

	public String getTituloCampeao() {
		return tituloCampeao;
	}

	public void setTituloCampeao(String tituloCampeao) {
		this.tituloCampeao = tituloCampeao;
	}

	public String getSplashCampeao() {
		return splashCampeao;
	}

	public void setSplashCampeao(String splashCampeao) {
		this.splashCampeao = splashCampeao;
	}

	public int getId_counter1() {
		return id_counter1;
	}

	public void setId_counter1(int id_counter1) {
		this.id_counter1 = id_counter1;
	}

	public int getId_counter2() {
		return id_counter2;
	}

	public void setId_counter2(int id_counter2) {
		this.id_counter2 = id_counter2;
	}

	public int getId_rota() {
		return id_rota;
	}

	public void setId_rota(int id_rota) {
		this.id_rota = id_rota;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getFieldsName() {
		return fieldsName;
	}

	public void setFieldsName(String fieldsName) {
		this.fieldsName = fieldsName;
	}

	public String getKeyField() {
		return keyField;
	}

	public void setKeyField(String keyField) {
		this.keyField = keyField;
	}

	public DBQuery getDbQuery() {
		return dbQuery;
	}

	public void setDbQuery(DBQuery dbQuery) {
		this.dbQuery = dbQuery;
	}
	
}
