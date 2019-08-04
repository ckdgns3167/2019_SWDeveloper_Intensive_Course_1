<%@ page import="com.urline.dao.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="EUC-KR"%>
<%
	// ���ڵ� ó��
	request.setCharacterEncoding("euc-kr");
	String ctxPath = request.getContextPath();
	// �α��� ȭ�鿡 �Էµ� ���̵�� ��й�ȣ�� �����´�
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	// DB���� ���̵�, ��й�ȣ Ȯ��
	UserDAO dao = UserDAO.getInstance();
	int check = dao.loginCheck(id, pw);

	// URL �� �α��ΰ��� ���� �޽���
	String msg = "";

	if (check == 1) // �α��� ����
	{
		// ���ǿ� ���� ���̵� ����
		session.setAttribute("sessionID", id);
		msg = ctxPath + "/Main.jsp";
	} else if (check == 0) // ��й�ȣ�� Ʋ�����
	{
		msg = ctxPath + "/Login.jsp?msg=0";
	} else // ���̵� Ʋ�����
	{
		msg = ctxPath + "/Login.jsp?msg=-1";
	}

	// sendRedirect(String URL) : �ش� URL�� �̵�
	// URL�ڿ� get��� ó�� �����͸� ���ް���
	response.sendRedirect(msg);
%>
