package xin.tapin.sssp.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="olt_epaperdetail")
@Entity
public class EPaperDetail {

	private Integer edid;//主键
	private EPaper ePaper;//外键--属于那张试卷
	private QItem qItem;//外键--题目详情
	@GeneratedValue
	@Id
	public Integer getEdid() {
		return edid;
	}
	public void setEdid(Integer edid) {
		this.edid = edid;
	}

	@JoinColumn(name="epaper_id",nullable=false)
	@ManyToOne(fetch=FetchType.EAGER)
	public EPaper getePaper() {
		return ePaper;
	}
	public void setePaper(EPaper ePaper) {
		this.ePaper = ePaper;
	}
	@JoinColumn(name="qitem_id",nullable=false)
	@ManyToOne(fetch=FetchType.EAGER)
	public QItem getqItem() {
		return qItem;
	}
	public void setqItem(QItem qItem) {
		this.qItem = qItem;
	}
	public EPaperDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EPaperDetail(EPaper ePaper, QItem qItem) {
		super();
		this.ePaper = ePaper;
		this.qItem = qItem;
	}
	@Override
	public String toString() {
		return "EPaperDetail [edid=" + edid + ", ePaper=" + ePaper + ", qItem=" + qItem + "]";
	}
	
	
	
}
