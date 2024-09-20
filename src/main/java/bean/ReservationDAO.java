package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ReservationDAO {
    private Context context = null;
    private DataSource dataSource = null;

    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;

    public ReservationDAO () {
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

 //reservation.jsp
//    public List<ReservationDTO> getReservationDTOList(String keyField, String keyWord){
//    	String sql = null;
//    	ArrayList list = new ArrayList();
//    	
//    	try {
//    		context = new InitialContext();
//    		dataSource = (DataSource)context.lookup("java:comp/env/jdbc/acorn");
//    		connection = dataSource.getConnection();
//    		
//    		sql = "SELECT res_no, ser_name,  res_date, res_time, cus_name, res_comm FROM res "
//            		+ "INNER JOIN cus ON cus.cus_id = res.cus_id INNER JOIN ser ON ser.ser_code = res.ser_code";
//    		statement = connection.prepareStatement(sql);
//    		resultSet = statement.executeQuery();
//    		
//    		while(resultSet.next()) {
//    			ReservationDTO reservationDTO = new ReservationDTO();
//    			reservationDTO.setRes_no(resultSet.getInt("res_no"));
//    			reservationDTO.setSer_name(resultSet.getString("ser_name"));
//    			reservationDTO.setRes_date(resultSet.getString("res_date"));
//    			reservationDTO.setRes_time(resultSet.getString("res_time"));
//    			reservationDTO.setCus_name(resultSet.getString("cus_name"));
//    			reservationDTO.setRes_comm(resultSet.getString("res_comm"));
//    			
//    		}
//    		
//    	}
//    	catch(Exception err) {
//    		System.out.println("Error : " + err);
//    	}
//    	finally {
//    		freeConnection();
//    	}
//		return list;
//    }
    
    
    //reservationPostProc.jsp
    public void setReservationDTO(ReservationDTO reservationDTO) throws SQLException, ClassNotFoundException {
        String sql = null;
        int cus_id;
        String ser_code;

        try { 
        	context = new InitialContext();
    		dataSource = (DataSource)context.lookup("java:comp/env/jdbc/acorn");
    		connection = dataSource.getConnection();
    		/* 
            sql = "SELECT cus_id from cus WHERE cus_name=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, reservationDTO.getCus_name());
            resultSet = statement.executeQuery();
            if(resultSet.next()) {
                cus_id = resultSet.getInt("cus_id");
            }
            
            sql = "SELECT ser_code from ser WHERE ser_name?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, reservationDTO.getSer_name());
            resultSet = statement.executeQuery();
            if(resultSet.next()) {
                ser_code = resultSet.getString("ser_code");
            }


        	sql = "INSERT INTO res (cus_id, ser_code, res_date, res_time, res_comm) VALUES (?, ?, ?, ?, ?)";

            statement = connection.prepareStatement(sql);

            statement.setInt(1, cus_id);
            statement.setString(2, ser_code);
            statement.setString(3, reservationDTO.getRes_date());
            statement.setString(4, reservationDTO.getRes_time());
            statement.setString(5, reservationDTO.getRes_comm());
 */

            sql = "INSERT INTO res (cus_id, ser_code, res_date, res_time, res_comm) VALUES" +
                    "(SELECT cus_id FROM cus WHERE cus_name =?)," +
                    "(SELECT ser_code FROM ser WHERE ser_name =?), ?, ?, ?";

            sql = "INSERT INTO res (cus_id, ser_code, res_date, res_time, res_comm) " +
                    "SELECT (SELECT cus_id FROM cus WHERE cus_name = ?), " +
                    "(SELECT ser_code FROM ser WHERE ser_name = ?), ?, ?, ?";
                    
            statement.executeUpdate();
        } 
        catch(Exception err) {
        	System.out.println("Error : "  + err);
        }
        finally {
            freeConnection();
        }
    }

}
