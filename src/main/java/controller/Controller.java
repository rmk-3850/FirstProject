package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commandModel.CommandFactory;


@WebServlet("/Controller")
public class Controller extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String command = req.getParameter("command");
		String url = "";
		imodel.ICommand iCmd = null;
		
		CommandFactory factory = CommandFactory.newcommandInstance();
		iCmd = factory.createcommandInstance(command);
		
		url = iCmd.processCommand(req, resp);
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
