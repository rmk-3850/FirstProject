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

public class OrderDAO {
    private Context context = null;
    private DataSource dataSource = null;
    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    public OrderDAO () {
        try {
            context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/my");
        } catch (NamingException e) {
            System.out.println("[OrderDAO] Message : " + e.getMessage());
            System.out.println("[OrderDAO] Class   : " + e.getClass().getSimpleName());
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
    
	public List<OrderDTO> getBProductList() {
		String sql = "SELECT product_name, product_B_code FROM product_B ORDER BY product_B_code";
		ArrayList<OrderDTO> list = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();
			
			while(resultSet.next()){
				OrderDTO board = new OrderDTO();
				board.setProduct_name(resultSet.getString("product_name"));
				board.setProduct_B_code(resultSet.getString("product_B_code"));
				list.add(board);
			}
		} catch (SQLException e) {
            System.out.println("[getBProductList] Message : " + e.getMessage());
            System.out.println("[getBProductList] Class   : " + e.getClass().getSimpleName());
        } finally {
			freeConnection();
		}
		return list;
	}
    
	public List<OrderDTO> getProductList(String product_code) {
		product_code = String.format("%.2s", product_code);
		String sql = "SELECT product_name, product_price"
				+ " FROM product WHERE product_code LIKE '" + product_code + "%' ORDER BY product_code";
			    
		ArrayList<OrderDTO> list = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();
			
			while(resultSet.next()){
				OrderDTO board = new OrderDTO();
				board.setProduct_name(resultSet.getString("product_name"));
				board.setProduct_price(resultSet.getInt("product_price"));
				list.add(board);
			}
		} catch (SQLException e) {
            System.out.println("[getProductList] Message : " + e.getMessage());
            System.out.println("[getProductList] Class   : " + e.getClass().getSimpleName());
        } finally {
			freeConnection();
		}
		return list;
	}
}
