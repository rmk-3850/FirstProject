package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ReservationDAO_ {
    private Context context = null;
    private DataSource dataSource = null;

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;

    public ReservationDAO_ () {
        try {
            context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/acorn");
        } catch (NamingException e) {
            System.out.println("[ReservationDAO] Message : " + e.getMessage());
            System.out.println("[ReservationDAO] Class   : " + e.getClass().getSimpleName());
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
/* 
    // 저장할 자료구조로 변경해주세요.
    public java.util.Set<ReservationDTO> getReservation(int res_no) {
        java.util.Set<ReservationDTO> set = new java.util.HashSet<>();
        String sql;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = dataSource.getConnection();

            sql = "SELECT * FROM res WHERE res_no=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, res_no);
            resultSet = statement.executeQuery();

            while(resultSet.next()) {
                ReservationDTO DTO = new ReservationDTO();
                DTO.setRes_no(resultSet.getInt("res_no"));
                DTO.setRes_date(resultSet.getDate("res_date"));
                DTO.setRes_time(resultSet.getDate("res_time"));
                DTO.setRes_comm(resultSet.getString("res_comm"));
                DTO.setCus_id(resultSet.getInt("cus_id"));
                DTO.setSer_code(resultSet.getString("ser_code"));

                set.add(DTO);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("[getReservation] Message : " + e.getMessage());
            System.out.println("[getReservation] Class   : " + e.getClass().getSimpleName());
        } finally {
            freeConnection();
        }
        return set;
    }
*/
}
