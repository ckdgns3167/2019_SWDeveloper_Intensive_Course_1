<%@ page import="com.urline.dao.Util" %>
<%@ page import="com.urline.dao.UserDAO" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>

<%
	// �ѱ� ������ �����ϱ� ���� ���ڵ� ó��
	request.setCharacterEncoding("euc-kr");
	String ctxPath = request.getContextPath();

	// ȸ�� ������ DB�� �־��ֱ� ���� �Է� ������ ������
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String nickName = request.getParameter("nickname");
	Integer sex = Util.parseInt(request.getParameter("sex"));
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");

	UserDAO dao = UserDAO.getInstance();
	//db�� ȸ������ commit
	dao.insertUser("insert into usert values (seq_userno.nextval,?,?,?,?,?,?,?,?,?)", id, pw, email, phone,
			nickName, 0, 1000, sex, name);
	response.sendRedirect(ctxPath + "/Login.jsp");
%>

