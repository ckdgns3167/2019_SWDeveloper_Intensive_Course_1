<%@ page import="com.urline.dao.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String ctxPath = request.getContextPath();
    String id = session.getAttribute("userId").toString();
    String pw3 = request.getParameter("pw3");

    // URL 및 로그인관련 전달 메시지
    String msg = "";

    // DB에서 아이디, 비밀번호 확인
    UserDAO dao = UserDAO.getInstance();
    int type = dao.ID_PW_Check(id, pw3);

    if (type == 1 || type == 2) // 아이디와 비밀번호가 짝이 맞으면..
    {
        //회원 탈퇴 절차가 진행됨
        // DB에서 이 사용자에 관한 데이터가 모두 사라지게 함.
        // 그리고 로그아웃 되고 메인 화면으로 화면 전환.
        try {
            dao.deleteUser("DELETE FROM usert WHERE id = ?", id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.invalidate(); // 모든세션정보 삭제
        msg = ctxPath + "/UserWithdrawalSuccess.jsp";

        // sendRedirect(String URL) : 해당 URL로 이동
        // URL뒤에 get방식 처럼 데이터를 전달가능
        response.sendRedirect(msg);
    } else if (type == 0) // 비밀번호가 틀릴경우
    {
        %>
            <script>
                alert("비밀번호가 올바르지 않습니다.\n다시 입력해주세요.");
                history.go(-1);
            </script>
        <%
    }

%>