package xin.tapin.sssp.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Table(name="olt_teacher")
@Entity
public class Teacher {

	private Integer tId;//主键
	private String tNum;//唯一
	private String tName;
	private String tPwd;
	private String tEmail;//找回密码用
	private String tGender;//性别
	private Date tCreateTime;//申请日期
	private String tIntroduction;//个人简介
	private String tState;//状态
	
	@GeneratedValue
	@Id
	public Integer gettId() {
		return tId;
	}
	public void settId(Integer tId) {
		this.tId = tId;
	}
	
	@Column(unique=true,length=11,nullable=false)
	public String gettNum() {
		return tNum;
	}
	public void settNum(String tNum) {
		this.tNum = tNum;
	}
	@Column(length=12,nullable=false)
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	@Column(length=32,nullable=false)
	public String gettPwd() {
		return tPwd;
	}
	public void settPwd(String tPwd) {
		this.tPwd = tPwd;
	}
	@Column(nullable=false)
	public String gettEmail() {
		return tEmail;
	}
	public void settEmail(String tEmail) {
		this.tEmail = tEmail;
	}
	@Column(nullable=false,length=2)
	public String gettGender() {
		return tGender;
	}
	public void settGender(String tGender) {
		this.tGender = tGender;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date gettCreateTime() {
		return tCreateTime;
	}
	public void settCreateTime(Date tCreateTime) {
		this.tCreateTime = tCreateTime;
	}
	
	public String gettIntroduction() {
		return tIntroduction;
	}
	public void settIntroduction(String tIntroduction) {
		this.tIntroduction = tIntroduction;
	}
	
	
	@Column(length=2)
	public String gettState() {
		return tState;
	}
	public void settState(String tState) {
		this.tState = tState;
	}
	public Teacher() {
		super();
	}
	@Override
	public String toString() {
		return "Teacher [tId=" + tId + ", tNum=" + tNum + ", tName=" + tName + ", tPwd=" + tPwd + ", tEmail=" + tEmail
				+ ", tGender=" + tGender + ", tCreateTime=" + tCreateTime + ", tIntroduction=" + tIntroduction
				+ ", tState=" + tState + "]";
	}
	

}
