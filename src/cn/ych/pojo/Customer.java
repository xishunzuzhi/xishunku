package cn.ych.pojo;

import java.util.Date;

import lombok.Data;

/**
 * 
 * @author Administrator
	customer_id	int(10)	主键 自动增长 自增初始值5	客户ID	   
	customer_state_id	int(10)	外键 默认值 NULL	客户状态ID	   
	customer_source_id	int(10)	外键 默认值 NULL	客户来源ID	   
	user_id	int(10)	外键 默认值 NULL	责任员工ID	   
	customer_category_id	int(10)	外键 默认值 NULL	客户类型ID	   
	customer_name	varchar(10)	默认值 NULL	客户姓名	   
	customer_is_male	bit	默认值 NULL	客户性别	   
	customer_mobile	varchar(20)	默认值 NULL	客户手机	   
	customer_qq	varchar(20)	默认值 NULL	客户QQ	   
	customer_address	varchar(100)	默认值 NULL	客户地址	   
	customer_email	varchar(100)	默认值 NULL	客户邮箱	   
	customer_remark	varchar(1000)	默认值 NULL	备注	   
	customer_position	varchar(100)	默认值 NULL	客户职位	   
	customer_blog	varchar(100)	默认值 NULL	客户微博	   
	customer_tel	varchar(50)	默认值 NULL	客户座机	   
	customer_birth	timestamp	默认值 CURRENT_TIMESTAMP	出生日期	   
	customer_company	varchar(50)	默认值 NULL	客户公司	   
	status	int	默认值：2 
	remark	varchar(50)	NULL	备注	   
	create_time	timestamp	默认值 CURRENT_TIMESTAMP	添加时间	   
	creater	int	默认值 NULL	添加人	   
	update_time	timestamp	默认值 ''	修改时间	   
	updater	int	默认值 NULL	修改人	 

 *
 *
 */
	@Data
	public class Customer {
		private Integer customer_id;			
		private Integer customer_state_id;			
		private Integer customer_source_id;			
		private Integer user_id;			
		private Integer customer_category_id;	
		private String customer_name;			
		private Boolean customer_is_male;	
		
		private String customer_mobile;			
		private String customer_qq;			
		private String customer_address;			
		private String customer_email;			
		private String customer_remark;			
		private String customer_position;			
		private String customer_blog;			
		private String customer_tel;	
		
		private Date customer_birth;			
		private String customer_company;			
		private Integer status;			
		private String remark;			
		private Date create_time;			
		private Integer creater;			
		private Date update_time;			
		private Integer updater;
		public Customer() {
			super();
		}
		public Customer(Integer customer_state_id, Integer customer_source_id, Integer user_id, Integer customer_category_id, String customer_name,
				Boolean customer_is_male, String customer_mobile, String customer_qq, String customer_address, String customer_email, String customer_remark,
				String customer_position, String customer_blog, String customer_tel, Date customer_birth, String customer_company, Integer status,
				Integer creater, Integer updater, String remark) {
			this.customer_state_id = customer_state_id;
			this.customer_source_id = customer_source_id;
			this.user_id = user_id;
			this.customer_category_id = customer_category_id;
			this.customer_name = customer_name;
			this.customer_is_male = customer_is_male;
			this.customer_mobile = customer_mobile;
			this.customer_qq = customer_qq;
			this.customer_address = customer_address;
			this.customer_email = customer_email;
			this.customer_remark = customer_remark;
			this.customer_position = customer_position;
			this.customer_blog = customer_blog;
			this.customer_tel = customer_tel;
			this.customer_birth = customer_birth;
			this.customer_company = customer_company;
			this.status = status;
			this.remark = remark;
			this.creater = creater;
			this.updater = updater;
		
		}
		
	}
