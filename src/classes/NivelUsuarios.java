package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class NivelUsuarios {
	
	private int idNivelUsuario;
	private String nivel;
	
	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
	private DBQuery dbQuery = null;
	
	public NivelUsuarios() {
		this.tableName = "db_leaguehelper.tb_niveis";
		this.fieldsName = "id_nivel, nome_nivel";
		this.keyField = "id_nivel";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public NivelUsuarios(int idNivelUsuario, String nivel) {
		this.tableName = "db_leaguehelper.tb_niveis";
		this.fieldsName = "id_nivel, nome_nivel";
		this.keyField = "id_nivel";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setIdNivelUsuario(idNivelUsuario);
		this.setNivel(nivel);
	}
	
	public String[] toArray() {
		return(
				new String[] {
						""+this.getIdNivelUsuario(),
						""+this.getNivel()
				}
				);
	}
	
	public void save() {
		if((this.getIdNivelUsuario() == 0)) {
			this.dbQuery.insert(this.toArray());
		}else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public void delete() {
		if(this.getIdNivelUsuario() > 0) {
			this.dbQuery.delete(this.toArray());
		}
	}
	
	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1>";
		try {
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("id_nivel") + "</td>";
				saida += "<td>" + rs.getString("nome_nivel") + "</td>";
				saida += "</tr> <br>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}
	
	public int getIdNivelUsuario() {
		return idNivelUsuario;
	}

	public void setIdNivelUsuario(int idNivelUsuario) {
		this.idNivelUsuario = idNivelUsuario;
	}

	public String getNivel() {
		return nivel;
	}

	public void setNivel(String nivel) {
		this.nivel = nivel;
	}
}
