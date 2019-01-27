package beans;

public class Cible{
	private Long id;
	private Long idCible;
	private Long idQuestionnaire;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getIdCible() {
		return idCible;
	}
	public void setIdCible(Long idCible) {
		this.idCible = idCible;
	}
	public Long getIdQuestionnaire() {
		return idQuestionnaire;
	}
	public void setIdQuestionnaire(Long idQuestionnaire) {
		this.idQuestionnaire = idQuestionnaire;
	}
	
	public Cible() {
		// TODO Auto-generated constructor stub
	}
	public Cible(Long idCible, Long idQuestionnaire) {
		super();
		this.idCible = idCible;
		this.idQuestionnaire = idQuestionnaire;
	}
	
	
}
