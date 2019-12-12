package xin.tapin.sssp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
@Table(name="olt_subject")
@Entity
public class Subject {

	private Integer sjid;
	private String sjname;
	
	@GeneratedValue
	@Id
	public Integer getSjid() {
		return sjid;
	}
	public void setSjid(Integer sjid) {
		this.sjid = sjid;
	}
	
	@Column(unique=true,nullable=false)
	public String getSjname() {
		return sjname;
	}
	public void setSjname(String sjname) {
		this.sjname = sjname;
	}
	public Subject(String sjname) {
		super();
		this.sjname = sjname;
	}
	public Subject() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Subject [sjid=" + sjid + ", sjname=" + sjname + "]";
	}
	
	

}
