package xin.tapin.sssp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="olt_answer")
@Entity
public class Answer {

	private Integer aid;
	private QItem item;
	private String answer;

	@GeneratedValue
	@Id
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	@JoinColumn(name="qItem_id")
	@ManyToOne(fetch=FetchType.EAGER)
	public QItem getItem() {
		return item;
	}
	public void setItem(QItem item) {
		this.item = item;
	}
	@Column
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Answer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Answer(QItem item, String answer) {
		super();
		this.item = item;
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "Answer [aid=" + aid + ", item=" + item + ", answer=" + answer + "]";
	}
	

}
