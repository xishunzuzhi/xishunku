package cn.ych.pojo;

import java.util.Date;

import lombok.Data;

/**
 * 
 * @author Administrator
 *
 * 
	customer_state_id	int(10)	主键 自动增长 自增初始值4	状态ID	   
	customer_state_name	varchar(15)	默认值 NULL	状态名称	   
	customer_state_desc	varchar(100)	默认值 NULL	状态描述	   
	status	int	默认值：2   
	remark	varchar(50)	NULL	备注	   
	create_time	timestamp	默认值 CURRENT_TIMESTAMP	添加时间	   
	creater	int	默认值 NULL	添加人	   
	update_time	timestamp	默认值 ''	修改时间	   
	updater	int	默认值 NULL	修改人	 

 */
@Data
public class Customer_state {
	private Integer customer_state_id;
	private String customer_state_name;
	private String customer_state_desc;
	private Integer status;
	private String remark;
	private Date create_time;
	private Integer creater;
	private Date update_time;
	private Integer updater;

}
