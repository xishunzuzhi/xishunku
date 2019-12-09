package cn.ych.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.ych.dao.CustomerDao;
import cn.ych.dao.impl.CustomerDaoImpl;
import cn.ych.pojo.Customer;
import cn.ych.pojo.Customer_category;
import cn.ych.pojo.Customer_source;
import cn.ych.pojo.Customer_state;
import cn.ych.pojo.Department;
import cn.ych.pojo.Notice;
import cn.ych.service.CustomerService;

public class CustomerServiceImpl implements CustomerService{
	private CustomerDao customerDao = new CustomerDaoImpl();
	@Override  //查询所有数据
	public List<Customer> show(HttpServletRequest request,Integer page) {
		int count = customerDao.queryCustomerCount();	
		request.setAttribute("totalCount", count);
		request.setAttribute("page", page);
		
		return customerDao.show((page-1)*10,10);	
	}
	@Override
	public List<Customer_category> showCategory(HttpServletRequest request, Integer page) {
		int count = customerDao.queryCategoryCount();	
		request.setAttribute("totalCount", count);
		request.setAttribute("page", page);
		
		return customerDao.showCategory((page-1)*10,10);	
	}
	@Override
	public List<Customer_source> showSource(HttpServletRequest request, Integer page) {
		int count = customerDao.querySourceCount();	
		request.setAttribute("totalCount", count);
		request.setAttribute("page", page);
		return customerDao.showSource((page-1)*10,10);	
	}

	@Override
	public List<Customer_state> showState(HttpServletRequest request, Integer page) {
		int count = customerDao.queryStateCount();	
		request.setAttribute("totalCount", count);
		request.setAttribute("page", page);
		return customerDao.showState((page-1)*10,10);	
	}
	
	@Override //修改回显数据
	public Customer update(String customer_id) {
		return customerDao.update(customer_id);
	}
	
	@Override
	public Customer_category updateCategory(String customer_category_id) {
		
		return customerDao.updateCategory(customer_category_id);
	}
	@Override
	public Customer_state updateState(String customer_id) {
		
		return customerDao.updateState(customer_id);
	}
	@Override
	public Customer_source updateSource(String customer_id) {
		
		return customerDao.updateSource(customer_id);
	}
	
	@Override //删除
	public void delete(String customer_id) {
		customerDao.delete(customer_id);
	}
	@Override
	public void deleteCategory(String customer_category_id) {
		customerDao.deleteCategory(customer_category_id);
	}
	@Override
	public void deleteState(String customer_id) {
		customerDao.deleteState(customer_id);
	}
	@Override
	public void deleteSource(String customer_id) {
		customerDao.deleteSource(customer_id);
	}
	
	@Override //修改
	public void save(Integer customer_id, Customer customer) {
		customerDao.save(customer_id,customer);
	}
	@Override
	public void saveCategory(Integer customer_category_id, Customer_category customer_category) {
		customerDao.saveCategory(customer_category_id,customer_category);		
	}

	@Override //添加
	public void add(Customer customer) {
		customerDao.add(customer);
		
	}
	@Override
	public void addCategory(Customer_category customer_category) {
		customerDao.addCategory(customer_category);
	}
	
	
	
	
	@Override
	public List<Customer_source> findByCustomer_sourceId() {
		return customerDao.findByCustomer_sourceId();
	}
	@Override
	public List<Customer_category> findByCustomer_categoryId() {
		return customerDao.findByCustomer_categoryId();
	}
	@Override
	public List<Customer_state> findByCustomer_stateId() {
		return customerDao.findByCustomer_stateId();
	}
	
	
	@Override //内部信息
	public List<Notice> showInteriorNotice(HttpServletRequest request, Integer page, Integer department_id) {
		int count = customerDao.queryInteriorCount(department_id);	
		
		request.setAttribute("totalCount", count);
		request.setAttribute("page", page);
	
		return customerDao.showInteriorNotice((page-1)*5,10,department_id);
	}
	@Override
	public List<Department> showInteriorDepartment(HttpServletRequest request, Integer page, Integer department_id) {
		int count = customerDao.queryDepartmentCount(department_id);	
		
		request.setAttribute("totalCount", count);
		request.setAttribute("page", page);
	
		return customerDao.showInteriorDepartment((page-1)*10,10,department_id);
	}
	
	


}
