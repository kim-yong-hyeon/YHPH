package com.front;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.AddState;
import com.controller.JoinService;
import com.controller.LoginService;
import com.controller.LogoutService;
import com.controller.addLikes;
import com.controller.classnameService;
import com.sun.xml.internal.ws.client.SenderException;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	private HashMap<String, Command> map;
	
	@Override
	public void init() throws ServletException {
		map = new HashMap<String, Command>(); //
		map.put("JoinService.do", new JoinService());
		map.put("LoginService.do", new LoginService());
		map.put("LogoutService.do", new LogoutService());
		map.put("classnameService.do", new classnameService());
		map.put("AddState.do", new AddState());
	}



	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("����Ʈ ��Ʈ�ѷ� ����"); //Frontcontroller : .do�� ���� ��� ��û�� �Ѱ����� ����
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();//�����ø����̼��� �̸��� ������
		
		String resultURL = requestURI.substring(contextPath.length() + 1); //+1�ؼ� �����ñ��� �ڸ�
		System.out.println(resultURL);
		
		request.setCharacterEncoding("UTF-8");
		
		Command command = map.get(resultURL);// ��û�� url�� �����ͼ� Ŀ���� ��ü���� �� �ؽ��ʿ� put
		// command ���� : frontcontroller���� ����û�� ó�� -> �� ��û�� ó���� �ٸ� servlet Ŭ������ ������ ó���ϰ� �ϴ� ���
		
		String moveURL = command.execute(request, response);// execute�޼ҵ带 ���� ����� �����ϰ� �̵��� �������� url���� �޾ƿ´�.
		System.out.println("���縮��" + moveURL);
		response.sendRedirect(moveURL);//�ߺ�
	}
	

}
