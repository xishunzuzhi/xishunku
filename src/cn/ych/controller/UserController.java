package cn.ych.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.ych.pojo.Department;
import cn.ych.pojo.Notice;
import cn.ych.pojo.Role;
import cn.ych.pojo.User;
import cn.ych.service.UserService;
import cn.ych.service.impl.UserServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class UserController
 */
@WebServlet({ "/UserController", "/addUser", "/save" })
public class UserController extends HttpServlet {

	private static UserService userService = new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String service = request.getParameter("service");

		if (service.equals("show")) {
			show(request, response);
		}
		if (service.equals("addUser")) {
			addUser(request, response);
		}
		if (service.equals("save")) {
			saveUser(request, response);
		}
		if (service.equals("update")) {
			updateUser(request, response);
		}
		if (service.equals("delete")) {
			deleteUser(request, response);
		}
		if (service.equals("findByRoleId")) {
			findByRoleId(request, response);
		}
		if (service.equals("findByDepartmentId")) {
			findByDepartmentId(request, response);
		}
		if (service.equals("findByNoticeId")) {
			findByNoticeId(request, response);
		}
		if (service.equals("findByUserId")) {
			findByUserId(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

	private static void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer page = request.getParameter("page") == null ? 1 : Integer.valueOf(request.getParameter("page"));

		String u_name = request.getParameter("u_name") == null ? "" : request.getParameter("u_name");
		
		String fuzzyQuery = request.getParameter("fuzzyQuery")== null?"username":request.getParameter("fuzzyQuery");
		String age = request.getParameter("age")==null||request.getParameter("age")==""?"0":request.getParameter("age");
		String age1 = request.getParameter("age1")==null||request.getParameter("age")==""?"200":request.getParameter("age1");
		
		List<User> list = userService.queryUser(request, page, u_name,fuzzyQuery,age,age1);
				if(list.size()!=0) {
					List<Role> roles = userService.findByRoleId();
					request.setAttribute("roles", roles);
					List<Department> department = userService.findByDepartmentId();
					request.setAttribute("department", department);
					request.setAttribute("list", list);
					request.getRequestDispatcher("WEB-INF/view/list.jsp").forward(request, response);
					return;
				}else {
					//模糊查询数据不存在
					List<User> list1 = userService.queryUser(request, page ,"","username","0","200");
					request.setAttribute("list", list1);
					System.out.println(list1);
					request.setAttribute("msg", "输入有误，条件查询不存在");
					request.getRequestDispatcher("WEB-INF/view/list.jsp").forward(request, response);
					return;
				}
		}
	private static void addUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("WEB-INF/view/adminadd.jsp").forward(request, response);

	}

	private static void saveUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("u");
		String id = request.getParameter("user_id");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password")==""?user.getPassword():request.getParameter("password");
		Boolean is_admin = Boolean.valueOf(request.getParameter("is_admin"));
		Boolean is_system = Boolean.valueOf(request.getParameter("is_system"));
		Boolean is_male = Boolean.valueOf(request.getParameter("is_male"));
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		Integer age = request.getParameter("age")==""?0:Integer.valueOf(request.getParameter("age"));
		String tel = request.getParameter("tel");
		String id_num = request.getParameter("id_num");
		String email = request.getParameter("email");
		String hobby = request.getParameter("hobby");
		Integer education = Integer.valueOf(request.getParameter("education"));
		String card_num = request.getParameter("card_num");
		String nation = request.getParameter("nation");
		Integer marry = Integer.valueOf(request.getParameter("marry"));
		
		String remark = request.getParameter("remark");
		//管理员添加修改
		if(user.getIs_admin()) {
			
			Integer department_id = Integer.valueOf(request.getParameter("department_id"));
			Integer role_id = Integer.valueOf(request.getParameter("role_id"));
			Integer status = Integer.valueOf(request.getParameter("status"));
			if (id != null && id != "") {
				User u = new User(Integer.valueOf(id), department_id, role_id, username, is_male, mobile, age, address,
					is_admin, is_system, password, tel, id_num, email, hobby, education, card_num, nation, marry,
					status, remark,user.getUser_id(),user.getUser_id());
				userService.updateUser(u);
			} else {
				User u = new User(department_id, role_id, username, is_male, mobile, age,
				  	address, is_admin, is_system, password, tel, id_num, email, hobby, education,
				  	card_num, nation, marry, status, remark, user.getUser_id(),
				  	user.getUser_id()); 
				userService.addUser(u);
			}
			request.getRequestDispatcher("UserController?service=show&age=0").forward(request, response);
			
		}else {
			//用户修改
			User u = new User(Integer.valueOf(id), user.getDepartment_id(),user.getRole_id(), username,is_male, mobile, age, address,
					user.getIs_admin(),user.getIs_system(), password, tel, id_num, email, hobby, education, card_num, nation, marry,
					user.getStatus(), remark, user.getCreater(), user.getUpdater());
			
			userService.updateUser(u);
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
		}
		
	}

	private static void updateUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		User is_admin = (User) request.getSession().getAttribute("u");
		if(is_admin.getIs_admin()) {
			Integer id = Integer.valueOf(request.getParameter("id")) ;
			User user = userService.idByUser(id);

			request.setAttribute("user", user);
			request.getRequestDispatcher("WEB-INF/view/adminadd.jsp").forward(request, response);
		}else {
			Integer id = Integer.valueOf(request.getParameter("id")) ;
			User user = userService.idByUser(id);
			request.setAttribute("user", user);
			request.getRequestDispatcher("WEB-INF/view/useradd.jsp").forward(request, response);
		}
		
	}

	private static void deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		userService.deleteUser(id);

		request.getRequestDispatcher("UserController?service=show").forward(request, response);
	}

	private static void findByRoleId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Role> list = userService.findByRoleId();

		// 创建jsonConfig对象
		JsonConfig jsonConfig = new JsonConfig();
		// 去除不必要的数据字段
		jsonConfig.setExcludes(new String[] { "role_permission", "status", "remark", "create_time",
				"creater", "update_time", "updater" });
		// list转换json
		JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);

		// 将josn打印到桌面 //jsonArray.toString()转换字符串
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println(jsonArray.toString());

	}

	private static void findByDepartmentId(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Department> list = userService.findByDepartmentId();

		// 创建jsonConfig对象
		JsonConfig jsonConfig = new JsonConfig();
		// 去除不必要的数据字段
		jsonConfig.setExcludes(new String[] { "department_desc", "status", "remark", "create_time", "creater",
				"update_time", "updater" });
		// list转换json
		JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);

		// 将josn打印到桌面 //jsonArray.toString()转换字符串
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println(jsonArray.toString());

	}

	private static void findByNoticeId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Notice> list = userService.findByNoticeId();
		// 创建jsonConfig对象
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String [] {"notice_id","subject","text","pub_time","expire_time","status","remark","create_time","creater","update_time","updater",});
	
		JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
		response.getWriter().println(jsonArray.toString());
		
	}
	private static void findByUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<User> list = userService.findByUserId();
		// 创建jsonConfig对象
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String [] {"department_id","role_id","is_male","age","address","is_admin","is_system","tel",
		"email","hobby","education","card_num","nation","marry","status","remark","create_time","creater","update_time","updater"});
			
		JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
		response.getWriter().println(jsonArray.toString());
		
	}
}
