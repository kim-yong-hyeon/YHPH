package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ChatDAO;
import com.DTO.ChatDTO;
import com.DTO.ChatinfoDTO;
import com.front.Command;

public class classnameService implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		
		String teacher = request.getParameter("teacher");
		String classname = request.getParameter("classname");
		
		ChatinfoDTO dto = new ChatinfoDTO( teacher, classname);
		
		ChatDAO dao = new ChatDAO();
		// ä�ù� ���� �޼ҵ�
		int cnt = dao.createChatRoom(dto);
		
		if(cnt > 0) {
			System.out.println("ä�ù� ���� �Ϸ�");
		}else {
			System.out.println("ä�ù� ���� ����");
		}
		
		return "chat.jsp?cnt="+cnt;
	}

}