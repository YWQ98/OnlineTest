package xin.tapin.sssp.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="olt_option")
@Entity
public class Option {

	private Integer oid;
	private QItem qItem;
	private String choice;

	@GeneratedValue
	@Id
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	@JoinColumn(name="qItem_id")
	@ManyToOne(fetch=FetchType.EAGER)
	public QItem getqItem() {
		return qItem;
	}
	public void setqItem(QItem qItem) {
		this.qItem = qItem;
	}
	@Column
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	public Option() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Option(QItem qItem, String choice) {
		super();
		this.qItem = qItem;
		this.choice = choice;
	}
	@Override
	public String toString() {
		return "Option [oid=" + oid + ", qItem=" + qItem + ", choice=" + choice + "]";
	}
	

}
