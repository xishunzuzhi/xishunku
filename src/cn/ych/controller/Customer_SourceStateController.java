package cn.ych.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ych.pojo.Customer_category;
import cn.ych.pojo.Customer_source;
import cn.ych.pojo.Customer_state;
import cn.ych.service.CustomerService;
import cn.ych.service.impl.CustomerServiceImpl;

/**
 * Servlet implementation class Customer_SourceStateController
 */
@WebServlet("/SourceStateController")
public class Customer_SourceStateController extends HttpServlet {
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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	private void show(HttpServletRequest request, HttpServletResponse response, String customer) throws ServletException, IOException {
		Integer page = request.getParameter("page")==null?1:Integer.valueOf(request.getParameter("page"));

		if(customer!=null) {
			//客户来源
			List<Customer_source> list = customerService.showSource(request,page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("WEB-INF/customer/sourcelist.jsp").forward(request, response);
		}else {
			//客户状态
			List<Customer_state> list = customerService.showState(request,page);
			request.setAttribute("list", list);
			request.getRequestDispatcher("WEB-INF/customer/statelist.jsp").forward(request, response);
			
		}
		
	}
	private void add(HttpServletRequest request, HttpServletResponse response, String customer) throws ServletException, IOException {
		if(customer!=null) {
			
			request.getRequestDispatcher("WEB-INF/customer/sourceadd.jsp").forward(request, response);
		}else {
			System.out.println(";gl");
			request.getRequestDispatcher("WEB-INF/customer/stateadd.jsp").forward(request, response);
			
			
		}
		
	}
	private void update(HttpServletRequest request, HttpServletResponse response, String customer) throws ServletException, IOException {
		String customer_id = request.getParameter("customer_id");
		if(customer!=null) {
			Customer_source source =customerService.updateSource(customer_id);
			request.setAttribute("source", source);
			request.getRequestDispatcher("WEB-INF/customer/sourceadd.jsp").forward(request, response);
		}else {
			Customer_state state =customerService.updateState(customer_id);
			request.setAttribute("state", state);
			request.getRequestDispatcher("WEB-INF/customer/stateadd.jsp").forward(request, response);
		}
		
	}
	private void save(HttpServletRequest request, HttpServletResponse response, String customer) {
		
	
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response, String customer) throws ServletException, IOException {
		String customer_id = request.getParameter("customer_id");
		if(customer!=null) {
			//客户来源
			customerService.deleteSource(customer_id);
			request.getRequestDispatcher("SourceStateController?service=showCustomer&customer").forward(request, response);
		}else {
			//客户状态
			customerService.deleteState(customer_id);
			request.getRequestDispatcher("SourceStateController?service=showCustomer").forward(request, response);
			
		}
		
	}




}
