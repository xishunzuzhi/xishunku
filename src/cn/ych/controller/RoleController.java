package cn.ych.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ych.pojo.Department;
import cn.ych.pojo.Role;
import cn.ych.pojo.User;
import cn.ych.service.UserService;
import cn.ych.service.impl.UserServiceImpl;

/**
 * Servlet implementation class RoleController
 */
@WebServlet("/RoleController")
public class RoleController extends HttpServlet {
       private static UserService userService = new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String service = request.getParameter("service");
		
		String  department_id = request.getParameter("department_id");

		if(service.equals("show")) {
			
			show(request, response,department_id);
		}
		if(service.equals("addUser")) {
			addRole(request, response,department_id);
		}
		if(service.equals("save")) {
			saveRole(request, response);
		}
		if(service.equals("update")) {
			updateRole(request, response,department_id);
		}
		if(service.equals("delete")) {
			deleteRole(request, response,department_id);
		}
		if(service.equals("department_save")) {
			saveDepartment(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
private static void show(HttpServletRequest request, HttpServletResponse response,String department_id) throws ServletException, IOException  {
	
	if(department_id!=null) {
		//查询所有部门  部门管理
		Integer page = request.getParameter("page")==null?1:Integer.valueOf(request.getParameter("page"));
		String u_name =  request.getParameter("u_name")==null?"": request.getParameter("u_name");
		String fuzzyQuery = request.getParameter("fuzzyQuery")==null?"department_name":request.getParameter("fuzzyQuery");
		List<Department> list = userService.queryDepartment(request,page,u_name,fuzzyQuery);
		if(list.size()!=0) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("WEB-INF/department/list.jsp").forward(request, response);
			return;
		}else {
			List<Department> list1 = userService.queryDepartment(request,page,"","department_name");
			request.setAttribute("list",list1);
			request.setAttribute("msg", "输入有误，条件查询不存在");
			request.getRequestDispatcher("WEB-INF/department/list.jsp").forward(request, response);
			return;
		}
	}
		Integer page = request.getParameter("page")==null?1:Integer.valueOf(request.getParameter("page"));
		String u_name =  request.getParameter("u_name")==null?"": request.getParameter("u_name");
		String fuzzyQuery = request.getParameter("fuzzyQuery")==null?"role_name":request.getParameter("fuzzyQuery");
		List<Role> list = userService.queryRole(request,page,u_name,fuzzyQuery);
		
		//判断条件查询输入是否有信息
		if(list.size()!=0) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("WEB-INF/role/list.jsp").forward(request, response);
		}else {
			List<Role> list1 = userService.queryRole(request,page,"","role_name");
			request.setAttribute("list", list1);
			request.setAttribute("msg", "输入有误，条件查询不存在");
			request.getRequestDispatcher("WEB-INF/role/list.jsp").forward(request, response);
		}
	}
	private static void addRole(HttpServletRequest request, HttpServletResponse response,String  department_id) throws ServletException, IOException  {
		
		if(department_id!=null) {
			//部门添加页面
			request.getRequestDispatcher("WEB-INF/department/add.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("WEB-INF/role/add.jsp").forward(request, response);
	}
	private static void saveRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
	
		
		User user = (User) request.getSession().getAttribute("u");
		String id = request.getParameter("role_id");
		String role_name = request.getParameter("role_name");
		Integer role_permission = Integer.valueOf(request.getParameter("role_permission"));
		Integer status = Integer.valueOf(request.getParameter("status"));
		
		String remark = request.getParameter("remark");
		
		Role role = new Role(role_name,role_permission,status,user.getUser_id(),user.getUser_id(),remark);
		if(id!=null) {
			userService.saveRole(Integer.valueOf(id), role);
		}else {
		
			userService.addRole(role);
		}
		request.getRequestDispatcher("RoleController?service=show").forward(request, response);
	}
	private static void updateRole(HttpServletRequest request, HttpServletResponse response,String  department_id) throws ServletException, IOException  {
		
		if(department_id != null) {
			//部门修改
			Department department = userService.updateDepartment(department_id);
			request.setAttribute("department", department);
			request.getRequestDispatcher("WEB-INF/department/add.jsp").forward(request, response);
		return;
		}
			String id = request.getParameter("id");
			Role role = userService.updateRole(id);
			request.setAttribute("role", role);
			request.getRequestDispatcher("WEB-INF/role/add.jsp").forward(request, response);
		
	}
	private static void deleteRole(HttpServletRequest request, HttpServletResponse response,String  department_id) throws ServletException, IOException  {
	
		if(department_id != null) {
			//部门删除
			System.out.println(department_id);
			userService.deleteDepartment(department_id);
			request.getRequestDispatcher("RoleController?service=show&department_id").forward(request, response);
			return;
		}
			String id = request.getParameter("id");
			userService.deleteRole(id);
			request.getRequestDispatcher("RoleController?service=show").forward(request, response);
	}
	private static void saveDepartment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String id = request.getParameter("department_id");
		
		User user = (User) request.getSession().getAttribute("u");
		String department_name = request.getParameter("department_name");
		String department_desc = request.getParameter("department_desc");
		Integer status = Integer.valueOf(request.getParameter("status"));
		String remark = request.getParameter("remark");
		
		Department department = new Department(department_name,department_desc,status,user.getUser_id(),user.getUser_id(),remark);
		
		if(id!=null) {
			
			userService.saveDepartment(id,department);
			
		}else {
			userService.addDepartment(department);
		}
		request.getRequestDispatcher("RoleController?service=show&department_id").forward(request, response);
	}
}
