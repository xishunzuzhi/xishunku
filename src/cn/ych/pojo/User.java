package cn.ych.pojo;

import java.util.Date;

import lombok.Data;
@Data
public class User {
	private Integer user_id;
	private Integer department_id;
	private Integer role_id;
	                
	private String  username;
	private Boolean is_male;
	private String  mobile;
	                
	private Integer age;
	private String  address;
	private Boolean is_admin;
	private Boolean is_system;

	private String  password;
	private String  tel;
	private String  id_num;
	private String  email;
	private String  hobby;
	                
	private Integer education;
	private String  card_num;
	private String  nation;
	                
	private Integer marry;
	private Integer status;
	private String  remark;
	private Date    create_time;
	private Integer creater;
	private Date    update_time;
	private Integer updater;
	public User() {
		super();
	}
	public User( Integer department_id, Integer role_id, String username, Boolean is_male,
			String mobile, Integer age, String address, Boolean is_admin, Boolean is_system, String password,
			String tel, String id_num, String email, String hobby, Integer education, String card_num, String nation,
			Integer marry, Integer status, String remark,  Integer creater, 
			Integer updater) {
		super();
		this.department_id = department_id;
		this.role_id = role_id;
		this.username = username;
		this.is_male = is_male;
		this.mobile = mobile;
		this.age = age;
		this.address = address;
		this.is_admin = is_admin;
		this.is_system = is_system;
		this.password = password;
		this.tel = tel;
		this.id_num = id_num;
		this.email = email;
		this.hobby = hobby;
		this.education = education;
		this.card_num = card_num;
		this.nation = nation;
		this.marry = marry;
		this.status = status;
		this.remark = remark;
		
		this.creater = creater;
		
		this.updater = updater;
	}
	public User(Integer id, Integer department_id, Integer role_id, String username, Boolean is_male,
			String mobile, Integer age, String address, Boolean is_admin, Boolean is_system, String password,
			String tel, String id_num, String email, String hobby, Integer education, String card_num,
			String nation, Integer marry, Integer status, String remark, Integer creater, Integer updater) {
		this.user_id=id;
		this.department_id = department_id;
		this.role_id = role_id;
		this.username = username;
		this.is_male = is_male;
		this.mobile = mobile;
		this.age = age;
		this.address = address;
		this.is_admin = is_admin;
		this.is_system = is_system;
		this.password = password;
		this.tel = tel;
		this.id_num = id_num;
		this.email = email;
		this.hobby = hobby;
		this.education = education;
		this.card_num = card_num;
		this.nation = nation;
		this.marry = marry;
		this.status = status;
		this.remark = remark;
		this.creater = creater;
		this.updater = updater;
	}
}
