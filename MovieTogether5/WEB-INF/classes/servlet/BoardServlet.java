package servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDAO;
import vo.BoardVO;

@WebServlet("/Board/*")
public class BoardServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	BoardDAO dao = null;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		if(action!=null) {
			dao = new BoardDAO();
			if(action.equals("/writeBoard.do")){
				ServletContext ctx = getServletContext();
				String realPath = ctx.getRealPath("/upload");
				int maxSize = 1024 * 1024 * 5;
				MultipartRequest multi = new MultipartRequest(request,
														realPath,
														maxSize,
														"utf-8",
														new DefaultFileRenamePolicy()
														);
				BoardVO vo = new BoardVO();
				vo.setContent(multi.getParameter("content"));
				vo.setDate(new Timestamp(System.currentTimeMillis()));
				vo.setIp(request.getRemoteAddr());
				vo.setFile(multi.getFilesystemName("file"));
				vo.setName(multi.getParameter("name"));
				vo.setPass(multi.getParameter("pass"));
				vo.setSubject(multi.getParameter("subject"));
				dao.insertBoard(vo);
				response.sendRedirect("../board1/board.jsp");
				
			}else if(action.equals("/filedown.do")) {
				String fileName = request.getParameter("filename");
				String folder = request.getServletContext().getRealPath("/upload");
				response.setContentType("Application/x-msdownload");
				response.setHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(fileName,"utf-8").replaceAll("\\+", "%20")+";");
				
				File f = new File(folder+"/"+ new String(fileName.getBytes("utf-8"),"8859_1"));
				
				byte[] buffer = new byte[1024];
				
				if(f.isFile()) {
					try {
						BufferedInputStream input = new BufferedInputStream(new FileInputStream(f));
						BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream());
						int read;
						
						while((read=input.read(buffer))!=-1) {
							output.write(buffer,0,read);
						}
						output.flush();
						output.close();
						input.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
