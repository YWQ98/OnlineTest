package xin.tapin.sssp.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="olt_stype")
@Entity
public class SType {

	private Integer stid;
	private QType qType;
	private Subject subject;
	
	@GeneratedValue
	@Id
	public Integer getStid() {
		return stid;
	}
	public void setStid(Integer stid) {
		this.stid = stid;
	}
	@JoinColumn(name="qtype_id")
	@ManyToOne(fetch=FetchType.EAGER)
	public QType getqType() {
		return qType;
	}
	public void setqType(QType qType) {
		this.qType = qType;
	}
	@JoinColumn(name="subject_id")
	@ManyToOne(fetch=FetchType.EAGER)
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	public SType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SType(QType qType, Subject subject) {
		super();
		this.qType = qType;
		this.subject = subject;
	}
	@Override
	public String toString() {
		return "SType [stid=" + stid + ", qType=" + qType + ", subject=" + subject + "]";
	}
	

}
