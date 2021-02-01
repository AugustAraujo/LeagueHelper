package classes;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;
import multitool.RandomCode;

public class Usuario {
	private int	   	idUsuario;
	private String 	email;
	private String 	senha;
	private int 	idNivelUsuario;
	private String 	nome;
	private int 	ativo;
	
	private String tableName	= "db_leaguehelper.tb_usuario"; 
	private String fieldsName	= "idUsuario, nomeUsuario, emailUsuario, senhaUsuario, nivel_usuario, usuarioAtivo";
	private String fieldKey		= "idUsuario";
	
	
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	

	public Usuario( int idUsuario, String nome, String email, String senha, int idNivelUsuario, int ativo) {
		this.setIdUsuario(idUsuario);
		this.setEmail(email);
		this.setSenha(senha);
		this.setIdNivelUsuario(idNivelUsuario);
		this.setNome(nome);
		this.setAtivo(ativo);
	}


	public Usuario( String email, String senha, String nome) {
		this.setIdUsuario(0);
		this.setEmail(email);
		this.setSenha(senha);
		this.setIdNivelUsuario(0);
		this.setNome(nome);
	}
	
	
	public Usuario( String email) {
		this.setIdUsuario(0);
		this.setEmail(email);
	}
	
	public Usuario( int idUsuario) {
		this.setIdUsuario(idUsuario);
	}
	
	public String toString() {
		return(
				this.getIdUsuario() + ""+" | "+
				this.getEmail()+" | "+
				"********"+" | "+
				this.getIdNivelUsuario() + ""+" | "+
				this.getNome()+" | "+
				this.getAtivo()+" | "
		);
	}
	
	private String[] toArray() {
		
		String[] temp =  new String[] {
				this.getIdUsuario() + "",
				this.getNome(),
				this.getEmail(),
				this.getSenha(),
				this.getIdNivelUsuario() + "",
				this.getAtivo() + "",
		};
		return(temp);
	}
	
	public void save() {
		if( this.getIdUsuario() > 0 ) {
			this.dbQuery.update(this.toArray());
		}else {
			this.dbQuery.insert(this.toArray());
		}
	}
	
	public void delete() {
		if( this.getIdUsuario() > 0 ) {
			this.dbQuery.delete(this.toArray());
		}
	}
	
	public ResultSet selectAll() {
		ResultSet resultset = this.dbQuery.select("");
		return(resultset);
	}
	
	public void searchUser() {
        try {
            ResultSet resultSet = this.select(" idUsuario = " + this.getIdUsuario());
            while (resultSet.next()) {
                this.setNome(resultSet.getString("nomeUsuario"));
                this.setEmail(resultSet.getString("emailUsuario"));
                this.setSenha(resultSet.getString("senhaUsuario"));
                this.setIdNivelUsuario(resultSet.getString("nivel_usuario"));
                this.setAtivo(resultSet.getInt("usuarioAtivo"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	public ResultSet selectBy( String field, String value ) {
		ResultSet resultset = this.dbQuery.select( " "+field+"='"+value+"'");
		return(resultset);
	}
	
	public ResultSet select( String where ) {
		ResultSet resultset = this.dbQuery.select(where);
		return(resultset);
	}
	
	public String listAll() {
		ResultSet rs = this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1 style='color:white;' class='w-100 bg-dark'>";
		saida += "<tr style='width: 32px; height: 32px;'>";
		saida += "<td> ID </td>";
		saida += "<td> NOME </td>";
		saida += "<td> EMAIL </td>";
		saida += "<td> SENHA </td>";
		saida += "<td> NIVEL </td>";
		saida += "<td> ATIVO </td>";
		saida += "<td></td>";
		saida += "<td></td>";
		saida += "</tr>";
		try {
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("idUsuario") + "</td>";
				saida += "<td>" + rs.getString("nomeUsuario") + "</td>";
				saida += "<td>" + rs.getString("emailUsuario") + "</td>";
				saida += "<td>" + rs.getString("senhaUsuario") + "</td>";
				saida += "<td>" + rs.getString("nivel_usuario") + "</td>";
				saida += "<td>" + rs.getString("usuarioAtivo") + "</td>";
				saida += "<td style='width: 32px; height: 32px;'><a href='../controller/alterarDadosUsuario.jsp?id="+ rs.getString("idUsuario") +"'><img src='../views/imgs/edit.png' class='aligncenter' style='width: 32px; height: 32px;'></a></td>";
				saida += "<td style='width: 32px; height: 32px;'><a href='../model/apagaUser.jsp?id="+ rs.getString("idUsuario") +"'><img src='../views/imgs/exclude.png' class='aligncenter' style='width: 32px; height: 32px;'></a></td>";
				saida += "</tr>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		saida += "<br/>";
		saida += "<br/>";
		return (saida);
	}
	
	public String newPassword() {
		
		if (this.getEmail() != "" && this.getEmail()!= null) {
			if ( this.getIdUsuario() > 0 ) {
				try {
					ResultSet resultset = this.select(" email ='"+this.getEmail()+"'");
					boolean existe = resultset.next();
					if ( existe ) {
						this.setSenha(  new RandomCode().generate(32) );
						this.save();
						return( this.getSenha());
					}
					resultset.getInt("idUsuario");
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			} else {
				this.setSenha(  new RandomCode().generate(32));
				return(  this.getSenha() );
			}
		} else {
			// Sem email não deve gerar senha
		}
		return this.getSenha(); 
	}

	public boolean checkLogin() {
		
		int id = 0;
		try {
			ResultSet resultSet = this.select(" emailUsuario='"+ this.getEmail()+ "' AND senhaUsuario = '"+this.getSenha()+"'");
			while (resultSet.next()) {
				System.out.println( "\n"+resultSet.getString("nomeUsuario"));
				id =  resultSet.getInt("idUsuario");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.setIdUsuario(id);
		return(id > 0);	
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public int getIdNivelUsuario() {
		return idNivelUsuario;
	}

	public void setIdNivelUsuario(int idNivelUsuario) {
		this.idNivelUsuario = idNivelUsuario;
	}
	
	public void setIdNivelUsuario(String idNivelUsuario) {
		this.idNivelUsuario = ((idNivelUsuario == "") ? 0 : Integer.parseInt(idNivelUsuario));
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getAtivo() {
		return ativo;
	}
	
	private void setAtivo(int ativo) {
		this.ativo = ativo;
		
	}


}
