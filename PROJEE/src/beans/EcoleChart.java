package beans;

public class EcoleChart {
	private String ecole;
	private Float sum;
	private Integer count;
	
	public EcoleChart(String ecole, Float sum, Integer count) {
		super();
		this.ecole = ecole;
		this.sum = sum;
		this.count = count;
	}

	public EcoleChart() {
		// TODO Auto-generated constructor stub
	}
		
	public String getEcole() {
		return ecole;
	}
	
	
	public void setEcole(String ecole) {
		this.ecole = ecole;
	}

	public Float getSum() {
		return sum;
	}

	public void setSum(Float sum) {
		this.sum = sum;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	
}
