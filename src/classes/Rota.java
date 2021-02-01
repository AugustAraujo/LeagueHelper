package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Rota {
	
	private int	   	id_lane;
	private String 	nome_lane;
	private String 	foto_lane;
	
	private String tableName	= "db_leaguehelper.tb_lane"; 
	private String fieldsName	= "id_lane, nome_lane, foto_lane";
	private String fieldKey		= "id_lane";
	
	
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);

	public Rota(int id_lane, String nome_lane, String foto_lane) {
		this.setId_lane(id_lane);
		this.setNome_lane(nome_lane);
		this.setFoto_lane(foto_lane);
	}
	
	public Rota(int id_lane) {
		this.setId_lane(id_lane);
	}
	
	public void searchRota() {
        try {
            ResultSet resultSet = this.select(" id_lane = " + this.getId_lane());
            while (resultSet.next()) {
                this.setNome_lane(resultSet.getString("nome_lane"));
                this.setFoto_lane(resultSet.getString("foto_lane"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	public ResultSet select( String where ) {
		ResultSet resultset = this.dbQuery.select(where);
		return(resultset);
	}
	
	public int getId_lane() {
		return id_lane;
	}


	public void setId_lane(int id_lane) {
		this.id_lane = id_lane;
	}


	public String getNome_lane() {
		return nome_lane;
	}


	public void setNome_lane(String nome_lane) {
		this.nome_lane = nome_lane;
	}


	public String getFoto_lane() {
		return foto_lane;
	}


	public void setFoto_lane(String foto_lane) {
		this.foto_lane = foto_lane;
	}
	
}