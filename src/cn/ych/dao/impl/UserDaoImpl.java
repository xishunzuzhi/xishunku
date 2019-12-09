package cn.ych.dao.impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


import cn.ych.dao.UserDao;
import cn.ych.pojo.Department;
import cn.ych.pojo.Message;
import cn.ych.pojo.Notice;
import cn.ych.pojo.Role;
import cn.ych.pojo.User;
import cn.ych.util.JDBCUtil;

public class UserDaoImpl implements UserDao{
	@Override
	public User queryByName(String username) {		
		String sql = "select * from user where username=?";
		List<User> list = JDBCUtil.dbDQL(sql, User.class, username);
		
		if(list.size()!=0) {
			return list.get(0);
		}
		
		return null;
	}

	@Override
	public int totalUser() {
		Connection connection = JDBCUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int sum = 0;
		String sql = "select count(*) from user where STATUS != -2";
		
		try {
			ps = connection.prepareStatement(sql);
			 rs = ps.executeQuery();
			 if(rs.next()) {
				 sum = rs.getInt(1);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}
	@Override
	public List<User> userAll(int page, int been,String u_name,String fuzzyQuery,String age,String age1) {
		
	
		
		String sql = "SELECT * FROM USER WHERE  STATUS != -2 and  age BETWEEN "+age+" AND "+age1+" and "+fuzzyQuery+" LIKE '%"+u_name+"%' LIMIT "+page+","+been;
	
	return JDBCUtil.dbDQL(sql, User.class);
	}
	@Override
	public void addUser(User u) {
		// TODO Auto-generated method stub
		String sql = "insert into user values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,null,?,CURRENT_TIMESTAMP,null)";
		/*department_id
		 * role_id username is_male mobile age address
		 * is_admin is_system password tel id_num email
		 * hobby  education card_num nation marry status
		 * remark creater updater
		 */
		JDBCUtil.dbDML(sql, u.getDepartment_id(),u.getRole_id(),u.getUsername(),u.getIs_male(),u.getMobile(),u.getAge(),u.getAddress(),
							u.getIs_admin(),u.getIs_system(),u.getPassword(),u.getTel(),u.getId_num(),u.getEmail(),
							u.getHobby(),u.getEducation(),u.getCard_num(),u.getNation(),u.getMarry(),u.getStatus(),
							u.getRemark(),u.getCreater());
		
	}
	@Override
	public User idByUser(Integer id) {		
		String sql = "select * from user where user_id=?";
		return JDBCUtil.dbDQL(sql, User.class, id).get(0);
	}
	@Override
	public void updateUser(User u) {
		// TODO Auto-generated method stub
		/*department_id
		 * role_id username is_male mobile age address
		 * is_admin is_system password tel id_num email
		 * hobby  education card_num nation marry status
		 * remark creater updater
		 */
		String sql ="update user set department_id=?,role_id=?,username=?,is_male=?,mobile=?"
				+ ",age=?,address=?,is_admin=?,is_system=?,password=?,tel=?,id_num=?,email=?,hobby=?,education=?,card_num=?,nation=?"
				
				+ ",marry=?,status=?,remark=?,update_time=CURRENT_TIMESTAMP,updater=? where user_id=?";
		
		JDBCUtil.dbDML(sql, u.getDepartment_id(),u.getRole_id(),u.getUsername(),u.getIs_male(),u.getMobile(),u.getAge(),u.getAddress(),
							u.getIs_admin(),u.getIs_system(),u.getPassword(),u.getTel(),u.getId_num(),u.getEmail(),
							u.getHobby(),u.getEducation(),u.getCard_num(),u.getNation(),u.getMarry(),u.getStatus(),
							u.getRemark(),u.getUpdater(),u.getUser_id());
	}
	@Override
	public void deleteUser(String id) {
		String sql = "UPDATE user SET STATUS=-2 WHERE  user_id=?";
		
		JDBCUtil.dbDML(sql, id);
	}
	@Override //异步查询角色
	public List<Role> findByRoleId() {
		// TODO Auto-generated method stub
		String sql = "select * from role where status != -2";
	
		return 	JDBCUtil.dbDQL(sql, Role.class);
	}

	@Override
	public int queryRole() {
		// TODO Auto-generated method stub
				Connection connection = JDBCUtil.getConnection();
				PreparedStatement ps = null;
				ResultSet rs = null;
				int sum = 0;
				String sql = "select count(*) from role where status != -2";
				
				try {
					ps = connection.prepareStatement(sql);
					 rs = ps.executeQuery();
					 if(rs.next()) {
						 sum = rs.getInt(1);
					 }
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return sum;
		
	}
	//角色
	@Override
	public List<Role> queryRole(int page, int been,String u_name,String fuzzyQuery) {
		String sql = "SELECT * FROM ROLE WHERE STATUS != -2 and "+fuzzyQuery+" LIKE '%"+u_name+"%' LIMIT "+page+","+been;
		return JDBCUtil.dbDQL(sql, Role.class);
	}
	@Override
	public Role updateRole(String id) {
		String sql = "select * from role where role_id=?";
		return JDBCUtil.dbDQL(sql, Role.class, id).get(0);
	}
	@Override
	public void deleteRole(String id) {
		String sql = "UPDATE role SET STATUS=-2 WHERE  role_id=?";
		JDBCUtil.dbDML(sql, id);
	}
		//修改角色
	@Override
	public void saveRole(Integer id, Role role) {
		System.out.println(1);
		String sql ="update role set role_name=?,role_permission=?,status=?,remark=?,update_time=CURRENT_TIMESTAMP,updater=? where role_id=?";
		JDBCUtil.dbDML(sql,role.getRole_name(),role.getRole_permission(),role.getStatus(),role.getRemark(),role.getUpdater(),id);
	}
	@Override
	public void addRole(Role role) {
		String sql = "insert into role values(null,?,?,?,?,CURRENT_TIMESTAMP,?,null,null)";
		JDBCUtil.dbDML(sql,role.getRole_name(),role.getRole_permission(),role.getStatus(),role.getRemark(),role.getCreater());
	}
	@Override
	public List<Department> findByDepartmentId() {
		String sql = "select * from Department where status != -2";
		return JDBCUtil.dbDQL(sql, Department.class);
	}
	//部门
	@Override
	public int queryCount() {
		Connection connection = JDBCUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int sum = 0;
		String sql = "select count(*) from department where status != -2";
		try {
			ps = connection.prepareStatement(sql);
			 rs = ps.executeQuery();
			 if(rs.next()) {
				 sum = rs.getInt(1);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}
	@Override
	public List<Department> queryDepartment(int page, int number, String u_name,String fuzzyQuery) {
		String sql = "SELECT * FROM department WHERE status != -2 AND "+fuzzyQuery+" LIKE '%"+u_name+"%' LIMIT "+page+","+number;
		return JDBCUtil.dbDQL(sql, Department.class);
	}

	@Override
	public Department updateDepartment(String department_id) {
		String sql = "select * from department where department_id=?";
		return JDBCUtil.dbDQL(sql, Department.class, department_id).get(0);
	}

	@Override
	public void deleteDepartment(String department_id) {
		String sql = "UPDATE department SET STATUS=-2 WHERE  department_id=?";
		JDBCUtil.dbDML(sql, department_id);
	}
	@Override
	public void saveDepartment(String id, Department department) {		
		System.out.println(department.getUpdater());
		String sql ="update department set department_name=?,department_desc=?,status=?,remark=?,update_time=CURRENT_TIMESTAMP,updater=? where department_id=?";
		JDBCUtil.dbDML(sql,department.getDepartment_name(),department.getDepartment_desc(),department.getStatus(),department.getRemark(),department.getUpdater(),id);
	}
	@Override
	public void addDepartment(Department department) {
		String sql = "insert into department values(null,?,?,?,?,CURRENT_TIMESTAMP,?,null,null)";
	
		JDBCUtil.dbDML(sql, department.getDepartment_name(),department.getDepartment_desc(),department.getStatus(),department.getRemark(),department.getCreater());
	
	}

	//公告
	@Override
	public int queryNotice() {
		Connection connection = JDBCUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int sum = 0;
		String sql = "select count(*) from notice where status != -2";
		
		try {
			ps = connection.prepareStatement(sql);
			 rs = ps.executeQuery();
			 if(rs.next()) {
				 sum = rs.getInt(1);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}

	@Override
	public List<Notice> queryNotice(int page, int number, String u_name,String fuzzyQuery) {
		String sql = "SELECT * FROM notice WHERE status != -2 AND "+fuzzyQuery+" LIKE '%"+u_name+"%' LIMIT "+page+","+number;
		return JDBCUtil.dbDQL(sql, Notice.class);
	}

	@Override
	public Notice updateNotice(String notice_id) {
		String sql = "select * from notice where notice_id=?";
		return JDBCUtil.dbDQL(sql, Notice.class, notice_id).get(0);
		
	
	}

	@Override
	public void deleteNotice(String notice_id) {
		String sql = "UPDATE notice SET STATUS=-2 WHERE  notice_id=?";
		JDBCUtil.dbDML(sql, notice_id);
	}

	@Override
	public List<Notice> findByNoticeId() {

		String sql = "select * from notice ";
		
		return JDBCUtil.dbDQL(sql, Notice.class);
	}

	@Override
	public void addNotice(Notice notice) {
		String sql = "insert into notice values(null,?,?,?,CURRENT_TIMESTAMP,?,?,?,CURRENT_TIMESTAMP,?,CURRENT_TIMESTAMP,?)";
		
		JDBCUtil.dbDML(sql, notice.getReceive_id(),notice.getSubject(),notice.getText(),notice.getExpire_time(),notice.getStatus(),notice.getRemark(),notice.getCreater(),notice.getUpdater());
		
	}

	@Override
	public void saveNotice(String notice_id,Notice notice) {
		
		String sql="UPDATE notice SET receive_id=?,SUBJECT=?,TEXT=?,expire_time=?,STATUS=?,remark=?,creater=?,update_time=CURRENT_TIMESTAMP,updater=? WHERE notice_id=?";
		JDBCUtil.dbDML(sql,notice.getReceive_id(),notice.getSubject(),notice.getText(),notice.getExpire_time(),notice.getStatus(),notice.getRemark(),notice.getCreater(),notice.getUpdater(),notice_id);
	}

	@Override //发送保存邮件
	public Boolean addMessage(String addMessage,Message message) {
		if(addMessage!=null){
			String sql = "insert into message (subject,sender,send_status,save_time,receiver,content) values(?,?,0,CURRENT_TIMESTAMP,?,?)";
			JDBCUtil.dbDML(sql, message.getSubject(),message.getSender(),message.getReceiver(),message.getContent());
			return true;
		}else{
			//发送邮件
			String sql = "insert into message (subject,sender,send_status,send_time,receiver,content,receive_status) values(?,?,2,CURRENT_TIMESTAMP,?,?,0)";
			JDBCUtil.dbDML(sql, message.getSubject(),message.getSender(),message.getReceiver(),message.getContent());
			return false;
		}
	}
	@Override //根据不同的用户查询不同的
	public List<Message> queryMessage(String id,Integer addMessage,int begin, int number) {
		String sql1 = "UPDATE Message SET receive_status=2,receive_update_time=CURRENT_TIMESTAMP WHERE message_id=?" ;
		
		JDBCUtil.dbDML(sql1,id);
		
		String sql = "select * from Message where receiver=? and send_status=2  limit "+begin+","+number;
		return JDBCUtil.dbDQL(sql, Message.class,addMessage);
		
	}
	@Override //统计收件箱数据的条数 分页
	public Integer queryInboxCount(Integer user_id) {
		Connection connection = JDBCUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;  
		int sum = 0;
		String sql = "select count(*) from Message where receiver="+user_id+" and receive_delete=2";
		
		try {
			ps = connection.prepareStatement(sql);
			 rs = ps.executeQuery();
			 if(rs.next()) {
				 sum = rs.getInt(1);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.close(connection, ps, rs);
		}
		return sum;
	}
	

	@Override //异步查询所有用户回显发送人的名字
	public List<User> findByUserId() {

		String  sql = "select * from user where status != -2";
		
		return JDBCUtil.dbDQL(sql, User.class);
	}

	@Override //查询草稿箱和发件箱的信息
	public List<Message> queryDrafts(Boolean addMessage,Integer user_id,int begin, int number) {
		if(addMessage){
			  String sql = "select * from Message where sender=? and send_status=0 limit "+begin+","+number;
			  return JDBCUtil.dbDQL(sql, Message.class,Integer.valueOf(user_id));
		}else {
			  String sql = "select * from Message where sender=? and send_status=2 limit "+begin+","+number ;
			  return JDBCUtil.dbDQL(sql, Message.class,Integer.valueOf(user_id) ); 
		}
	}

	@Override
	public Message updateMessage(String id) {
		
		String sql1 = "UPDATE Message SET send_update_time=CURRENT_TIMESTAMP WHERE message_id=?";
		
		JDBCUtil.dbDML(sql1,id);
		
		String sql = "select * from message where message_id=?";
		return JDBCUtil.dbDQL(sql, Message.class, id).get(0);
	}

	@Override
	public void addMessage1(String addMessage, Message message) {
		if(addMessage!=null) {
			
		String sql = "UPDATE Message SET subject=?,content=?,sender=?,send_status=2,save_time=CURRENT_TIMESTAMP,receiver=?,send_status=0 WHERE message_id=?";
		JDBCUtil.dbDML(sql, message.getSubject(),message.getContent(),message.getSender(),message.getReceiver(),message.getMessage_id());
		}else {
		//发件箱
		String sql = "UPDATE Message SET subject=?,content=?,sender=?,send_status=2,send_time=CURRENT_TIMESTAMP,send_update_time=CURRENT_TIMESTAMP,receiver=?,send_status=2,receive_status=0 WHERE message_id=?";
		JDBCUtil.dbDML(sql, message.getSubject(),message.getContent(),message.getSender(),message.getReceiver(),message.getMessage_id());
		}
	}
	@Override
	public void deleteMessage(String addMessage,String message_id,Integer receive_id) {
		Boolean boolean1 = Boolean.valueOf(addMessage);
		if(boolean1){
			//发件箱删除
			String sql = "update message set send_delete=0, sender=? where message_id=?";
			JDBCUtil.dbDML(sql, receive_id,message_id);
		}else{
			//收件箱删除
			String sql = "update message set receive_delete=0, receiver=? where message_id=?";
			JDBCUtil.dbDML(sql, receive_id,message_id);
		}	
	}
	@Override //查询垃圾箱
	public List<Message> selectMessage(Integer id) {
		String sql = "select * from Message where( receiver=? and receive_delete=0 ) or (sender=? and  send_delete=0 ) ";
		return JDBCUtil.dbDQL(sql, Message.class,id,id);
	

		}

	@Override //邮件垃圾箱删除
	public void delete(String message_id,Integer user_id,Integer receiver) {
		
		
		if(user_id.equals(Integer.valueOf(receiver))) {
			System.out.println("收件人删除");
			String sql = "update message set receive_delete=-2 where message_id=?";
			JDBCUtil.dbDML(sql, message_id);
		}else {
			System.out.println("发件人删除");
			String sql = "update message set send_delete=-2 where message_id=?";
			JDBCUtil.dbDML(sql, message_id);
		}
		
		
		//String sql = "update message set send_delete=-2,send_status=-1,sender=? where message_id=?";

		
		//String sql = "update  message set (sender=? and receive_delete=-2) or (receiver = ? and receiver_delete=-2) where message_id=?";
		//	JDBCUtil.dbDML(sql,user_id,user_id, message_id);
	}

	@Override //邮件垃圾箱还原
	public void restoreMessage(String message_id,Integer user_id) {
		String sql = "update message set send_status=0,send_delete=2 where  message_id=?";
		JDBCUtil.dbDML(sql, message_id);
	}

	@Override
	public int queryMessageCount(Boolean addMessage,Integer user_id) {
		if(addMessage) {
			//草稿箱总数
			Connection connection = JDBCUtil.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			int sum = 0;
			String sql = "select count(*) from Message where sender="+user_id+" and send_status=0 and send_delete=2";
			
			try {
				ps = connection.prepareStatement(sql);
				 rs = ps.executeQuery();
				 if(rs.next()) {
					 sum = rs.getInt(1);
				 }
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				JDBCUtil.close(connection, ps, rs);
			}
			return sum;
		}else {
			//发件箱总数
			Connection connection = JDBCUtil.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			int sum = 0;
			String sql = "select count(*) from Message where sender="+user_id+" and send_status=2  and send_delete = 2";
			try {
				ps = connection.prepareStatement(sql);
				 rs = ps.executeQuery();
				 if(rs.next()) {
					 sum = rs.getInt(1);
				 }
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				JDBCUtil.close(connection, ps, rs);
			}
			return sum;
		}
	}


}

	
