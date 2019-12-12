package xin.tapin.sssp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="olt_qtype")
@Entity
public class QType {

	private Integer qtid;
	private String qtname;
	
	@GeneratedValue
	@Id
	public Integer getQtid() {
		return qtid;
	}
	public void setQtid(Integer qtid) {
		this.qtid = qtid;
	}
	@Column(unique=true,length=3,nullable=false)
	public String getQtname() {
		return qtname;
	}
	public void setQtname(String qtname) {
		this.qtname = qtname;
	}
	public QType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QType(String qtname) {
		super();
		this.qtname = qtname;
	}
	@Override
	public String toString() {
		return "QType [qtid=" + qtid + ", qtname=" + qtname + "]";
	}
	

}
