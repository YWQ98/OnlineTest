package xin.tapin.sssp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="olt_qitem")
@Entity
public class QItem {

	private Integer qiid;
	private String qiname;
	private Integer qiscore;
	private String qistate;//题目状态
	private Teacher teacher;
	private SType sType;
	
	@GeneratedValue
	@Id
	public Integer getQiid() {
		return qiid;
	}
	public void setQiid(Integer qiid) {
		this.qiid = qiid;
	}
	
	@Column(nullable=false)
	public String getQiname() {
		return qiname;
	}
	public void setQiname(String qiname) {
		this.qiname = qiname;
	}
	@Column(length=2,nullable=false)
	public Integer getQiscore() {
		return qiscore;
	}
	public void setQiscore(Integer qiscore) {
		this.qiscore = qiscore;
	}
	@Column(length=2)
	public String getQistate() {
		return qistate;
	}
	public void setQistate(String qistate) {
		this.qistate = qistate;
	}
	@JoinColumn(name="teacher_id")
	@ManyToOne(fetch=FetchType.EAGER)
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	@JoinColumn(name="sType_id")
	@ManyToOne(fetch=FetchType.EAGER)
	public SType getsType() {
		return sType;
	}
	public void setsType(SType sType) {
		this.sType = sType;
	}
	public QItem() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QItem(String qiname, Integer qiscore, String qistate, Teacher teacher, SType sType) {
		super();
		this.qiname = qiname;
		this.qiscore = qiscore;
		this.qistate = qistate;
		this.teacher = teacher;
		this.sType = sType;
	}
	@Override
	public String toString() {
		return "QItem [qiid=" + qiid + ", qiname=" + qiname + ", qiscore=" + qiscore + ", qistate=" + qistate
				+ ", teacher=" + teacher + ", sType=" + sType + "]";
	}

	
	
}
