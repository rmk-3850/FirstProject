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

public class LoginDAO {
    private Context context = null;
    private DataSource dataSource = null;
    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    public LoginDAO () {
        try {
            context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/my");
        } catch (NamingException e) {
            System.out.println("[LoginDAO] Message : " + e.getMessage());
            System.out.println("[LoginDAO] Class   : " + e.getClass().getSimpleName());
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
    
	public List<LoginDTO> getMGRInfo() {
		String sql = "SELECT branch_code, branch_pw FROM branch";
		ArrayList<LoginDTO> list = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery();
			
			while(resultSet.next()){
				LoginDTO dto = new LoginDTO();
				dto.setBranch_code(resultSet.getString("branch_code"));
				dto.setBranch_pw(resultSet.getString("branch_pw"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
            System.out.println("[getMGRInfo] Message : " + e.getMessage());
            System.out.println("[getMGRInfo] Class   : " + e.getClass().getSimpleName());
        } finally {
			freeConnection();
		}
		return list;
	}
}
