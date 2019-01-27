package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Answered;
import beans.Axe;

public class AxeDao {
	DaoFactory daoFactory;
	public AxeDao(DaoFactory df) {
		// TODO Auto-generated constructor stub
		daoFactory = df;
	}
	
	List<Axe> findAll(){
		List<Axe> axes = new ArrayList<Axe>();
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM Axe");

            while (resultat.next()) {
                long id = resultat.getLong("id");
                String name = resultat.getString("name");

                Axe axe = new Axe();
                axe.setId(id);
                axe.setName(name);
                axes.add(axe);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return axes;
	}
	Axe findOne(Long id){
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM Axe where id = " + id);

            while (resultat.next()) {
                long aid = resultat.getLong("id");
                String name = resultat.getString("name");

                Axe axe = new Axe();
                axe.setId(aid);
                axe.setName(name);
                return axe;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
	}
		
	public String getAxe(Long id){
        return findOne(id).getName();
	}
	void save(Axe axe) {
		Connection connexion = null;
        java.sql.PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO axe(name) VALUES(?);");
            preparedStatement.setString(1, axe.getName());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
	void delete(Long id) {
		Connection connexion = null;
        java.sql.PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("DELETE FROM axe where id = ?");
            preparedStatement.setLong(1, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
}
