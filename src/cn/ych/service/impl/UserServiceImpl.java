package cn.ych.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.ych.dao.UserDao;
import cn.ych.dao.impl.UserDaoImpl;
import cn.ych.pojo.Department;
import cn.ych.pojo.Message;
import cn.ych.pojo.Notice;
import cn.ych.pojo.Role;
import cn.ych.pojo.User;
import cn.ych.service.UserService;

public class UserServiceImpl implements UserService{

	private static UserDao userDao = new UserDaoImpl();
	@Override
	public User queryByName(HttpServletRequest request, String username,String password) {
		// TODO Auto-generated method stub
		User user = userDao.queryByName(username);
		if(user!=null) {
			if(password.equals(user.getPassword())) {
				request.getSession().setAttribute("u", user);
		
				return user;
			}else {

				request.setAttribute("msg", "密码错误");
			}
		}else {
			request.setAttribute("msg", "用户名不能为空");
		}
		
		return null;
	}
	@Override
	public List<User> queryUser(HttpServletRequest request, Integer page,String u_name,String fuzzyQuery,String age,String age1) {
		//查询数据总数
	
		int totalCount = userDao.totalUser();
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("page", page);
		List<User> list = userDao.userAll((page-1)*10,10, u_name,fuzzyQuery,age,age1);
		
		return list;
	}
	@Override
	public void addUser(User u) {
		// TODO Auto-generated method stub
		userDao.addUser(u);
		
	}
	@Override
	public User idByUser(Integer id) {
		// TODO Auto-generated method stub
		return userDao.idByUser(id);
	}
	@Override
	public void updateUser(User u) {
		// TODO Auto-generated method stub
		userDao.updateUser(u);
	}
	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub
		 userDao.deleteUser(id);
	}
	@Override
	public List<Role> findByRoleId() {
		// TODO Auto-generated method stub
		return  userDao.findByRoleId();
	}
	
	//角色
	@Override
	public List<Role> queryRole(HttpServletRequest request, Integer page,String u_name,String fuzzyQuery) {
		// TODO Auto-generated method stub
		int totalCount = userDao.queryRole();
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("page", page);
		List<Role> list = userDao.queryRole((page-1)*10,10,u_name,fuzzyQuery);
		
		return list;
		
	}
	@Override
	public Role updateRole(String id) {
		// TODO Auto-generated method stub
		return userDao.updateRole(id);
	}
	@Override
	public void deleteRole(String id) {
		// TODO Auto-generated method stub
		userDao.deleteRole(id);
	}
	@Override
	public void saveRole(Integer id, Role role) {
		// TODO Auto-generated method stub
		userDao.saveRole(id,  role);
	}
	@Override
	public void addRole(Role role) {
		userDao.addRole(role);
	}
	@Override
	public List<Department> findByDepartmentId() {
		return userDao.findByDepartmentId();
	}
	//部门
	@Override
	public List<Department> queryDepartment(HttpServletRequest request, Integer page, String u_name,String fuzzyQuery) {
				int totalCount = userDao.queryCount();
				request.setAttribute("totalCount", totalCount);
				request.setAttribute("page", page);
				List<Department> list = userDao.queryDepartment((page-1)*10,10,u_name,fuzzyQuery);
				
				return list;
	}
	@Override
	public Department updateDepartment(String department_id) {
		// TODO Auto-generated method stub
		return userDao.updateDepartment(department_id);
	}
	@Override
	public void deleteDepartment(String department_id) {
		// TODO Auto-generated method stub
		userDao.deleteDepartment(department_id);
	}
	@Override
	public void saveDepartment(String id, Department department) {
		// TODO Auto-generated method stub
		userDao.saveDepartment(id,department);
	}
	@Override
	public void addDepartment(Department department) {
		// TODO Auto-generated method stub
		userDao.addDepartment(department);
	}
	
	
	//公告
	@Override
	public List<Notice> queryNotice(HttpServletRequest request, Integer page, String u_name,String fuzzyQuery) {
		int totalCount = userDao.queryNotice();
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("page", page);
		List<Notice> list = userDao.queryNotice((page-1)*10,10,u_name,fuzzyQuery);
		
		return list;
	}
	@Override
	public Notice updateNotice(String notice_id) {
		return userDao.updateNotice(notice_id);
	}
	@Override
	public void deleteNotice(String notice_id) {
		userDao.deleteNotice(notice_id);
	}
	@Override
	public List<Notice> findByNoticeId() {
		return userDao.findByNoticeId();
	}
	@Override
	public void addNotice(Notice notice) {

		userDao.addNotice(notice);
	}
	@Override
	public void saveNotice(String notice_id, Notice notice) {
		userDao.saveNotice(notice_id,notice);
	}
	@Override //发送 保存邮件
	public Boolean addMessage(String addMessage, Message message) {
		return userDao.addMessage(addMessage,message);
	}
	@Override
	public List<Message> queryMessage(HttpServletRequest request,String addMessage,Integer user_id,Integer page) {
		Integer count = userDao.queryInboxCount(user_id);
		request.setAttribute("totalCount", count);
		request.setAttribute("page", page);
		return userDao.queryMessage(addMessage,user_id,(page-1)*10,10);
	}
	@Override //根据不同的用户查询不同的邮件
	public List<User> findByUserId() {
		return userDao.findByUserId();
	}
	@Override  //查询草稿箱信息
	public List<Message> queryDrafts(HttpServletRequest request,Boolean addMessage,Integer user_id,Integer  page) {
		//发件箱和草稿箱数据总条数
		
		int count = userDao.queryMessageCount(addMessage,user_id);
		request.setAttribute("totalCount", count);
		request.setAttribute("page", page);
	
		return 	userDao.queryDrafts(addMessage,user_id,(page-1)*10,10);
	}
	@Override
	public Message updateMessage(String id) {
		return userDao.updateMessage(id);
	}
	@Override
	public void addMessage1(String addMessage, Message message) {
		
		userDao.addMessage1(addMessage,message);
	}
	@Override
	public void deleteMessage(String addMessage,String message_id,Integer receive_id) {

		userDao.deleteMessage(addMessage,message_id,receive_id);
	}
	@Override //查询垃圾箱
	public List<Message> selectMessage(Integer id) {
		
		List<Message> list = userDao.selectMessage(id);
		
		return list;
	}
	@Override //邮件垃圾箱删除
	public void delete(String message_id,Integer user_id,Integer receiver) {
		userDao.delete(message_id,user_id,receiver);
	}
	@Override //邮件垃圾箱还原
	public void restoreMessage(String message_id,Integer user_id) {
		userDao.restoreMessage(message_id,user_id);
	}

}
