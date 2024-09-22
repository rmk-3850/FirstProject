package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DashboardDAO {
    private Context context = null;
    private DataSource dataSource = null;
    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    public DashboardDAO () {
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
            System.out.println("[getProduct] Message : " + e.getMessage());
            System.out.println("[getProduct] Class   : " + e.getClass().getSimpleName());
        } finally {
			freeConnection();
		}
		return list;
	}

    public void setProduct (ProductDTO board) {
		String sql = "";
		try{
			connection = dataSource.getConnection();
			sql = "INSERT INTO pd(pd_code, pd_name, pd_price, pd_ea) VALUES(?, ?, ?, ?)";
					
			statement = connection.prepareStatement(sql);			
			statement.setString(1, board.getPd_code());
			statement.setString(2, board.getPd_name());
			statement.setInt(3, board.getPd_price());
			statement.setInt(4, board.getPd_ea());
			statement.executeUpdate();
		} catch (SQLException e) {
            System.out.println("[setProduct] Message : " + e.getMessage());
            System.out.println("[setProduct] Class   : " + e.getClass().getSimpleName());
        } finally{
			freeConnection();
		}
	}

        /* 
     		===== 서비스 매출 현황 통계 =====
            1. 예약 테이블에서 기준일(now) 까지의 1개월간 서비스별 시술 횟수 조회
            2. 복수 선택의 경우 개별 횟수에 추가
                1> 이름을 "," 으로 split   "반환 타입 : String[]"
                2> 배열에 해당하는 데이터(서비스명)가 있는 경우 카운트 증가
            3. ServiceDTO 객체 활용
                1> 단일 서비스의 DTO를 생성 _ 상품코드의 두 번째 자리가 0
    */
    // 인스턴스 변수 메서드화 : 리팩토링 예정 
    String[] services;
    int[] revenues;
    // 이전 매출 현황 조회 시 indexMonth 값 입력 (ex. 이번 달의 경우 0, 한 달 전의 경우 1)
    public void setServiceMap (int indexMonth) {
        // 서비스별 월매출액 저장
        Map<ServiceDTO, Integer> map = new LinkedHashMap<>();
		try{
			connection = dataSource.getConnection();
            // 단일 서비스를 조회하여 map 구조 초기화
            String sql = "SELECT ser_code, ser_name, ser_price FROM ser " +
                    "WHERE ser_code LIKE 'S0__'";  
			statement = connection.prepareStatement(sql);			
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ServiceDTO service = new ServiceDTO();
                service.setSer_code(resultSet.getString("ser_code"));
                service.setSer_name(resultSet.getString("ser_name"));   // 통계 자료에 출력하기 위한 ser_name
                service.setSer_price(resultSet.getInt("ser_price"));    // 서비스별 이용 요금
                service.setSer_cnt(0); // 서비스 이용 횟수
                map.put(service, (service.getSer_price() * service.getSer_cnt()));  // 매출액(value) 0으로 초기화
            }

            // 월별 서비스 매출액 조회
			sql ="SELECT ser_name, res.res_date FROM ser INNER JOIN res " + 
                    "ON res_date >= DATE_SUB(now(), INTERVAL " + indexMonth + " +5 DAY) " +
                    "AND res_date <= DATE_SUB(now(), INTERVAL " + indexMonth + " DAY)";

			statement = connection.prepareStatement(sql);			
            resultSet = statement.executeQuery();
            while(resultSet.next()) {
            	// 복수 선택 서비스 분리
                String[] ser_nameArr = resultSet.getString("ser_name").split(",");
                for (String ser_name : ser_nameArr) {
                    Set<ServiceDTO> keys = map.keySet();
                    for (ServiceDTO service : keys) {
                        if (service.getSer_name().equals(ser_name)) {
                            // 서비스 시술 횟수 카운트
                            service.setSer_cnt(service.getSer_cnt() + 1);
                            // 서비스별 수익 연산
                            int revenue = (service.getSer_price() * service.getSer_cnt());
                            map.put(service, map.getOrDefault(service, 0) + revenue);
                        }
                    }
                }
            }
            // 복수 선택 시 커트 시술 횟수 추가하기
			// sql = "SELECT count(*) as cut FROM ser INNER JOIN res " + 
            //         "ON res_date >= DATE_SUB(now(), INTERVAL " + indexMonth + " +5 DAY) " +
            //         "AND res_date <= DATE_SUB(now(), INTERVAL " + indexMonth + " DAY)" +
            //         "WHERE ser_code LIKE 'S1__'";
			// statement = connection.prepareStatement(sql);			
            // resultSet = statement.executeQuery();
            // while(resultSet.next()) {
            // 	resultSet.getInt("cut");
            // }


            // 배열에 저장
            services = new String[map.size()];
            revenues = new int[map.size()];
            Set<ServiceDTO> keys = map.keySet();
            java.util.Iterator<ServiceDTO> iterator = keys.iterator();
            // 카운터
            int i = 0;
            while (iterator.hasNext()) {
            	ServiceDTO service = iterator.next();
                	services[i] = service.getSer_name();
                	revenues[i] = map.get(service);
                	i++;
            }
		} catch (SQLException e) {
            System.out.println("[getServiceMap] Message : " + e.getMessage());
            System.out.println("[getServiceMap] Class   : " + e.getClass().getSimpleName());
        } finally{
			freeConnection();
		}
    }
    // 배열로 return :  JS에 전달용
    public String[] getServices() {
        return services;
    }
    public int[] getRevenues() {
        return revenues;
    }
}
