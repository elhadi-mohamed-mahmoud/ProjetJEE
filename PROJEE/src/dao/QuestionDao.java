package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Question;
import beans.Questionnaire;

public class QuestionDao {
	DaoFactory daoFactory;
	public QuestionDao(DaoFactory df) {
		// TODO Auto-generated constructor stub
		daoFactory = df;
	}
	public List<Question> findAll(Long id){
		List<Question> questions = new ArrayList<Question>();
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM question where questionnaire_id = " + id);

            while (resultat.next()) {
            	
                long cid = resultat.getLong("id");
                long questionnaireId = resultat.getLong("questionnaire_id");
                String name = resultat.getString("name");
                Question question = new Question();
                question.setId(cid);
                question.setQuestionnaireId(questionnaireId);
                question.setName(name);
                
                questions.add(question);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return questions;
	}
	Question findOne(Long id){
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM question where id = " + id);

            while (resultat.next()) {
            	
                long cid = resultat.getLong("id");
                long questionnaireId = resultat.getLong("questionnaire_id");
                String name = resultat.getString("name");
                Question question = new Question();
                question.setId(cid);
                question.setQuestionnaireId(questionnaireId);
                question.setName(name);
                
                return question;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
	}
	public void save(Question question) {
		Connection connexion = null;
        java.sql.PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO Question(name, questionnaire_id) VALUES(?, ?);");
            preparedStatement.setString(1, question.getName());
            preparedStatement.setLong(2, question.getQuestionnaireId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
	public long getMaxId() {
		java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT max(id) FROM question");

            while (resultat.next()) {
                return resultat.getLong(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0l;
	}
	public void delete(Long id) {
		Connection connexion = null;
        java.sql.PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("DELETE FROM Question where id = ? ;");
            preparedStatement.setLong(1, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
}
