package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Axe;
import beans.Ecole;

public class EcoleDao {
	DaoFactory daoFactory;
	public EcoleDao(DaoFactory df) {
		// TODO Auto-generated constructor stub
		daoFactory = df;
	}
	public List<Ecole> findAll(){
		List<Ecole> ecoles = new ArrayList<Ecole>();
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM Ecole");

            while (resultat.next()) {
                long id = resultat.getLong("id");
                String name = resultat.getString("name");

                Ecole ecole = new Ecole();
                ecole.setId(id);
                ecole.setName(name);
                ecoles.add(ecole);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ecoles;
	}
	public List<Ecole> findAll(String nameL){
		List<Ecole> ecoles = new ArrayList<Ecole>();
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM Ecole where name = " + nameL);

            while (resultat.next()) {
                long id = resultat.getLong("id");
                String name = resultat.getString("name");

                Ecole ecole = new Ecole();
                ecole.setId(id);
                ecole.setName(name);
                ecoles.add(ecole);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ecoles;
	}
}
