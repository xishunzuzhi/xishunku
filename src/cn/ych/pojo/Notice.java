package cn.ych.pojo;

import java.util.Date;

import lombok.Data;
@Data
public class Notice {
	private Integer notice_id;
	private Integer receive_id;
	private String subject;
	private String text;
	private Date pub_time;
	private Date expire_time;
	private Integer status;
	private String remark;
	private Date create_time;
	private Integer creater;
	private Date update_time;
	private Integer updater;
	public Notice() {
		super();
	}
	public Notice(Integer receive_id, String subject, String text, Date expire_time, Integer status,
			String remark, Integer creater, Integer updater) {
		this.receive_id = receive_id;
		this.subject = subject;
		this.expire_time=expire_time;
		this.text = text;
		this.status = status;
		this.remark = remark;
		this.creater = creater;
		this.updater = updater;
		
	}
}
