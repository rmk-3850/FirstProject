package commandModel;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import bean.OrderDAO;
import bean.OrderDTO;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String demand = request.getHeader("demand");
		if(demand.equalsIgnoreCase("demandFrame")) {
			System.out.println("demandFrame실행");
			OrderDAO dao = new OrderDAO();
			ArrayList<OrderDTO> list = (ArrayList<OrderDTO>)dao.getBProductList();
			JSONObject respJsnObj = new JSONObject();
			respJsnObj.put("BProductList", new JSONArray(list));
			response.setContentType("application/json");
			response.getWriter().print(respJsnObj);
		}
		if(demand.equalsIgnoreCase("demandList")) {
			System.out.println("demandList실행");
			StringBuilder sb = new StringBuilder();
			BufferedReader reader = request.getReader();
			String line;
			while((line = reader.readLine()) != null) {
				sb.append(line);
			}
			JSONObject reqJsnObj = new JSONObject(sb.toString());
			String product_code = reqJsnObj.getString("product_B_code");
			
			OrderDAO dao = new OrderDAO();
			ArrayList<OrderDTO> list = (ArrayList<OrderDTO>)dao.getProductList(product_code);
			JSONObject respJsnObj = new JSONObject();
			respJsnObj.put("productList", new JSONArray(list));
			response.setContentType("application/json");
			response.getWriter().print(respJsnObj);
		}
	}
}
