package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DaoFactory {
    private String url;
    private String username;
    private String password;

    DaoFactory(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public static DaoFactory getInstance() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception e) {

        }

        DaoFactory instance = new DaoFactory(
                "jdbc:mysql://localhost:8889/dbProject", "root", "root");
        return instance;
    }

    public Connection getConnection() throws SQLException {

        return DriverManager.getConnection(url, username, password);
    }

    // Récupération du Dao
    public AnsweredDao getAnsweredDao() {
        return new AnsweredDao(this);
    }
    public AxeDao getAxeDao() {
    		return new AxeDao(this);
    }
    public EcoleDao getEcoleDao() {
    		return new EcoleDao(this);
    }
    public PropositionDao getPropositionDao() {
		return new PropositionDao(this);
    }
    public QuestionnaireDao getQuestionnaireDao() {
		return new QuestionnaireDao(this);
    }
    public QuestionDao getQuestionDao() {
		return new QuestionDao(this);
    }
    public UtilisateurDao getUtilisateurDao() {
		return new UtilisateurDao(this);
    }
    
}