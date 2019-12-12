package xin.tapin.sssp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="olt_admin")
@Entity
public class Admin {

	private Integer aId;
	private String aName;
	private String aPwd;
	
	@GeneratedValue
	@Id
	public Integer getaId() {
		return aId;
	}
	public void setaId(Integer aId) {
		this.aId = aId;
	}
	
	@Column(unique=true,length=12,nullable=false)
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	
	@Column(length=32,nullable=false)
	public String getaPwd() {
		return aPwd;
	}
	public void setaPwd(String aPwd) {
		this.aPwd = aPwd;
	}
	public Admin(String aName, String aPwd) {
		super();
		this.aName = aName;
		this.aPwd = aPwd;
	}
	public Admin() {
		super();
	}
	@Override
	public String toString() {
		return "Admin [aId=" + aId + ", aName=" + aName + ", aPwd=" + aId + "]";
	}
	
	
	
}
