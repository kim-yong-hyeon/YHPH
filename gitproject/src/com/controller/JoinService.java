package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.CLASS_MEMBER_DAO;
import com.DTO.CLASS_MEMBER_DTO;
import com.front.Command;

public class JoinService implements Command{

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//controller���ִ� �α��α�� �Ű���->ȸ�������Ҷ� ���� frontController���� ����� (join�����ϳ� �پ��)
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String pw = request.getParameter("pw");
		int job = Integer.parseInt(request.getParameter("job"));
//		int studentlevel = Integer.parseInt(request.getParameter("studentlevel"));
		
		
		CLASS_MEMBER_DTO dto = new CLASS_MEMBER_DTO(email, nickname, pw, job);
		CLASS_MEMBER_DAO dao = new CLASS_MEMBER_DAO();
		int cnt = dao.Join(dto);	
		
		if(cnt>0) {
			System.out.println("ȸ������ ����");
		}else {
			System.out.println("ȸ������ ����");
		}
		return "Login.jsp";// �ּҸ� ���� 
	}

	
}
