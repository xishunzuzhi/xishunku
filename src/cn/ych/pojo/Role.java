package cn.ych.pojo;

import java.util.Date;

import lombok.Data;
@Data
public class Role {
    private Integer role_id; 
	private String role_name; 
	private Integer role_permission; 
	private Integer status; 
	private String remark; 
	private Date create_time; 
	private Integer creater; 
	private Date update_time; 
	private Integer updater;
	public Role() {
		super();
	}
	public Role(String role_name, Integer role_permission, Integer status, Integer creater, Integer updater,
			String remark) {
		this.role_name = role_name;
		this.role_permission = role_permission;
		this.status = status;
		this.remark = remark;
		this.creater = creater;
		this.updater = updater;
	}
}
