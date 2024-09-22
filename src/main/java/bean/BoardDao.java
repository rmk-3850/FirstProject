package mybean.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDao {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private Context ctx;
	private DataSource ds;
	public BoardDao() {
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/acorn");
		} catch (NamingException e) {
			System.out.println("BoardDao생성자 : " + e); // 어디서 에러가 났는지 빨리 캐치하기 위한 것
		} 
	}
	
	public void freeConn() {
		try {
		if(conn != null) conn.close();
		if(stmt != null) stmt.close();
		if(rs != null) rs.close();
		} 
		catch(Exception e) {
			System.out.println("freeConn : " + e);
		}
	}
	
	// customer.jsp
	public List<Board> getBoardList(String keyField, String keyWord) {
		String sql = null;
		
		if(keyWord == null || keyWord.isEmpty()) {
			sql = "SELECT * FROM cus";
		}
		else {
			sql = "SELECT * FROM cus WHERE " + keyField + " LIKE '%" + keyWord + "%'";
		}
		
		//전달할 쿼리 준비(어떤 명령어를 db에 전달할지)
		
		ArrayList list = new ArrayList();
		
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
		
			while(rs.next()) {
				Board board = new Board();
				board.setCus_id(rs.getInt("cus_id"));
				board.setCus_name(rs.getString("cus_name"));
				board.setCus_gender(rs.getString("cus_gender"));
				board.setCus_ph(rs.getString("cus_ph"));
				board.setCus_mail(rs.getString("cus_mail"));
				board.setCus_reg(rs.getString("cus_reg"));
				board.setCus_rank(rs.getString("cus_rank"));
				board.setCus_note(rs.getString("cus_note"));
				
				list.add(board);
			}
		}
		catch(Exception err) {
			System.out.println("getBoardList : " + err);
		}
		finally {
			freeConn();
		}
		return list;
	}
}