package commandModel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import imodel.ICommand;

public class WrongCommand implements ICommand {

	@Override
	public String processCommand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		return "/views/wrong.jsp";
	}

}
