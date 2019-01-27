package beans;


public class Proposition{
	
	private Long id;
	private String proposition;
	private Long questionId;
	private Long rate;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getProposition() {
		return proposition;
	}
	public void setProposition(String proposition) {
		this.proposition = proposition;
	}

	 public Proposition() {
		 
	 }
	
	public Proposition(String proposition, Long rate, Long questionId) {
		super();
		this.proposition = proposition;
		this.rate = rate;
		this.questionId = questionId;
	}
	
	public Long getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}
	public Long getRate() {
		return rate;
	}
	public void setRate(Long rate) {
		this.rate = rate;
	}
	
	
	
}
