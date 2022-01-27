package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.UserVO;

public class UserDao {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds = null;

	// Connection pool 얻기.
	private Connection getConnection() throws Exception {

		Context init = new InitialContext();
		// 커넥션풀 얻기
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/movietogether");
		return ds.getConnection();

	}// end of getConnection()


	// 자원해제
	public void freeResource() {

		if (con != null)
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		if (rs != null)
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}// end of freeResource();

	public void AddMember(UserVO uservo) {
		try {
			con = getConnection();
			String sql = "insert into user(id,name,pass,addr,email,age) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uservo.getId());
			pstmt.setString(2, uservo.getName());
			pstmt.setString(3, uservo.getPass());
			pstmt.setString(4, uservo.getAddr());
			pstmt.setString(5, uservo.getEmail());
			pstmt.setString(6, uservo.getAge());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
	}// end of AddMember

	public void sendMail(String receiver, String code_check) {
		Properties p = System.getProperties();
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		javax.mail.Authenticator auth = new MyAuthentication();

		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);

		try {
			msg.setSentDate(new Date());
			Address from = new InternetAddress("MovieTogether");
			msg.setFrom(from);

			InternetAddress to = new InternetAddress(receiver);
			msg.setRecipient(Message.RecipientType.TO, to);

			msg.setSubject("MovieTogether 인증번호 입니다.", "UTF-8");

			msg.setText("인증번호 :" + code_check, "UTF-8");
			msg.setHeader("content-Type", "text/html");

			javax.mail.Transport.send(msg);
			System.out.println("보냄!");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}// end of sendMail()

	public int idCheck(String id) {
		try {
			con = getConnection();
			String sql = "select* from user where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next())
				return 0;
			else {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}

		return -1;
	}

	public int userCheck(String id, String pass) {
		int check = 0;
		try {
			con = getConnection();
			String sql = "select* from user where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (pass.equals(rs.getString("pass"))) {
					check = 1;
				} else { 
					check = 0; 
				}
			} else { 
				check = -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return check;
	}
	
	public UserVO getUser(String id) {
		UserVO vo = new UserVO();
		try {
			con = getConnection();
			String sql = "select* from user where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setId(rs.getString("id"));
				vo.setAddr(rs.getString("addr"));
				vo.setAge(rs.getString("age"));
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setPass(rs.getString("pass"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return vo;
	}
	
	public int updateUser(UserVO vo, String passwd){
		int check=0;
		try {
			con=getConnection();
			String sql = "select pass from user where pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, passwd);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pass").equals(passwd)) {
					
					sql = "update user set pass=?,addr=? where pass=?";
					pstmt= con.prepareStatement(sql);
					pstmt.setString(1, vo.getPass());
					pstmt.setString(2, vo.getAddr());
					pstmt.setString(3, passwd);
					pstmt.executeUpdate();
					
				}
				check =1;
			}else {
				check=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return check;
	}
	
}

class MyAuthentication extends javax.mail.Authenticator {
	javax.mail.PasswordAuthentication pa;

	public MyAuthentication() {
		String id = "Emial ID";
		String pw = "Email Password";

		pa = new javax.mail.PasswordAuthentication(id, pw);
	}

	public javax.mail.PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
