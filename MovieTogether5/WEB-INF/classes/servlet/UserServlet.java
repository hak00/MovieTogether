package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import vo.UserVO;

@WebServlet("/User/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String nextPage = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		UserDao dao = null;
		if(action != null) {
			dao = new UserDao();
			
				if(action.equals("/send.do")){
					String receiver = request.getParameter("receiver");
					String code_check = request.getParameter("code_check");
					dao.sendMail(receiver,code_check);
					
					
				}else if(action.equals("/idCheck.do")){
					String id = request.getParameter("id");
					response.getWriter().write(new UserDao().idCheck(id)+"");
					
				}else if(action.equals("/join.do")){
					UserVO uservo = new UserVO();
					uservo.setId(request.getParameter("id"));
					uservo.setPass(request.getParameter("pass"));
					uservo.setName(request.getParameter("name")); 
					uservo.setAge(request.getParameter("age")); 
					uservo.setAddr(request.getParameter("addr"));
					uservo.setEmail(request.getParameter("receiver"));
					dao.AddMember(uservo);
					response.sendRedirect("../index.jsp");
				}else if(action.equals("/login.do")){
					String id = request.getParameter("id");
					String pass = request.getParameter("pass");
					int check = dao.userCheck(id,pass);
					if(check == 1){
						HttpSession session = request.getSession();
						session.setAttribute("id", id);
						response.sendRedirect("../index.jsp");
					}else{
						response.sendRedirect("../index.jsp?check="+check);
					}
				}
		}//end of action if
		
		
	}//end of doHandle

	

}
