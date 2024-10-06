package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import commandModel.CommandFactory;


@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private Context context = null;
    private DataSource dataSource = null;
    private Connection connection = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;
    
    public void init() throws ServletException {
    	super.init();
    	try {
            context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/acorn");
        } catch (NamingException e) {
            System.out.println("[Controller] Message : " + e.getMessage());
            System.out.println("[Controller] Class   : " + e.getClass().getSimpleName());
        }
    }
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//페이지 이동
		String command = req.getParameter("command");
		String url = "";
		imodel.ICommand iCmd = null;
		
		CommandFactory factory = CommandFactory.newcommandInstance();
		iCmd = factory.createcommandInstance(command);
		
		url = iCmd.processCommand(req, resp);
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
			
		
		
		/*
		//대시보드 매출 그래프
        String sql = "SELECT service_name, (service_price * service_cnt) AS sales FROM service";
        StringBuilder jsonBuilder = new StringBuilder();
        jsonBuilder.append("{"); // JSON 객체 시작

        try {
            connection = dataSource.getConnection();            
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            
            boolean first = true; // 첫 번째 항목인지 확인

            while (resultSet.next()) {
                if (!first) {
                    jsonBuilder.append(","); // 첫 번째 항목이 아닐 경우 쉼표 추가
                }
                String serName = resultSet.getString("service_name");
                int sales = resultSet.getInt("sales");
                jsonBuilder.append("\"").append(serName).append("\": ").append(sales);
                first = false; // 첫 번째 항목 처리 후 false로 변경
            }
            
            jsonBuilder.append("}"); // JSON 객체 끝
            
            // 데이터 전송
            resp.setContentType("application/json");
            resp.getWriter().write(jsonBuilder.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
		*/

		
	}
}
