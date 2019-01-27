package beans;

public class Answered {
	
	private long id;
	private long qId;
	private long uId;
	private long eId;
	private float rate;
	
	public Answered() {
		// TODO Auto-generated constructor stub
	}
	
	public Answered(long qId, long uId, long eId, float rate) {
		super();
		this.qId = qId;
		this.uId = uId;
		this.eId = eId;
		this.rate = rate;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getqId() {
		return qId;
	}

	public void setqId(long qId) {
		this.qId = qId;
	}

	public long getuId() {
		return uId;
	}

	public void setuId(long uId) {
		this.uId = uId;
	}

	public long geteId() {
		return eId;
	}

	public void seteId(long eId) {
		this.eId = eId;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}
	
	
}
