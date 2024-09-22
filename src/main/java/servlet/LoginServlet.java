package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AdminDAO;
import bean.AdminDTO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 실패 시 메시지 창 띄우기 (인코딩 먼저 해주어야 함)
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		// 입력받은 정보 추출
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String checkbox = req.getParameter("checkbox");
		Cookie cookie = new Cookie("userId", id); // 쿠키 생성
		
		// 아이디 저장 체크 시 쿠키에 아이디 정보 저장
		if(checkbox != null) { // 아이디 저장 체크박스 체크 여부에 따라 쿠키 저장 확인
			resp.addCookie(cookie); // 체크 시 쿠키 저장
		} else {
			cookie.setMaxAge(0); // 체크 해제 시 쿠키 유효시간 0으로 설정하여 삭제
			resp.addCookie(cookie);
		}
		
		// 아이디나 비밀번호가 빈 값인지 확인
	    if (id == null || id.trim().isEmpty() || pw == null || pw.trim().isEmpty()) {
	        out.println("<script> alert('아이디와 비밀번호를 입력해 주세요.');");
	        out.println("history.go(-1); </script>");
	        out.close();
	        return;
	    }
		
		// DB 연동
		AdminDTO dto = new AdminDTO();
		dto.setAd_id(id);
		
		AdminDAO dao = new AdminDAO();
		AdminDTO admin = dao.getAdmin(dto);
		
		// 로그인 성공 여부 확인
		try {
			if(admin != null) {
				if(admin.getAd_pw() != null && admin.getAd_pw().equals(pw)) {
					System.out.println("로그인 성공");
//					// 로그인 상태 정보 유지 (쿠키에 담아 전송하는 방법)
//					Cookie adminId = new Cookie("adminId", admin.getAd_id());
//					resp.addCookie(adminId);
					
					// 로그인 상태 정보 유지 (세션에 담아 전송, 세션이 종료될 때 까지 인증 상태 유지)
					HttpSession session = req.getSession();
					session.setAttribute("adminId", admin.getAd_id());
					
					// 성공 시 대시보드로 페이지 이동
					resp.sendRedirect("/TeamProject/views/dashboard.jsp");
					return;
				} else {
					System.out.println("비밀번호 오류");
					// 비밀번호 오류시 alert 창 띄우기
					out.println("<script> alert('아이디 또는 비밀번호가 틀립니다.');");
					out.println("history.go(-1); </script>"); 
					out.close();
					return;
				}
			} else {
				System.out.println("아이디 오류");
				// 아이디 오류시 alert 창 띄우기
				out.println("<script> alert('아이디 또는 비밀번호가 틀립니다.');");
				out.println("history.go(-1); </script>"); 
				out.close();
				return;
			}
		} catch(Exception e) {
			System.out.println("[getAdmin] Message : " + e.getMessage());
            System.out.println("[getAdmin] Class   : " + e.getClass().getSimpleName());
		}
		
		
		// 페이지 이동
//		String command = req.getParameter("command");
//		String url = "";
//				
//		if(command.equals("LOGIN")) {
//			url = "/views/dashboard.jsp";
//		}
//				
//		RequestDispatcher dispatcher = req.getRequestDispatcher(url);
//		dispatcher.forward(req, resp);
	}
}
