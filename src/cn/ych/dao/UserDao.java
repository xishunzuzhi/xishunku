package cn.ych.dao;

import java.util.List;

import cn.ych.pojo.Department;
import cn.ych.pojo.Message;
import cn.ych.pojo.Notice;
import cn.ych.pojo.Role;
import cn.ych.pojo.User;

public interface UserDao {
	
	User queryByName(String username);

	int totalUser();

	List<User> userAll(int page, int number,String u_name,String fuzzyQuery,String age,String age1);

	void addUser(User u);

	User idByUser(Integer id);

	void updateUser(User u);

	void deleteUser(String id);

	List<Role> findByRoleId();
	
	List<Notice> findByNoticeId();

	List<Department> findByDepartmentId();
	
	int queryRole();

	
	//角色
	List<Role> queryRole(int page, int number,String u_name,String fuzzyQuery);

	Role updateRole(String id);

	void deleteRole(String id);

	void saveRole(Integer id, Role role);

	void addRole(Role role);
	
	int queryCount();

	
	//部门
	List<Department> queryDepartment(int page, int number, String u_name,String fuzzyQuery);

	Department updateDepartment(String department_id);

	void deleteDepartment(String department_id);

	void saveDepartment(String id, Department department);

	void addDepartment(Department department);

	
	//公告
	int queryNotice();

	List<Notice> queryNotice(int page, int number, String u_name,String fuzzyQuery);

	Notice updateNotice(String notice_id);

	void deleteNotice(String notice_id);

	void addNotice(Notice notice);

	void saveNotice(String notice_id,Notice notice);

	//发送保存邮件
	Boolean addMessage(String addMessage,Message message);
	//根据不同的用户查询不同的邮件
	List<Message> queryMessage(String id, Integer addMessage, int begin, int number);
	//统计收件箱条数
	Integer queryInboxCount(Integer user_id);
	//异步查询所有用户回显发送人的名字
	List<User> findByUserId();

	//查询草稿箱信息
	List<Message> queryDrafts(Boolean addMessage,Integer user_id, int begin, int number);

	Message updateMessage(String id);

	void addMessage1(String addMessage, Message message);

	void deleteMessage(String addMessage,String message_id,Integer receive_id);

	List<Message> selectMessage(Integer id);

	void delete(String message_id, Integer user_id,Integer receiver);

	void restoreMessage(String message_id,Integer user_id);

	int queryMessageCount(Boolean addMessage, Integer user_id);

	



	

	
}
