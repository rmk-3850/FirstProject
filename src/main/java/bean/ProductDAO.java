package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDAO {
    
    private Context context = null;
    private DataSource dataSource = null;

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;

    public ProductDAO () {
        try {
            context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/acorn");
        } catch (NamingException e) {
            System.out.println("[ProductDAO] Message : " + e.getMessage());
            System.out.println("[ProductDAO] Class   : " + e.getClass().getSimpleName());
        }
    }
        
    /* DB 연결 해제 */
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



	public List<ProductDTO> getProduct() {
		/*
		String sql = null;
		if(keyWord == null || keyWord.isEmpty()) {
			sql = "SELECT * FROM tblboard ORDER BY b_pos";
		}
		else {
			sql = "SELECT * FROM tblboard WHERE " + keyField + " like '%" + keyWord + "%' ORDER BY b_pos"; // like 앞에 공백 필수,,!!!
		}
		*/
		
		String sql = "SELECT * FROM pd";
		ArrayList<ProductDTO> list = new ArrayList<>();
		
		try {
			connection = dataSource.getConnection();			
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();
			
			while(resultSet.next()){
				ProductDTO board = new ProductDTO();
				board.setPd_code(resultSet.getString("pd_code"));
				board.setPd_name(resultSet.getString("pd_name"));
				board.setPd_price(resultSet.getInt("pd_price"));
				board.setPd_ea(resultSet.getInt("pd_ea"));
				
				list.add(board);
			}
		} catch (SQLException e) {
            System.out.println("[getProduct] Message : " + e.getMessage());
            System.out.println("[getProduct] Class   : " + e.getClass().getSimpleName());
        } finally {
			freeConnection();
		}
		return list;
	}
	
	public List<ProductDTO> getProductToDashBoard() {
		
		String sql = "SELECT pd_name, pd_ea FROM pd WHERE pd_ea < 4";
		ArrayList<ProductDTO> list = new ArrayList<>();
		
		try {
			connection = dataSource.getConnection();			
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();
			
			while(resultSet.next()){
				ProductDTO board = new ProductDTO();
				board.setPd_name(resultSet.getString("pd_name"));
				board.setPd_ea(resultSet.getInt("pd_ea"));
				
				list.add(board);
			}
		} catch (SQLException e) {
            System.out.println("[getProductToDashBoard] Message : " + e.getMessage());
            System.out.println("[getProductToDashBoard] Class   : " + e.getClass().getSimpleName());
        } finally {
			freeConnection();
		}
		return list;
	}
	
	public void setProductByBoard (ProductDTO board) {
		String sql = "";
		try{
			connection = dataSource.getConnection();
			/*
            // [DB] 답변을 위한 pos 증가
			sql = "UPDATE tblboard SET b_pos = b_pos + 1";
			statement = connection.prepareStatement(sql);
			statement.executeUpdate();
			*/
			
			sql = "INSERT INTO pd(pd_code, pd_name, pd_price, pd_ea) VALUES(?, ?, ?, ?)";
					
			statement = connection.prepareStatement(sql);			
			statement.setString(1, board.getPd_code());
			statement.setString(2, board.getPd_name());
			statement.setInt(3, board.getPd_price());
			statement.setInt(4, board.getPd_ea());
			statement.executeUpdate();
		} catch (SQLException e) {
            System.out.println("[setProductByBoard] Message : " + e.getMessage());
            System.out.println("[setProductByBoard] Class   : " + e.getClass().getSimpleName());
        } finally{
			freeConnection();
		}
	}
}
