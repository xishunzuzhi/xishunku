package cn.ych.pojo;

import java.util.Date;

import lombok.Data;
@Data
public class Message {
	private Integer message_id;
	private String subject;
	private String content;
	private Integer sender;
	private Integer send_delete;
	private Integer send_status;
	private Date save_time;
	private Date send_time;
	private Date send_update_time;
	private Integer receiver;
	private Integer receive_delete;
	private Integer receive_status;
	private Date receive_update_time;
	public Message() {
		super();
	}
	public Message(Integer message_id, String subject, Integer sender, Integer receiver, String content) {
		
		this.message_id=message_id;
		this.subject = subject;
		this.content = content;
		this.sender = sender;
		this.receiver = receiver;
	}
	public Message(String subject, Integer sender, Integer receiver, String content) {
	
		this.subject = subject;
		this.content = content;
		this.sender = sender;
		this.receiver = receiver;
	}
}
