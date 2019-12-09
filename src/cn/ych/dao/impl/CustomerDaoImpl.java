package cn.ych.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import cn.ych.dao.CustomerDao;
import cn.ych.pojo.Customer;
import cn.ych.pojo.Customer_category;
import cn.ych.pojo.Customer_source;
import cn.ych.pojo.Customer_state;
import cn.ych.pojo.Department;
import cn.ych.pojo.Notice;
import cn.ych.util.JDBCUtil;
import cn.ych.util.PageUtil;

public class CustomerDaoImpl implements CustomerDao{

	@Override //统计数据总数
	public int queryCustomerCount() {
		return PageUtil.getTotal("customer");
	}
	@Override
	public int queryCategoryCount() {
		return PageUtil.getTotal("customer_category");
	}
	@Override
	public int querySourceCount() {
		return PageUtil.getTotal("customer_source");
		
	}
	@Override
	public int queryStateCount() {
		return PageUtil.getTotal("customer_state");
	}
	
	
	
	@Override  //查询数据
	public List<Customer> show(int begin, int number) {
		
		String sql ="select * from customer limit "+begin+","+number;
		return JDBCUtil.dbDQL(sql, Customer.class); 
		
	}
	@Override
	public List<Customer_category> showCategory(int begin, int number) {
		String sql ="select * from customer_category limit "+begin+","+number;
		return JDBCUtil.dbDQL(sql, Customer_category.class); 
	}

	@Override
	public List<Customer_source> showSource(int begin, int number) {
		String sql ="select * from customer_source limit "+begin+","+number;
		return JDBCUtil.dbDQL(sql, Customer_source.class); 
	}
	@Override
	public List<Customer_state> showState(int begin, int number) {
		String sql ="select * from customer_state limit "+begin+","+number;
		return JDBCUtil.dbDQL(sql, Customer_state.class); 
	}
	
	
	@Override  //修改数据回显
	public Customer update(String customer_id) {
		String sql = "select * from customer where customer_id=?";
		return JDBCUtil.dbDQL(sql, Customer.class, customer_id).get(0);
	}
	
	@Override
	public Customer_category updateCategory(String customer_category_id) {
		String sql = "select * from customer_category where customer_category_id=?";
		return JDBCUtil.dbDQL(sql, Customer_category.class, customer_category_id).get(0);
	}
	
	@Override
	public Customer_state updateState(String customer_id) {
		String sql = "select * from customer_state where customer_state_id=?";
		return JDBCUtil.dbDQL(sql, Customer_state.class, customer_id).get(0);
	}
	@Override
	public Customer_source updateSource(String customer_id) {
		String sql = "select * from customer_source where customer_source_id=?";
		return JDBCUtil.dbDQL(sql, Customer_source.class, customer_id).get(0);
	}
	
	@Override  //删除
	public void delete(String customer_id) {
		String sql = "update customer set status= -2 where customer_id = ? ";
		JDBCUtil.dbDML(sql, customer_id);
	}
	@Override
	public void deleteCategory(String customer_category_id) {
		String sql = "update customer_category set status= -2 where customer_category_id = ? ";
		JDBCUtil.dbDML(sql, customer_category_id);
	}
	@Override
	public void deleteState(String customer_id) {
		String sql = "update customer_state set status= -2 where customer_state_id = ? ";
		JDBCUtil.dbDML(sql, customer_id);
		
	}
	@Override
	public void deleteSource(String customer_id) {
		String sql = "update customer_source set status= -2 where customer_source_id = ? ";
		JDBCUtil.dbDML(sql, customer_id);
		
	}
	
	//customer_id  customer_state_id  customer_source_id  user_id  customer_category_id
	//customer_name  customer_is_male  customer_mobile  customer_qq  customer_address
	//customer_email  customer_remark  customer_position  customer_blog  customer_tel
	//customer_birth  customer_company  status  remark  create_time
	//creater  update_time  updater
	
	@Override //修改
	public void save(Integer customer_id, Customer customer) {
		
		String sql = "update customer set customer_state_id=?,customer_source_id=?,user_id=?,customer_category_id=?,customer_name=?,"
				+ "customer_is_male=?,customer_mobile=?,customer_qq=?,customer_address=?,customer_email=?,customer_remark=?,customer_position=?,"
				+ "customer_blog=?,customer_tel=?,customer_birth=?,customer_company=?,status=?,creater=?,update_time=CURRENT_TIMESTAMP,updater=?,remark=? where customer_id=?";
		JDBCUtil.dbDML(sql, customer.getCustomer_state_id(),customer.getCustomer_source_id(),customer.getUser_id(),customer.getCustomer_category_id(),
				customer.getCustomer_name(),customer.getCustomer_is_male(),customer.getCustomer_mobile(),customer.getCustomer_qq(),customer.getCustomer_address(),
				customer.getCustomer_email(),customer.getCustomer_remark(),customer.getCustomer_position(),customer.getCustomer_blog(),customer.getCustomer_tel(),
				customer.getCustomer_birth(),customer.getCustomer_company(),customer.getStatus(),customer.getCreater(),customer.getUpdater(),customer.getRemark(),customer_id
				);
	}
	
	@Override
	public void saveCategory(Integer customer_category_id, Customer_category customer_category) {
		String sql = "update customer_category set customer_category_name=?,customer_category_desc=?,status=?,creater=?,update_time=CURRENT_TIMESTAMP,updater=?,remark=? where customer_category_id=?";
		JDBCUtil.dbDML(sql, customer_category.getCustomer_category_name(),customer_category.getCustomer_category_desc(),customer_category.getStatus(),customer_category.getCreater(),customer_category.getUpdater(),
				customer_category.getRemark(),customer_category_id);
	}

	
	
	@Override  //添加
	public void add(Customer customer) {
		String sql = "insert into customer values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP,?,null,?)";
		JDBCUtil.dbDML(sql, customer.getCustomer_state_id(),customer.getCustomer_source_id(),customer.getUser_id(),customer.getCustomer_category_id(),
				customer.getCustomer_name(),customer.getCustomer_is_male(),customer.getCustomer_mobile(),customer.getCustomer_qq(),customer.getCustomer_address(),
				customer.getCustomer_email(),customer.getCustomer_remark(),customer.getCustomer_position(),customer.getCustomer_blog(),customer.getCustomer_tel(),
				customer.getCustomer_birth(),customer.getCustomer_company(),customer.getStatus(),customer.getRemark(),customer.getCreater(),customer.getUpdater());
		
	}
	
	@Override
	public void addCategory(Customer_category customer_category) {
		String sql = "insert into customer_category values(null,?,?,?,?,CURRENT_TIMESTAMP,?,null,?)";
		JDBCUtil.dbDML(sql, customer_category.getCustomer_category_name(),customer_category.getCustomer_category_desc(),customer_category.getStatus(),customer_category.getCreater(),
				customer_category.getUpdater(),customer_category.getRemark());
	}
	
	@Override
	public List<Customer_source> findByCustomer_sourceId() {
		String sql = "select * from customer_source";
		return JDBCUtil.dbDQL(sql, Customer_source.class);
	}
	
	
	@Override
	public List<Customer_category> findByCustomer_categoryId() {
		String sql = "select * from customer_category";		
		return JDBCUtil.dbDQL(sql, Customer_category.class);
	}
	
	
	@Override
	public List<Customer_state> findByCustomer_stateId() {
		String sql = "select * from customer_state";		
		return JDBCUtil.dbDQL(sql, Customer_state.class);
	}
	@Override
	public int queryInteriorCount(Integer department_id) {
		Connection connection = JDBCUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int sum = 0 ;
		String sql = "SELECT COUNT(*) FROM notice WHERE receive_id="+department_id;
		
		try {
			ps = connection.prepareStatement(sql);
			 rs = ps.executeQuery();
			 if(rs.next()) {
				 sum = rs.getInt(1);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(connection, ps, rs);
		}

		return sum;
	}
	@Override
	public List<Notice> showInteriorNotice(int begin, int number, Integer department_id) {
		String sql = "select * from notice where receive_id=? limit "+begin+","+number;
		return JDBCUtil.dbDQL(sql, Notice.class, department_id);
	}
	@Override
	public int queryDepartmentCount(Integer department_id) {
		Connection connection = JDBCUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int sum = 0 ;
		String sql = "SELECT COUNT(*) FROM department WHERE department_id="+department_id;
		
		try {
			ps = connection.prepareStatement(sql);
			 rs = ps.executeQuery();
			 if(rs.next()) {
				 sum = rs.getInt(1);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(connection, ps, rs);
		}

		return sum;
	}
	@Override
	public List<Department> showInteriorDepartment(int begin, int number, Integer department_id) {
		String sql = "select * from Department where department_id=? limit "+begin+","+number;
		return JDBCUtil.dbDQL(sql, Department.class, department_id);
	}


}
