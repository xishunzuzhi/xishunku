package cn.ych.pojo;

import java.util.Date;

import lombok.Data;

/**
 * 
 * @author Administrator
 *
 * 
	customer_category_id	int(10)	主键 自动增长 自增初始值5	客户类型ID	   
	customer_category_name	varchar(15)	默认值 NULL	分类名称	   
	customer_category_desc	varchar(100)	默认值 NULL	分类描述	   
	status	int	默认值：2
	remark	varchar(50)	NULL	备注	   
	create_time	timestamp	默认值 CURRENT_TIMESTAMP	添加时间	   
	creater	int	默认值 NULL	添加人	   
	update_time	timestamp	默认值 ''	修改时间	   
	updater	int	默认值 NULL	修改人	 

 */
@Data
public class Customer_category {
	private Integer customer_category_id;
	private String customer_category_name;
	private String customer_category_desc;
	private Integer status;
	private String remark;
	private Date create_time;
	private Integer creater;
	private Date update_time;
	private Integer updater;
	public Customer_category() {
		super();
	}
	public Customer_category(String customer_category_name, String customer_category_desc, Integer status,
			Integer creater, Integer updater, String remark) {
		this.customer_category_name = customer_category_name;
		this.customer_category_desc = customer_category_desc;
		this.status = status;
		this.remark = remark;
		this.creater = creater;
		this.updater = updater;
	}
}
