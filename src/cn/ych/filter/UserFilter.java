package cn.ych.filter;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ych.pojo.User;

/**
 * Servlet Filter implementation class UserFilter
 */
@WebFilter("/UserFilter")
public class UserFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		User user = (User) req.getSession().getAttribute("u");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String[] urls = {"/ApartmentProject/LoginController",".js",".css",".png","/json",".ico",".jpg"};
		  
		Boolean boolean1 = false;
	
		if(Arrays.asList(urls).contains(req.getRequestURI())) { 
			  chain.doFilter(req,resp); 
			  boolean1 = true;
			  return; 
			}
		 if(boolean1) {
			  if(user==null) { 
				req.setAttribute("msg", "你未登入，不能访问");
			  req.getRequestDispatcher("login.jsp").forward(req, resp);
			  }
			  else {
				  chain.doFilter(req, resp);
			  }
		 }else {
			 chain.doFilter(req, resp);
		 }
		}
	


	public void init(FilterConfig fConfig) throws ServletException {
	}

}
