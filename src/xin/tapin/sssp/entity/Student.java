package xin.tapin.sssp.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Table(name="olt_student")
@Entity
public class Student {

	private Integer sId;//主键
	private String sNum;//唯一
	private String sName;
	private String sPwd;
	private String sEmail;//找回密码用
	private String sGender;//性别
	private Date sCreateTime;//申请日期
	private String sIntroduction;//个人简介
	private String sState;//状态
	
	@GeneratedValue
	@Id
	public Integer getsId() {
		return sId;
	}
	public void setsId(Integer sId) {
		this.sId = sId;
	}
	
	@Column(unique=true,length=11,nullable=false)
	public String getsNum() {
		return sNum;
	}
	public void setsNum(String sNum) {
		this.sNum = sNum;
	}
	@Column(length=12,nullable=false)
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	@Column(length=32,nullable=false)
	public String getsPwd() {
		return sPwd;
	}
	public void setsPwd(String sPwd) {
		this.sPwd = sPwd;
	}
	@Column(nullable=false)
	public String getsEmail() {
		return sEmail;
	}
	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}
	@Column(nullable=false,length=2)
	public String getsGender() {
		return sGender;
	}
	public void setsGender(String sGender) {
		this.sGender = sGender;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getsCreateTime() {
		return sCreateTime;
	}
	public void setsCreateTime(Date sCreateTime) {
		this.sCreateTime = sCreateTime;
	}
	
	public String getsIntroduction() {
		return sIntroduction;
	}
	public void setsIntroduction(String sIntroduction) {
		this.sIntroduction = sIntroduction;
	}
	
	
	@Column(length=2)
	public String getsState() {
		return sState;
	}
	public void setsState(String sState) {
		this.sState = sState;
	}
	public Student() {
		super();
	}
	

}
