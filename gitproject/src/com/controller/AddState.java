package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.front.Command;

/**
 * Servlet implementation class AddState
 */
@WebServlet("/AddState")
public class AddState extends HttpServlet implements Command {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int pop1 = Integer.parseInt(request.getParameter("pop1"));
		int pop2 = Integer.parseInt(request.getParameter("pop2"));
		int pop3 = Integer.parseInt(request.getParameter("pop3"));
		
		com.DTO.StateDTO dto = new com.DTO.StateDTO(pop1, pop2, pop3);
		com.DAO.StateDAO dao = new com.DAO.StateDAO();
		int cnt = dao.stateCnt(dto);
		
		if (cnt > 0) {
			dao.stateCnt(dto);
			System.out.println("���� ��ư update ����");
		}else {
			System.out.println("���� ��ư update ����");
		}

	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

}
