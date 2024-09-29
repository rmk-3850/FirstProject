package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class NoticeDAO {
    private Context context = null;
    private DataSource dataSource = null;
    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    public NoticeDAO () {
        try {
            context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/acorn");
        } catch (NamingException e) {
            System.out.println("[NoticeDAO] Message : " + e.getMessage());
            System.out.println("[NoticeDAO] Class   : " + e.getClass().getSimpleName());
        }
    }
    
    public void freeConnection() {
        try {
            if (connection != null) {
                connection.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (resultSet != null) {
                resultSet.close();
            }
        } catch (SQLException e) {
            System.out.println("[freeConnection] Message : " + e.getMessage());
            System.out.println("[freeConnection] Class   : " + e.getClass().getSimpleName());
        }
    }
    
	public List<NoticeDTO> getSNoticeList() {
		String sql = "SELECT notice_no, notice_title, notice_content, notice_reg FROM notice WHERE notice_check = 1  ORDER BY notice_reg desc";
		ArrayList<NoticeDTO> list = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();
			
			while(resultSet.next()){
				NoticeDTO dto = new NoticeDTO();
				dto.setNotice_no(resultSet.getInt("notice_no"));
				dto.setNotice_title(resultSet.getString("notice_title"));
				dto.setNotice_content(resultSet.getString("notice_content"));
				dto.setNotice_reg(resultSet.getObject("notice_reg", LocalDate.class));				
				
				list.add(dto);
			}
		} catch (SQLException e) {
            System.out.println("[getGNotice] Message : " + e.getMessage());
            System.out.println("[getGNotice] Class   : " + e.getClass().getSimpleName());
        } finally {
			freeConnection();
		}
		return list;
	}
    
	public List<NoticeDTO> getGNoticeList() {
		String sql = "SELECT notice_no, notice_title, notice_content, notice_reg FROM notice WHERE notice_check = 0  ORDER BY notice_reg desc";
		ArrayList<NoticeDTO> list = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();
			
			while(resultSet.next()){
				NoticeDTO dto = new NoticeDTO();
				dto.setNotice_no(resultSet.getInt("notice_no"));
				dto.setNotice_title(resultSet.getString("notice_title"));
				dto.setNotice_content(resultSet.getString("notice_content"));
				dto.setNotice_reg(resultSet.getObject("notice_reg", LocalDate.class));
				
				list.add(dto);
			}
		} catch (SQLException e) {
            System.out.println("[getGNotice] Message : " + e.getMessage());
            System.out.println("[getGNotice] Class   : " + e.getClass().getSimpleName());
        } finally {
			freeConnection();
		}
		return list;
	}
	
	public NoticeDTO getNotice(int notice_no) {
		String sql = "SELECT * FROM notice WHERE notice_no=?";
		NoticeDTO dto = new NoticeDTO();
		try {
			connection = dataSource.getConnection();
			statement = connection.prepareStatement(sql);			
			statement.setInt(1, notice_no);
			resultSet = statement.executeQuery();
			
			while(resultSet.next()){				
				dto.setNotice_no(resultSet.getInt("notice_no"));
				dto.setNotice_title(resultSet.getString("notice_title"));
				dto.setNotice_content(resultSet.getString("notice_content").replace("\n", "<br>"));
				dto.setNotice_reg(resultSet.getObject("notice_reg", LocalDate.class));
			}
		}
		catch(Exception e){System.out.println("BoardDao.getBoard() : " + e);}
		finally{
			freeConnection();
		}
		return dto;
	}
}
