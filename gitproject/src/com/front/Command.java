package com.front;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {//��ü�������ڽĿ��� �ؼ� �θ���command�� ��ĳ����~

	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException;//�߻�޼ҵ�� �߰�ȣ���� �̸��� ����
	//execute�� �ʿ������� ������ �� �ٸ�, �˾Ƽ���~ 
}
