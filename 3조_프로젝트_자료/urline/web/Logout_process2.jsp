<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
        session.invalidate(); // ��缼������ ����
        response.sendRedirect("/Login.jsp"); // �α��� ȭ������ �ٽ� ���ư���.
    %>