package cn.ych.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.ych.pojo.Customer;
import cn.ych.pojo.Customer_category;
import cn.ych.pojo.Customer_source;
import cn.ych.pojo.Customer_state;
import cn.ych.pojo.Department;
import cn.ych.pojo.Notice;

public interface CustomerService {

	//查询所有数据
	List<Customer> show(HttpServletRequest request, Integer page);
	
	List<Customer_category> showCategory(HttpServletRequest request, Integer page);
	
	List<Customer_source> showSource(HttpServletRequest request, Integer page);

	List<Customer_state> showState(HttpServletRequest request, Integer page);

	//修改回显数据
	Customer update(String customer_id);
	
	Customer_category updateCategory(String customer_category_id);
	
	Customer_state updateState(String customer_id);

	Customer_source updateSource(String customer_id);
	
	//删除
	void delete(String customer_id);
	
	void deleteCategory(String customer_category_id);
	
	void deleteState(String customer_id);

	void deleteSource(String customer_id);
	
	//修改
	void save(Integer customer_id, Customer customer);
	
	void saveCategory(Integer customer_category_id, Customer_category customer_category);

	//添加
	void add(Customer customer);
	
	void addCategory(Customer_category customer_category);
	
	List<Customer_source> findByCustomer_sourceId();

	List<Customer_category> findByCustomer_categoryId();

	List<Customer_state> findByCustomer_stateId();

	List<Notice> showInteriorNotice(HttpServletRequest request, Integer page, Integer department_id);

	List<Department> showInteriorDepartment(HttpServletRequest request, Integer page, Integer department_id);





	

	



	



	


	

}
