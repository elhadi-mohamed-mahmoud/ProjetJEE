package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Questionnaire;

public class QuestionnaireDao {
	DaoFactory daoFactory;
	public QuestionnaireDao(DaoFactory df) {
		// TODO Auto-generated constructor stub
		daoFactory = df;
	}
	void save(Questionnaire questionnaire) {
		Connection connexion = null;
        java.sql.PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO Questionnaire(axe_id) VALUES(?);");
            preparedStatement.setLong(1, questionnaire.getAxeId());

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
            preparedStatement = connexion.prepareStatement("DELETE FROM Questionnaire where id = ? ;");
            preparedStatement.setLong(1, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
	List<Questionnaire> findAll(Long id){
		List<Questionnaire> questionnaires = new ArrayList<Questionnaire>();
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM questionnaire where axe_id = " + id);

            while (resultat.next()) {
            	
                long cid = resultat.getLong("id");
                long axeId = resultat.getLong("axe_id");

                Questionnaire questionnaire = new Questionnaire();
                questionnaire.setId(cid);
                questionnaire.setAxeId(axeId);
                
                questionnaires.add(questionnaire);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questionnaires;
	}
	Questionnaire findOne(Long id){
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM questionnaire where id = " + id);

            while (resultat.next()) {
            	
                long cid = resultat.getLong("id");
                long axeId = resultat.getLong("axe_id");

                Questionnaire questionnaire = new Questionnaire();
                questionnaire.setId(cid);
                questionnaire.setAxeId(axeId);
                
                return questionnaire;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
	}
}
