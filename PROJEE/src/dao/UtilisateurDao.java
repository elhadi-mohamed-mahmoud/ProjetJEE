package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Questionnaire;
import beans.Utilisateur;

public class UtilisateurDao {
	DaoFactory daoFactory;
	public UtilisateurDao(DaoFactory df) {
		// TODO Auto-generated constructor stub
		daoFactory = df;
	}
	public Utilisateur findAll(String mail, String password){
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM Utilisateur where email = '" + mail + "' and password = '" + password + "'");

            while (resultat.next()) {
            		Utilisateur user = new Utilisateur();
            		
            		long id = resultat.getLong("id");
            		user.setId(id);
            		user.setEcole(mail);
            		user.setPassword(password);
            		String nom = resultat.getString("nom");
            		user.setNom(nom);
            		String prenom = resultat.getString("prenom");
            		user.setPrenom(prenom);
            		String ecole = resultat.getString("ecole");
            		user.setEcole(ecole);
            		String type = resultat.getString("type");
            		user.setType(type);
                
            		return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
	}
	public long getMaxId() {
		java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT max(id) FROM Utilisateur");

            while (resultat.next()) {
            		Utilisateur user = new Utilisateur();
            		
            		long id = resultat.getLong(1);
            		return id;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
	}
	public Utilisateur findAll(String mail){
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM Utilisateur where email = '" + mail + "'");

            while (resultat.next()) {
            		Utilisateur user = new Utilisateur();
            		
            		long id = resultat.getLong("id");
            		user.setId(id);
            		user.setEcole(mail);
            		String password = resultat.getString("password");
            		user.setPassword(password);
            		String nom = resultat.getString("nom");
            		user.setNom(nom);
            		String prenom = resultat.getString("prenom");
            		user.setPrenom(prenom);
            		String ecole = resultat.getString("ecole");
            		user.setEcole(ecole);
            		String type = resultat.getString("type");
            		user.setType(type);
                
            		return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
	}
	public void save(Utilisateur utilisateur) {
		Connection connexion = null;
        java.sql.PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO Utilisateur(email, nom, password, prenom, type, ecole) VALUES(?, ?, ?, ?, ?, ?);");
            preparedStatement.setString(1, utilisateur.getEmail());
            preparedStatement.setString(2, utilisateur.getNom());
            preparedStatement.setString(3, utilisateur.getPassword());
            preparedStatement.setString(4, utilisateur.getPrenom());
            preparedStatement.setString(5, utilisateur.getType());
            preparedStatement.setString(6, utilisateur.getEcole());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
}
