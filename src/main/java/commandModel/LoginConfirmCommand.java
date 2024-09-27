package commandModel;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import imodel.ICommand;
import loginbean.LoginDAO;
import loginbean.LoginDTO;

public class LoginConfirmCommand implements ICommand {

	@Override
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String inputId = req.getParameter("id");
		String inputPw = req.getParameter("pw");
		String inputIdReg = req.getParameter("idreg"); //on&null
		
		LoginDAO logindao = new LoginDAO();
		ArrayList<LoginDTO> list = (ArrayList)logindao.getMGRInfo();
		String branch_code = list.getFirst().getBranch_code();
		String branch_pw = list.getFirst().getBranch_pw();
		
		if(inputId == branch_code && inputPw == branch_pw){
			if(inputIdReg == "on") {
				Cookie cookie_branch_code = new Cookie("id", branch_code);		
				resp.addCookie(cookie_branch_code);
				
				cookie_branch_code.setMaxAge(60*60);
				
				return "/views/dashboard.jsp";
			}else {
				return "/views/dashboard.jsp";
			}
		}else {
			return "/views/login.jsp";
		}
		
		
	}
}
