package cn.ych.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.ych.pojo.User;
import cn.ych.service.UserService;
import cn.ych.service.impl.UserServiceImpl;

/**
 * Servlet implementation class LoginController
 */
@WebServlet( {"/LoginController","/quit"})
public class LoginController extends HttpServlet {
       
	private static UserService userService = new UserServiceImpl();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
			if(username==null) {
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}
			User user = userService.queryByName(request, username, password);
			if(user!=null) {
				if (user.getIs_admin()) {
					request.getRequestDispatcher("WEB-INF/view/show.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("WEB-INF/view/show1.jsp").forward(request, response);
				}
			
			}else {
				request.getRequestDispatcher("login.jsp").forward(request, response);

			}
	
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
