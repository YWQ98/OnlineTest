package xin.tapin.sssp.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Table(name="olt_stupaper")
@Entity
public class StuPaper {

	private Integer spid;//主键
	private Integer spscore;//得分总分
	private EPaper ePaper;//哪张试卷
	private Student student;//哪个学生的试卷
	private Date date;//考试结束日期
	
	@GeneratedValue
	@Id
	public Integer getSpid() {
		return spid;
	}
	public void setSpid(Integer spid) {
		this.spid = spid;
	}
	@JoinColumn(name="epaper_id",nullable=false)
	@ManyToOne(fetch=FetchType.EAGER)
	public EPaper getePaper() {
		return ePaper;
	}
	public void setePaper(EPaper ePaper) {
		this.ePaper = ePaper;
	}
	@JoinColumn(name="student_id",nullable=false)
	@ManyToOne(fetch=FetchType.EAGER)
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	
	@Column
	public Integer getSpscore() {
		return spscore;
	}
	public void setSpscore(Integer spscore) {
		this.spscore = spscore;
	}
	

	@Temporal(TemporalType.TIMESTAMP)
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "StuPaper [spid=" + spid + ", spscore=" + spscore + ", ePaper=" + ePaper + ", student=" + student
				+ ", date=" + date + "]";
	}
	public StuPaper(Integer spscore, EPaper ePaper, Student student) {
		super();
		this.spscore = spscore;
		this.ePaper = ePaper;
		this.student = student;
	}
	public StuPaper() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
