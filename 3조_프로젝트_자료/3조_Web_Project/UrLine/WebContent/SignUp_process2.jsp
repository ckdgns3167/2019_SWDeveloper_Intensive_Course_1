<%@ page contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>
<%-- �ڹٺ� Ŭ���� import --%>
<%@ page import="vo.UserVO"%>
<%-- DAO import --%>
<%@ page import="dao.UserDAO"%>
<%@ page import="dao.Util"%>
<%-- JoinForm.jsp���� �Է��� ������ �Ѱ� �޾� ó���Ѵ�. --%>
    <% 
        // �ѱ� ������ �����ϱ� ���� ���ڵ� ó��
        request.setCharacterEncoding("euc-kr"); 
	    String ctxPath = request.getContextPath();
		// ȸ�� ������ DB�� �־��ֱ� ���� �Է� ������ ������
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
    	
    	
    	if(check==1){// �����Ϸ��� ���̵� ���� ���� ����
    		
    		//db�� ȸ������ commit
    		dao.insertUser("insert into usert values (seq_userno.nextval,?,?,?,?,?,?,?,?,?)",id,pw,emailId,phone,nickName,0,1000,emailDomain,sex);
    		response.sendRedirect(ctxPath + "/Login.jsp");
    	}else if(check==-1){// ���̵� �̹� ������.
    		%>
			<script>
				alert("�̹� �����ϴ� ���̵��Դϴ�. �ٽ� �Է����ּ���.");
				history.go(-1);
			</script>
			<%
			
    	}
    	// sendRedirect(String URL) : �ش� URL�� �̵�
    	// URL�ڿ� get��� ó�� �����͸� ���ް���
        
    %>

