package cn.ych.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.naming.java.javaURLContextFactory;

import com.sun.org.apache.bcel.internal.generic.Select;

import cn.ych.pojo.Department;
import cn.ych.pojo.Message;
import cn.ych.pojo.Notice;
import cn.ych.pojo.User;
import cn.ych.service.UserService;
import cn.ych.service.impl.UserServiceImpl;

/**
 * Servlet implementation class NoticeController
 */
@WebServlet("/NoticeController")
public class NoticeController extends HttpServlet {
    private static UserService userService = new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String service = request.getParameter("service");
		String addMessage = request.getParameter("addMessage");
	
		if(service.equals("show")) {
			show(request, response,addMessage);
		}
		if(service.equals("addNotice")) {
			addNotice(request, response,addMessage);
		}
		if(service.equals("save")) {
			saveNotice(request, response);
		}
		if(service.equals("update")) {
			updateNotice(request, response);
		}
		if(service.equals("delete")) {
			deleteNotice(request, response,addMessage);
		}
		if(service.equals("showMessage")) {
			showMessage(request, response);
		}
		if(service.equals("queryDrafts")) {
			queryDrafts(request, response);
		}
		if(service.equals("updateMessage")) {
			updateMessage(request, response);
		}
		if(service.equals("dustbin")) {
			dustbinMessage(request, response);
		}
		if(service.equals("restoreMessage")) {
			restoreMessage(request, response);
		}
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	private void show(HttpServletRequest request, HttpServletResponse response,String addMessage) throws ServletException, IOException {
		
		Integer page = request.getParameter("page")==null?1:Integer.valueOf(request.getParameter("page"));

		User user_id =  (User) request.getSession().getAttribute("u");
		if(addMessage!=null) {
				//根据不同的用户查询不同的邮件
			
				List<Message> list = userService.queryMessage(request,addMessage,user_id.getUser_id(),page);
				if(list.size()!=0) {
					
					request.setAttribute("list", list);
					request.getRequestDispatcher("WEB-INF/message/list.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("WEB-INF/message/list1.jsp").forward(request, response);
				}			
			}else {
			//查询所有公告  部门管理
			String u_name =  request.getParameter("u_name")==null?"": request.getParameter("u_name");
			String fuzzyQuery = request.getParameter("fuzzyQuery")==null?"subject":request.getParameter("fuzzyQuery");
			List<Notice> list = userService.queryNotice(request,page,u_name,fuzzyQuery);
			
			if(list.size()!=0) {
				List<Department> department = userService.findByDepartmentId();
				request.setAttribute("department", department);
				request.setAttribute("list", list);
				request.getRequestDispatcher("WEB-INF/notice/list.jsp").forward(request, response);
				return;
			}else {
				List<Notice> list1 = userService.queryNotice(request,page,"","subject");
				request.setAttribute("list", list1);
				request.setAttribute("msg", "输入有误，条件查询不存在");
				request.getRequestDispatcher("WEB-INF/notice/list.jsp").forward(request, response);
				return;
			}
		}
	}
	private void addNotice(HttpServletRequest request, HttpServletResponse response,String addMessage) throws ServletException, IOException{
		if(addMessage != null) {
			request.getRequestDispatcher("WEB-INF/message/add.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("WEB-INF/notice/add.jsp").forward(request, response);
		}
		
	}
	private void saveNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			String notice_id = request.getParameter("notice_id");
			Integer receive_id = Integer.valueOf(request.getParameter("receive_id"));
			String subject = request.getParameter("subject");
			String text = request.getParameter("text");
			SimpleDateFormat simpleDateFormat  = new SimpleDateFormat("yyyy-MM-DD");
			Date expire_time = null ;
			try {
				 expire_time = simpleDateFormat.parse(request.getParameter("expire_time"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Integer status = Integer.valueOf(request.getParameter("status"));
			String remark = request.getParameter("remark");
			Integer creater = Integer.valueOf(request.getParameter("creater"));
			Integer updater = Integer.valueOf(request.getParameter("updater"));
			
			Notice notice = new Notice(receive_id,subject,text,expire_time,status,remark,creater,updater);
		
			if(notice_id!=null) {
				userService.saveNotice(notice_id,notice);
			}else {
				userService.addNotice(notice);
			}
				request.getRequestDispatcher("NoticeController?service=show").forward(request, response);
		}
		
	private void updateNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String id = request.getParameter("id"); 
		String receive_id = request.getParameter("receive_id");
		request.setAttribute("receive_id", receive_id);
		Notice notice = userService.updateNotice(id);
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("WEB-INF/notice/add.jsp").forward(request, response);
	}
	private void deleteNotice(HttpServletRequest request, HttpServletResponse response,String addMessage) throws ServletException, IOException{
		User user_id = (User) request.getSession().getAttribute("u");
		if(addMessage!=null) {
			String message_id=request.getParameter("message_id");
			userService.deleteMessage(addMessage, message_id, user_id.getUser_id());
			request.getRequestDispatcher("NoticeController?service=dustbin").forward(request, response);
		}else {
			 String id = request.getParameter("id"); 
			 userService.deleteNotice(id);
			 request.getRequestDispatcher("NoticeController?service=show").forward(request, response);
		}
	}
	private void showMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String addMessage = request.getParameter("addMessage");
		String id = request.getParameter("message_id");
		String subject = request.getParameter("subject");
		Integer sender = Integer.valueOf(request.getParameter("sender")) ;
		Integer receiver = Integer.valueOf( request.getParameter("receiver"));
		String content = request.getParameter("content");
			//保存邮件
		if(id!=null) {
			  Message message = new Message(Integer.valueOf(id),subject,sender,receiver,content);
			  userService.addMessage1(addMessage, message);
		}else {
		
			 Message message = new Message(subject,sender,receiver,content);
			 userService.addMessage(addMessage,message);
		}	
		request.getRequestDispatcher("NoticeController?service=queryDrafts&addMessage").forward(request, response);
	}
	private void queryDrafts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Boolean addMessage =Boolean.valueOf(request.getParameter("addMessage"));
		User user_id = (User) request.getSession().getAttribute("u");
		Integer  page =request.getParameter("page")==null?1:Integer.valueOf(request.getParameter("page"));
	
		List<Message>list= userService.queryDrafts(request,addMessage,user_id.getUser_id(),page);
			if(list.size()!=0){
				if(addMessage){
					//草稿箱
					request.setAttribute("list", list);
					request.getRequestDispatcher("WEB-INF/message/draftslist.jsp").forward(request,response); 
				}else {
					//发件箱
					request.setAttribute("list", list);
					request.getRequestDispatcher("WEB-INF/message/outboxlist.jsp").forward(request,response); 
				}
			}else{
			request.getRequestDispatcher("WEB-INF/message/list1.jsp").forward(request,response); 
		} 
	}	
	private void updateMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("id");
		Message message = userService.updateMessage(id);
		request.setAttribute("message", message);
		request.getRequestDispatcher("WEB-INF/message/addupdate.jsp").forward(request, response);
	}
	private void dustbinMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user_id = (User) request.getSession().getAttribute("u");
		  List<Message> list = userService.selectMessage(user_id.getUser_id()); 
		  if(list.size()!=0) { 
			  request.setAttribute("list", list);
		  request.getRequestDispatcher("WEB-INF/message/dustbinlist.jsp").forward(request, response); 
		  }else {
		  request.getRequestDispatcher("WEB-INF/message/list1.jsp").forward(request,response); 
		  }
		}
	//垃圾箱还原和删除
	private void restoreMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String addMessage = request.getParameter("addMessage");
			String message_id = request.getParameter("message_id");
			String receiver = request.getParameter("receiver");
			 User user_id = (User) request.getSession().getAttribute("u");
			if(addMessage!=null) {
				//垃圾箱删除
				userService.delete(message_id,user_id.getUser_id(),Integer.valueOf(receiver));
				request.getRequestDispatcher("NoticeController?service=dustbin").forward(request, response);
			}else {
				//垃圾箱还原
				userService.restoreMessage(message_id,user_id.getUser_id());
				request.getRequestDispatcher("NoticeController?service=queryDrafts&addMessage=true").forward(request, response);
			}
		
		
		}
	}


