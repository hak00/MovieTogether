package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.BoardVO;

public class BoardDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds = null;
	
	private Connection getConnection() throws Exception{
		Connection con = null;
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/movietogether");
		con = ds.getConnection();
		return con;
	}
	
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


	public void insertBoard(BoardVO vo) {
		
		int num=0;
		try {
			con = getConnection();
			String sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}else {
				num=1;
			}
			
			sql="insert into board(num,name,pass,subject,content,file,re_ref,re_lev,"
				+"re_seq,readcount,date,ip)"+"values(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPass());
			pstmt.setString(4, vo.getSubject());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getFile());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.setTimestamp(11, vo.getDate());
			pstmt.setString(12, vo.getIp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
	}//end of insertBoard;
	
	public int getBoardCount() {
		int count =0;
		try {
			con=getConnection();
			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return count;
	}//end of getBoardCount()
	
	public List<BoardVO> getBoardList(int startRow, int pageSize){
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			con = getConnection();
			String sql = "select * from board order by re_ref desc, re_seq asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setContent(rs.getString("content"));
				vo.setDate(rs.getTimestamp("date"));
				vo.setFile(rs.getString("file"));
				vo.setIp(rs.getString("ip"));
				vo.setName(rs.getString("name"));
				vo.setNum(rs.getInt("num"));
				vo.setPass(rs.getString("pass"));
				vo.setRe_lev(rs.getInt("re_lev"));
				vo.setRe_ref(rs.getInt("re_ref"));
				vo.setRe_seq(rs.getInt("re_seq"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setSubject(rs.getString("subject"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return list;
	}//end of getboardList
	
	public void updateReadCount(int num) {
		try {
			con = getConnection();
			String sql = "update board set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}
	
	public BoardVO getBoard(int num) {
		BoardVO vo = null;
		try {
			con = getConnection();
			String sql = "select* from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			vo = new BoardVO();
			if(rs.next()) {
				vo.setContent(rs.getString("content"));
				vo.setDate(rs.getTimestamp("date"));
				vo.setFile(rs.getString("file"));
				vo.setIp(rs.getString("ip"));
				vo.setName(rs.getString("name"));
				vo.setNum(rs.getInt("num"));
				vo.setPass(rs.getString("pass"));
				vo.setRe_lev(rs.getInt("re_lev"));
				vo.setRe_ref(rs.getInt("re_ref"));
				vo.setRe_seq(rs.getInt("re_seq"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setSubject(rs.getString("subject"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return vo;
	}
	
	public int deleteBoard(BoardVO vo) {
		int check=0;
		try {
			con=getConnection();
			String sql = "select pass from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getNum());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				if(vo.getPass().equals(rs.getString("pass"))) {
					check=1;
					sql = "delete from board where num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, vo.getNum());
					pstmt.executeUpdate();
				}else {
					check=0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return check;
	}
	
	public int updateBoard(BoardVO vo) {
		int check=0;
		try {
			con=getConnection();
			String sql = "select pass from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getNum());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				if(vo.getPass().equals(rs.getString("pass"))) {
					check=1;
					sql = "update board set name=?,subject=?,content=? where num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, vo.getName());
					pstmt.setString(2, vo.getSubject());
					pstmt.setString(3, vo.getContent());
					pstmt.setInt(4, vo.getNum());
					pstmt.executeUpdate();
				}else {
					check=0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return check;
	}
	
	public void reInsertBoard(BoardVO vo) {
		String sql = "";
		int num=0;
		try {
			con=getConnection();
			sql = "select max(num) from board";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1)+1;
			}else {
				num=1;
			}
			
			sql="update board set re_seq=re_seq+1 where re_ref=? and re_seq>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getRe_ref());
			pstmt.setInt(2, vo.getRe_seq());
			pstmt.executeUpdate();
			
			sql="insert into board(num,name,pass,subject,content,file,re_ref,re_lev,"
					+"re_seq,readcount,date,ip)"+"values(?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, vo.getName());
				pstmt.setString(3, vo.getPass());
				pstmt.setString(4, vo.getSubject());
				pstmt.setString(5, vo.getContent());
				pstmt.setString(6, vo.getFile());
				pstmt.setInt(7, vo.getRe_ref());
				pstmt.setInt(8, vo.getRe_lev()+1);
				pstmt.setInt(9, vo.getRe_seq()+1);
				pstmt.setInt(10, 0);
				pstmt.setTimestamp(11, vo.getDate());
				pstmt.setString(12, vo.getIp());
				pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}
	
	public int getCount(String search) {
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from board where subject like '%"+search+"%'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count= rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public List<BoardVO> getBoardList(int startRow, int pageSize,String search){
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			con = getConnection();
			String sql = "select * from board where subject like '%"+search+"%' order by re_ref desc, re_seq asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setContent(rs.getString("content"));
				vo.setDate(rs.getTimestamp("date"));
				vo.setFile(rs.getString("file"));
				vo.setIp(rs.getString("ip"));
				vo.setName(rs.getString("name"));
				vo.setNum(rs.getInt("num"));
				vo.setPass(rs.getString("pass"));
				vo.setRe_lev(rs.getInt("re_lev"));
				vo.setRe_ref(rs.getInt("re_ref"));
				vo.setRe_seq(rs.getInt("re_seq"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setSubject(rs.getString("subject"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return list;
	}//end of getboardList
}
