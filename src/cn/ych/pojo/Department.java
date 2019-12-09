package cn.ych.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class Department {
	private Integer department_id;	
	private String department_name;	
	private String department_desc;	
	private Integer status;	
	private String remark;	
	private Date create_time;	
	private Integer creater;	
	private Date update_time;	
    private Integer updater;
    
	public Department() {
		super();
	}
	public Department(String department_name, String department_desc, Integer status, Integer creater,
			Integer updater, String remark) {
		this.department_name = department_name;
		this.department_desc = department_desc;
		this.status = status;
		this.remark = remark;
		this.creater = creater;
		this.updater = updater;
	}

}
