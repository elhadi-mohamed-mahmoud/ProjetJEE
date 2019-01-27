package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Axe;
import beans.Proposition;


public class PropositionDao {
	DaoFactory daoFactory;
	public PropositionDao(DaoFactory df) {
		// TODO Auto-generated constructor stub
		daoFactory = df;
	}
	void save(Proposition proposition) {
		Connection connexion = null;
        java.sql.PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO Proposition(proposition, question_id, rate) VALUES(?, ?, ?);");
            preparedStatement.setString(1, proposition.getProposition());
            preparedStatement.setLong(2, proposition.getQuestionId());
            preparedStatement.setLong(3, proposition.getRate());

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
            preparedStatement = connexion.prepareStatement("DELETE FROM Proposition where id = ? ;");
            preparedStatement.setLong(1, id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
	public List<Proposition> findAll(Long id){
		List<Proposition> propositions = new ArrayList<Proposition>();
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM proposition where question_id = " + id);

            while (resultat.next()) {
            	
                long cid = resultat.getLong("id");
                String propo = resultat.getString("proposition");
                long qid = resultat.getLong("question_id");
                long rate = resultat.getLong("rate");

                Proposition proposition = new Proposition();
                proposition.setId(cid);
                proposition.setProposition(propo);
                proposition.setQuestionId(qid);
                proposition.setRate(rate);
                
                propositions.add(proposition);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return propositions;
	}
	Proposition findOne(Long id){
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM proposition where id = " + id);

            while (resultat.next()) {
            	
                long cid = resultat.getLong("id");
                String propo = resultat.getString("proposition");
                long qid = resultat.getLong("question_id");
                long rate = resultat.getLong("rate");

                Proposition proposition = new Proposition();
                proposition.setId(cid);
                proposition.setProposition(propo);
                proposition.setQuestionId(qid);
                proposition.setRate(rate);
                
                return proposition;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
	}

}
