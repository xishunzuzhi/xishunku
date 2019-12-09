package cn.ych.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ych.pojo.Customer_source;
import cn.ych.pojo.Customer_state;
import cn.ych.pojo.Department;
import cn.ych.pojo.Notice;
import cn.ych.pojo.Role;
import cn.ych.pojo.User;
import cn.ych.service.CustomerService;
import cn.ych.service.UserService;
import cn.ych.service.impl.CustomerServiceImpl;
import cn.ych.service.impl.UserServiceImpl;

/**
 * Servlet implementation class InteriorMessageController
 */
@WebServlet({"/InteriorMessageController","/verify"})
public class InteriorMessageController extends HttpServlet {
	private CustomerService customerService = new CustomerServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String service = request.getParameter("service");
		
		if(service.equals("show")) {
			InteriorShow(request,response);
		}
		if(service.equals("showRole")) {
			showRole(request,response);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void InteriorShow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String department = request.getParameter("department");
		if(department!=null) {
			User department_id = (User) request.getSession().getAttribute("u");
			Integer page = request.getParameter("page")==null?1:Integer.valueOf(request.getParameter("page"));
			List<Department> list = customerService.showInteriorDepartment(request,page,department_id.getDepartment_id());
			request.setAttribute("list", list);
			request.getRequestDispatcher("WEB-INF/interior/departmentlist.jsp").forward(request, response);
		}else {
			
			User department_id = (User) request.getSession().getAttribute("u");
			Integer page = request.getParameter("page")==null?1:Integer.valueOf(request.getParameter("page"));
			List<Notice> list = customerService.showInteriorNotice(request,page,department_id.getDepartment_id());
			request.setAttribute("list", list);
			request.getRequestDispatcher("WEB-INF/interior/noticelist.jsp").forward(request, response);
		}
	}
	private void showRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserServiceImpl();	
		
		String user = request.getParameter("user");
			if(user!=null) {
				
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
							request.getRequestDispatcher("WEB-INF/interior/userlist.jsp").forward(request, response);
							return;
						}else {
							//模糊查询数据不存在
							List<User> list1 = userService.queryUser(request, page ,"","username","0","200");
							request.setAttribute("list", list1);
							request.setAttribute("msg", "输入有误，条件查询不存在");
							request.getRequestDispatcher("WEB-INF/interior/userlist.jsp").forward(request, response);
							return;
						}
			}else {
				Integer page = request.getParameter("page")==null?1:Integer.valueOf(request.getParameter("page"));
				String u_name =  request.getParameter("u_name")==null?"": request.getParameter("u_name");
				String fuzzyQuery = request.getParameter("fuzzyQuery")==null?"role_name":request.getParameter("fuzzyQuery");
				List<Role> list = userService.queryRole(request,page,u_name,fuzzyQuery);
				
				//判断条件查询输入是否有信息
				if(list.size()!=0) {
					request.setAttribute("list", list);
					request.getRequestDispatcher("WEB-INF/interior/rolelist.jsp").forward(request, response);
				}else {
					List<Role> list1 = userService.queryRole(request,page,"","role_name");
					request.setAttribute("list", list1);
					request.setAttribute("msg", "输入有误，条件查询不存在");
					request.getRequestDispatcher("WEB-INF/interior/rolelist.jsp").forward(request, response);
			}
		}	
	}
	
}
