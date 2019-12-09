package cn.ych.dao;

import java.util.List;

import cn.ych.pojo.Customer;
import cn.ych.pojo.Customer_category;
import cn.ych.pojo.Customer_source;
import cn.ych.pojo.Customer_state;
import cn.ych.pojo.Department;
import cn.ych.pojo.Notice;

public interface CustomerDao {
	//统计数据条数
	int queryCustomerCount();
	
	int queryCategoryCount();
	
	int querySourceCount();
	
	int queryStateCount();

	//查询所有数据
	List<Customer> show(int begin, int number);
	
	List<Customer_category> showCategory(int begin, int number);
	
	List<Customer_source> showSource(int begin, int number);

	List<Customer_state> showState(int begin, int number);
	
	
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
	void addCategory(Customer_category customer_category);
	
	void add(Customer customer);


	

	List<Customer_source> findByCustomer_sourceId();

	List<Customer_category> findByCustomer_categoryId();

	List<Customer_state> findByCustomer_stateId();

	int queryInteriorCount(Integer department_id);

	List<Notice> showInteriorNotice(int page, int number, Integer department_id);

	int queryDepartmentCount(Integer department_id);

	List<Department> showInteriorDepartment(int begin, int number, Integer department_id);

	



	








	

}
