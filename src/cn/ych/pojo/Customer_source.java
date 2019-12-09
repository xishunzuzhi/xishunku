package cn.ych.pojo;

import java.util.Date;

import lombok.Data;

/**
 * 
 * @author Administrator
 * 
	customer_source_id	int(10)	主键 自动增长 自增初始值4	客户来源ID	   
	customer_source_name	varchar(15)	默认值 NULL	客户来源	   
	customer_source_desc	varchar(50)	默认值 NULL	来源说明	   
	status	int	默认值：2 
	remark	varchar(50)	NULL	备注	   
	create_time	timestamp	默认值 CURRENT_TIMESTAMP	添加时间	   
	creater	int	默认值 NULL	添加人	   
	update_time	timestamp	默认值 ''	修改时间	   
	updater	int	默认值 NULL	修改人	 

 */
@Data
public class Customer_source {
	private Integer customer_source_id;
	private String customer_source_name;
	private String customer_source_desc;
	private Integer status;
	private String remark;
	private Date create_time;
	private Integer creater;
	private Date update_time;
	private Integer updater;

}
