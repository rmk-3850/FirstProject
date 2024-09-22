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

public class DashBoardDAO {
    private Context context = null;
    private DataSource dataSource = null;
    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    public DashBoardDAO () {
        try {
            context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/acorn");
        } catch (NamingException e) {
            System.out.println("[DashBoardDAO] Message : " + e.getMessage());
            System.out.println("[DashBoardDAO] Class   : " + e.getClass().getSimpleName());
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
		String sql = "SELECT pd_name, pd_ea FROM pd WHERE pd_ea < 4 ORDER BY pd_ea";
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
            System.out.println("[getProduct] Message : " + e.getMessage());
            System.out.println("[getProduct] Class   : " + e.getClass().getSimpleName());
        } finally {
			freeConnection();
		}
		return list;
	}
    
	public List<ReservationDTO> getReservation() {
		String sql = "SELECT a.res_time, b.ser_name FROM res a INNER JOIN ser b ON a.ser_code = b.ser_code WHERE res_date=CURDATE() ORDER BY res_time";
		ArrayList<ReservationDTO> list = new ArrayList<>();
		try {
			connection = dataSource.getConnection();			
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();
			
			while(resultSet.next()){
				ReservationDTO board = new ReservationDTO();
				board.setRes_time(resultSet.getString("res_time"));
				board.setSer_name(resultSet.getString("ser_name"));
				
				list.add(board);
			}
		} catch (SQLException e) {
            System.out.println("[getReservation] Message : " + e.getMessage());
            System.out.println("[getReservation] Class   : " + e.getClass().getSimpleName());
        } finally {
			freeConnection();
		}
		return list;
	}

}
