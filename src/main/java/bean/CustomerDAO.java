package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CustomerDAO {

    private Context context = null;
    private DataSource dataSource = null;

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;

    public CustomerDAO () {
        try {
            context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/acorn");
        } catch (NamingException e) {
            System.out.println("[CustomerDAO] Message : " + e.getMessage());
            System.out.println("[CustomerDAO] Class   : " + e.getClass().getSimpleName());
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
  
    // 저장할 자료구조로 변경해주세요.
    public Set<CustomerDTO> getCustomer(int cus_id) {
        Set<CustomerDTO> set = new HashSet<>();
        String sql;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = dataSource.getConnection();

            sql = "SELECT * FROM cus WHERE cus_id=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, cus_id);
            resultSet = statement.executeQuery();

            while(resultSet.next()) {
                CustomerDTO DTO = new CustomerDTO();
                DTO.setCus_id(resultSet.getInt("cus_id"));
                DTO.setCus_name(resultSet.getString("cus_name"));
                DTO.setCus_ph(resultSet.getString("cus_ph"));
                DTO.setCus_mail(resultSet.getString("cus_mail"));
                DTO.setCus_reg(resultSet.getString("cus_reg"));
                DTO.setCus_rank(resultSet.getString("cus_rank"));

                set.add(DTO);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("[getCustomer] Message : " + e.getMessage());
            System.out.println("[getCustomer] Class   : " + e.getClass().getSimpleName());
        } finally {
            freeConnection();
        }
        return set;
    }

}