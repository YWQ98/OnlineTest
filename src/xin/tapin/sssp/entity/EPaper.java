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

@Table(name="olt_epaper")
@Entity
public class EPaper {

	private Integer eid;//主键
	private String ename;//试卷名称--唯一--学生可通过这个添加试卷
	private Integer escore;//试卷总分
	private String estate;//试卷状态 0--代表可以考试   1--代表结束考试且学生可以查看自己的成绩
	private Integer ettl;//考试时长
	private Teacher teacher;//谁出的试卷
	private Date ecreatedate;//试卷创建的时间
	
	@GeneratedValue
	@Id
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	
	@Column(nullable=false,unique=true)
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	
	@Column(nullable=false)
	public Integer getEscore() {
		return escore;
	}
	public void setEscore(Integer escore) {
		this.escore = escore;
	}
	
	@Column(nullable=false)
	public String getEstate() {
		return estate;
	}
	public void setEstate(String estate) {
		this.estate = estate;
	}
	@Column(nullable=false)
	public Integer getEttl() {
		return ettl;
	}
	public void setEttl(Integer ettl) {
		this.ettl = ettl;
	}
	@JoinColumn(name="teacher_id")
	@ManyToOne(fetch=FetchType.EAGER)
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getEcreatedate() {
		return ecreatedate;
	}
	public void setEcreatedate(Date ecreatedate) {
		this.ecreatedate = ecreatedate;
	}
	public EPaper(String ename, Integer escore, String estate, Integer ettl, Teacher teacher, Date ecreatedate) {
		super();
		this.ename = ename;
		this.escore = escore;
		this.estate = estate;
		this.ettl = ettl;
		this.teacher = teacher;
		this.ecreatedate = ecreatedate;
	}
	public EPaper() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "EPaper [eid=" + eid + ", ename=" + ename + ", escore=" + escore + ", estate=" + estate + ", ettl="
				+ ettl + ", teacher=" + teacher + ", ecreatedate=" + ecreatedate + "]";
	}
	
	

}
