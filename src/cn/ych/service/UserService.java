package cn.ych.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.ych.pojo.Department;
import cn.ych.pojo.Message;
import cn.ych.pojo.Notice;
import cn.ych.pojo.Role;
import cn.ych.pojo.User;

public interface UserService {
	
	User queryByName(HttpServletRequest request, String username,String password);

	List<User> queryUser(HttpServletRequest request, Integer page,String u_name,String fuzzyQuery,String age,String age1);

	void addUser(User u);

	User idByUser(Integer id);

	void updateUser(User u);

	void deleteUser(String id);

	List<Role> findByRoleId();

	List<Department> findByDepartmentId();
	
	List<Notice> findByNoticeId();
	
	List<User> findByUserId();
	
	//角色
	List<Role> queryRole(HttpServletRequest request, Integer page,String u_name,String fuzzyQuery);

	Role updateRole(String id);

	void deleteRole(String id);

	void saveRole(Integer id, Role role);

	void addRole(Role role);


	
	
	
	//部门
	List<Department> queryDepartment(HttpServletRequest request, Integer page, String u_name,String fuzzyQuery);

	Department updateDepartment(String department_id);

	void deleteDepartment(String department_id);

	void saveDepartment(String id, Department department);

	void addDepartment(Department department);
	
	
	//公告
	List<Notice> queryNotice(HttpServletRequest request, Integer page, String u_name,String fuzzyQuery);

	Notice updateNotice(String notice_id);

	void deleteNotice(String notice_id);

	void addNotice(Notice notice);

	void saveNotice(String notice_id, Notice notice);

	//发送邮件 保存
	Boolean addMessage(String addMessage,Message message);
	//根据不同的用户查询不同的邮件
	List<Message> queryMessage(HttpServletRequest request, String addMessage, Integer user_id,Integer page);
	//查询草稿箱信息
	List<Message> queryDrafts(HttpServletRequest request, Boolean addMessage,Integer user_id,Integer  page);

	Message updateMessage(String id);

	void addMessage1(String addMessage, Message message);

	void deleteMessage(String addMessage,String message_id,Integer receive_id);

	List<Message> selectMessage(Integer id);

	void delete(String message_id, Integer integer, Integer receiver);

	void restoreMessage(String message_id,Integer user_id);
	
	

	

}
