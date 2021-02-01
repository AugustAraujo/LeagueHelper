package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Build {
	
	private int id_build;
	private int id_campeao;
	private int id_item1;
	private int id_item2;
	private int id_item3;
	private int id_item4;
	private int id_item5;
	private int id_item6;

	private String tableName = "db_leaguehelper.tb_build";
	private String fieldsName = "id_build, id_campeao, id_item1, id_item2, id_item3, id_item4, id_item5, id_item6";
	private String keyField = "id_build, id_campeao";
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, keyField);
	
	public Build() {
		this.tableName = "db_leaguehelper.tb_build";
		this.fieldsName = "id_build, id_campeao, id_item1, id_item2, id_item3, id_item4, id_item5, id_item6";
		this.keyField = "";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public Build(int idCampeao, String nivel) {
		this.tableName = "db_leaguehelper.tb_build";
		this.fieldsName = "id_build, id_campeao, id_item1, id_item2, id_item3, id_item4, id_item5, id_item6";
		this.keyField = "id_build, id_campeao";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public Build(int idCampeao) {
		this.tableName = "db_leaguehelper.tb_build";
		this.fieldsName = "id_build, id_campeao, id_item1, id_item2, id_item3, id_item4, id_item5, id_item6";
		this.keyField = "id_build, id_campeao";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setId_campeao(idCampeao);
	}
	
	public void save() {
		if((this.getId_build() == 0)) {
			this.dbQuery.insert(this.toArray());
		}else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public void searchBuild() {
        try {
            ResultSet resultSet = this.select("id_campeao=" + this.getId_campeao());
            while (resultSet.next()) {
            	this.setId_build(resultSet.getInt("id_build"));
                this.setId_item1(resultSet.getInt("id_item1"));
                this.setId_item2(resultSet.getInt("id_item2"));
                this.setId_item3(resultSet.getInt("id_item3"));
                this.setId_item4(resultSet.getInt("id_item4"));
                this.setId_item5(resultSet.getInt("id_item5"));
                this.setId_item6(resultSet.getInt("id_item6"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	public ResultSet select( String where ) {
		ResultSet resultset = this.dbQuery.select(where);
		return(resultset);
	}
	
	private String[] toArray() {
		
		String[] temp =  new String[] {
				this.getId_build() + "",
				this.getId_campeao() + "",
				this.getId_item1() + "",
				this.getId_item2() + "",
				this.getId_item3() + "",
				this.getId_item4() + "",
				this.getId_item5() + "",
				this.getId_item6() + ""
		};
		return(temp);
	}

	public int getId_build() {
		return id_build;
	}

	public void setId_build(int id_build) {
		this.id_build = id_build;
	}

	public int getId_campeao() {
		return id_campeao;
	}

	public void setId_campeao(int id_campeao) {
		this.id_campeao = id_campeao;
	}

	public int getId_item1() {
		return id_item1;
	}

	public void setId_item1(int id_item1) {
		this.id_item1 = id_item1;
	}

	public int getId_item2() {
		return id_item2;
	}

	public void setId_item2(int id_item2) {
		this.id_item2 = id_item2;
	}

	public int getId_item3() {
		return id_item3;
	}

	public void setId_item3(int id_item3) {
		this.id_item3 = id_item3;
	}

	public int getId_item4() {
		return id_item4;
	}

	public void setId_item4(int id_item4) {
		this.id_item4 = id_item4;
	}

	public int getId_item5() {
		return id_item5;
	}

	public void setId_item5(int id_item5) {
		this.id_item5 = id_item5;
	}

	public int getId_item6() {
		return id_item6;
	}

	public void setId_item6(int id_item6) {
		this.id_item6 = id_item6;
	}

	
}