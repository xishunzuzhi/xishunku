package cn.ych.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.JsonArray;

import cn.ych.pojo.Customer;
import cn.ych.pojo.Customer_category;
import cn.ych.pojo.Customer_source;
import cn.ych.pojo.Customer_state;
import cn.ych.pojo.User;
import cn.ych.service.CustomerService;
import cn.ych.service.UserService;
import cn.ych.service.impl.CustomerServiceImpl;
import cn.ych.service.impl.UserServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class customerController
 */
@WebServlet("/customerController")
public class CustomerController extends HttpServlet {
	private CustomerService customerService = new CustomerServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String service = request.getParameter("service");
				String customer = request.getParameter("customer");
				if(service.equals("showCustomer")) {
					show(request,response,customer);
				}
				if(service.equals("addCustomer")) {
					add(request,response,customer);
				}
				if(service.equals("updateCustomer")) {
					update(request,response,customer);
				}
				if(service.equals("saveCustomer")) {
					save(request,response,customer);
				}
				if(service.equals("deleteCustomer")) {
					delete(request,response,customer);
				}
				if(service.equals("findByCustomer_stateId")) {
					findByCustomer_stateId(request,response);
				}
				if(service.equals("findByCustomer_categoryId")) {
					findByCustomer_categoryId(request,response);
				}
				if(service.equals("findByCustomer_sourceId")) {
					findByCustomer_sourceId(request,response);
				}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private void show(HttpServletRequest request, HttpServletResponse response,String customer) throws ServletException, IOException {
		Integer page = request.getParameter("page")==null?1:Integer.valueOf(request.getParameter("page"));

		if(customer!=null) {
			//客户分类表
			List<Customer_category> list = customerService.showCategory(request,page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("WEB-INF/customer/categorylist.jsp").forward(request, response);
		}else {
			//客户表
			UserService userService = new UserServiceImpl();
			List<Customer> list = customerService.show(request,page);
			request.setAttribute("list", list);
			List<User> user = userService.findByUserId();
			request.setAttribute("user", user);
			List<Customer_source> source = customerService.findByCustomer_sourceId();
			request.setAttribute("source", source);
			List<Customer_state> states = customerService.findByCustomer_stateId();
			request.setAttribute("state", states);
			List<Customer_category> category = customerService.findByCustomer_categoryId();
			request.setAttribute("category", category);
			request.getRequestDispatcher("WEB-INF/customer/customerlist.jsp").forward(request, response);
		}
		
		
	}
	private void add(HttpServletRequest request, HttpServletResponse response,String customer) throws ServletException, IOException {
	
		if(customer!=null) {
			request.getRequestDispatcher("WEB-INF/customer/categoryadd.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("WEB-INF/customer/customeradd.jsp").forward(request, response);
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response,String customer) throws ServletException, IOException {
		String customer_id = request.getParameter("customer_id");
		if(customer != null) {
			//客户分类
			Customer_category category = customerService.updateCategory(customer_id);
			request.setAttribute("category", category);
			request.getRequestDispatcher("WEB-INF/customer/categoryadd.jsp").forward(request, response);		
		}else {
			Customer customer1 = customerService.update(customer_id);
			request.setAttribute("customer", customer1);
			request.getRequestDispatcher("WEB-INF/customer/customeradd.jsp").forward(request, response);
		}
	}
	private void delete(HttpServletRequest request, HttpServletResponse response,String customer) throws ServletException, IOException {
		String customer_id = request.getParameter("customer_id");
		if(customer!=null) {
			//客户分类
			customerService.deleteCategory(customer_id);
			request.getRequestDispatcher("customerController?service=showCustomer&customer").forward(request, response);
		}else {
			customerService.delete(customer_id);
			request.getRequestDispatcher("customerController?service=showCustomer").forward(request, response);
		}
	}
	
	private void save(HttpServletRequest request, HttpServletResponse response,String customer1) throws ServletException, IOException {
		if(customer1!=null) {
			//客户分类
			String customer_category_id = request.getParameter("customer_category_id");
			String customer_category_name =request.getParameter("customer_category_name");
			String customer_category_desc =request.getParameter("customer_category_desc");
			Integer status = Integer.valueOf(request.getParameter("status")) ;
			Integer creater = Integer.valueOf(request.getParameter("creater"));
			Integer updater = Integer.valueOf(request.getParameter("updater"));
			String remark =request.getParameter("remark");
			Customer_category customer_category = new Customer_category(customer_category_name,customer_category_desc,status,creater,updater,remark);
			if(customer_category_id!=null) {
				customerService.saveCategory(Integer.valueOf(customer_category_id),customer_category);
			}else {
				customerService.addCategory(customer_category);
			}
			
			request.getRequestDispatcher("customerController?service=showCustomer&customer").forward(request, response);

		}else {
			SimpleDateFormat simpleDateFormat  = new SimpleDateFormat("yyyy-MM-DD");
			String customer_id =request.getParameter("customer_id");
			
			String[] strings = request.getParameterValues("customer");
			Date expire_time = null ;
			try {
				expire_time=simpleDateFormat.parse(strings[14]);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Customer customer = new Customer(Integer.valueOf(strings[0]),Integer.valueOf(strings[1]),Integer.valueOf(strings[2]),Integer.valueOf(strings[3]),strings[4],
					Boolean.valueOf(strings[5]),strings[6],strings[7],strings[8],strings[9],strings[10],strings[11],strings[12],strings[13],expire_time,strings[15],Integer.valueOf(strings[16]),
					Integer.valueOf(strings[17]),Integer.valueOf(strings[18]),strings[19]);
			if(customer_id!=null) {
				//修改客户信息
			
				customerService.save(Integer.valueOf(customer_id),customer);
			}else {
				//添加客户信息
				customerService.add(customer);
			}
		
			request.getRequestDispatcher("customerController?service=showCustomer").forward(request, response);
		}
	}
	
	//异步查询客户来源id
	private void findByCustomer_sourceId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Customer_source> list = customerService.findByCustomer_sourceId();
		JsonConfig jsonConfig = new JsonConfig();
		//去除字段
		jsonConfig.setExcludes(new String[] {"customer_source_desc","status","remark","create_time","creater","update_time","updater"} );
		JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
		response.getWriter().println(jsonArray.toString());
	}
	private void findByCustomer_categoryId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Customer_category> list = customerService.findByCustomer_categoryId();
		JsonConfig jsonConfig = new JsonConfig();
		//去除字段
		jsonConfig.setExcludes(new String[] {"customer_category_desc","status","remark","create_time","creater","update_time","updater"} );
		JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
		response.getWriter().println(jsonArray.toString());
	}
	private void findByCustomer_stateId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Customer_state> list = customerService.findByCustomer_stateId();
		JsonConfig jsonConfig = new JsonConfig();
		//去除字段
		jsonConfig.setExcludes(new String[] {"customer_state_desc","status","remark","create_time","creater","update_time","updater"} );
		JSONArray jsonArray = JSONArray.fromObject(list, jsonConfig);
		response.getWriter().println(jsonArray.toString());
		

	}

}
