package beans;


public class Utilisateur{
	
	private Long id;
	private String email;
	private String type;
	private String nom;
	private String prenom;
	private String password;
	private String ecole;
	
	public Utilisateur() {
		// TODO Auto-generated constructor stub
	}

	public Utilisateur(String email, String type, String nom, String prenom, String password, String ecole) {
		super();
		this.email = email;
		this.type = type;
		this.nom = nom;
		this.prenom = prenom;
		this.password = password;
		this.ecole = ecole;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEcole() {
		return ecole;
	}

	public void setEcole(String ecole) {
		this.ecole = ecole;
	}
	
	
}