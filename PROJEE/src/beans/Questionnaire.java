package beans;

public class Questionnaire{
	
	private Long id;
	private Long axeId;
	
	public Questionnaire(Long axeId) {
		super();
		this.axeId = axeId;
	}
	
	public Questionnaire() {
		// TODO Auto-generated constructor stub
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getAxeId() {
		return axeId;
	}
	public void setAxeId(Long axeId) {
		this.axeId = axeId;
	}	
	
}
