package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import beans.*;

public class AnsweredDao {
	DaoFactory daoFactory;
	public AnsweredDao(DaoFactory df) {
		// TODO Auto-generated constructor stub
		daoFactory = df;
	}
	public List<Answered> findAll(Long qId, Long uId){
		List<Answered> answered = new ArrayList<Answered>();
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM Answered where q_id = " + qId + " and u_id = " + uId);

            while (resultat.next()) {
                long id = resultat.getLong("id");
                long q_id = resultat.getLong("q_id");
                long u_id = resultat.getLong("u_id");
                long e_id = resultat.getLong("e_id");
                float rate = resultat.getFloat("rate");

                Answered answer = new Answered();
                answer.seteId(id);
                answer.setqId(q_id);
                answer.setuId(u_id);
                answer.seteId(e_id);
                answer.setRate(rate);
                
                answered.add(answer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return answered;
	}
	public List<Answered> findAll(){
		List<Answered> answered = new ArrayList<Answered>();
        java.sql.Connection connexion = null;
        Statement statement = null;
        ResultSet resultat = null;

        try {
            connexion = daoFactory.getConnection();
            statement = connexion.createStatement();
            resultat = statement.executeQuery("SELECT * FROM Answered");

            while (resultat.next()) {
                long id = resultat.getLong("id");
                long q_id = resultat.getLong("q_id");
                long u_id = resultat.getLong("u_id");
                long e_id = resultat.getLong("e_id");
                float rate = resultat.getFloat("rate");

                Answered answer = new Answered();
                answer.setId(id);
                answer.setqId(q_id);
                answer.setuId(u_id);
                answer.seteId(e_id);
                answer.setRate(rate);
                
                answered.add(answer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return answered;
	}
	
	public int getMaxId() {
		List<Answered> ans = findAll();
		int max = 0;
		for(int i = 0; i < ans.size(); i++) {
			max = (int) Math.max(max, ans.get(i).getId());
		}
		return max;
	}
	
	public void save(Answered answered) {
		Connection connexion = null;
        java.sql.PreparedStatement preparedStatement = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = connexion.prepareStatement("INSERT INTO answered(q_id, u_id, e_id, rate) VALUES(?, ?, ?, ?);");
            preparedStatement.setLong(1, answered.getqId());
            preparedStatement.setLong(2, answered.getuId());
            preparedStatement.setLong(3, answered.geteId());
            preparedStatement.setFloat(4, answered.getRate());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
}
