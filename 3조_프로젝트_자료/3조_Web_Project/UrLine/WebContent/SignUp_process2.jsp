<%@ page contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>
<%-- 자바빈 클래스 import --%>
<%@ page import="vo.UserVO"%>
<%-- DAO import --%>
<%@ page import="dao.UserDAO"%>
<%@ page import="dao.Util"%>
<%-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
    <% 
        // 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("euc-kr"); 
	    String ctxPath = request.getContextPath();
		// 회원 정보를 DB에 넣어주기 위해 입력 값들을 가져옴
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nickName = request.getParameter("nickName");
		Integer sex = Util.parseInt(request.getParameter("sex"));
		String emailId = request.getParameter("emailId");
		String emailDomain = request.getParameter("emailDomain");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1+'-'+phone2+'-'+phone3;
    %>    
    
    <%
    	UserDAO dao = UserDAO.getInstance();
    	int check = dao.joinCheck(id);
    	
    	
    	if(check==1){// 가입하려는 아이디가 존재 하지 않음
    		
    		//db에 회원정보 commit
    		dao.insertUser("insert into usert values (seq_userno.nextval,?,?,?,?,?,?,?,?,?)",id,pw,emailId,phone,nickName,0,1000,emailDomain,sex);
    		response.sendRedirect(ctxPath + "/Login.jsp");
    	}else if(check==-1){// 아이디가 이미 존재함.
    		%>
			<script>
				alert("이미 존재하는 아이디입니다. 다시 입력해주세요.");
				history.go(-1);
			</script>
			<%
			
    	}
    	// sendRedirect(String URL) : 해당 URL로 이동
    	// URL뒤에 get방식 처럼 데이터를 전달가능
        
    %>

