package beans;

public class Ecole{
	
	private long id;
	private String name;
	
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

	
	public Ecole() {
		// TODO Auto-generated constructor stub
	}
	public Ecole(String name) {
		this.name = name;
	}
	
	
}
