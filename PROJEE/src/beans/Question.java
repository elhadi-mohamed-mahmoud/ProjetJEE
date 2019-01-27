package beans;

public class Question{
	private long id;
	private String name;
	private long questionnaireId;
	
	public Question() {
		// TODO Auto-generated constructor stub
	}

	public Question(String name, long questionnaireId) {
		super();
		this.name = name;
		this.questionnaireId = questionnaireId;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getQuestionnaireId() {
		return questionnaireId;
	}

	public void setQuestionnaireId(long questionnaireId) {
		this.questionnaireId = questionnaireId;
	}
	
}
