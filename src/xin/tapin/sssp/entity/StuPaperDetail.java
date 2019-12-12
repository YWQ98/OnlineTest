package xin.tapin.sssp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="olt_stupaperdetail")
@Entity
public class StuPaperDetail {

	private Integer spdid;//主键
	private String edanswer;//学生给的答案
	private Integer score;//该题得分
	private QItem qItem;//对应那张试卷下的哪些题目
	private StuPaper stuPaper;//对应哪个学生的试卷
	@GeneratedValue
	@Id
	public Integer getSpdid() {
		return spdid;
	}
	public void setSpdid(Integer spdid) {
		this.spdid = spdid;
	}
	@Column
	public String getEdanswer() {
		return edanswer;
	}
	public void setEdanswer(String edanswer) {
		this.edanswer = edanswer;
	}
	@Column
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	@JoinColumn(name="qitem_id",nullable=false)
	@ManyToOne(fetch=FetchType.EAGER)
	public QItem getqItem() {
		return qItem;
	}
	public void setqItem(QItem qItem) {
		this.qItem = qItem;
	}

	@JoinColumn(name="stupaper_id",nullable=false)
	@ManyToOne(fetch=FetchType.EAGER)
	public StuPaper getStuPaper() {
		return stuPaper;
	}
	public void setStuPaper(StuPaper stuPaper) {
		this.stuPaper = stuPaper;
	}
	public StuPaperDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StuPaperDetail(String edanswer, Integer score, QItem qItem, StuPaper stuPaper) {
		super();
		this.edanswer = edanswer;
		this.score = score;
		this.qItem = qItem;
		this.stuPaper = stuPaper;
	}
	@Override
	public String toString() {
		return "StuPaperDetail [spdid=" + spdid + ", edanswer=" + edanswer + ", score=" + score + ", qItem=" + qItem
				+ ", stuPaper=" + stuPaper + "]";
	}
	
	
	
}
