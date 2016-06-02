<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@masterkh.iptime.org:7000:orcl","java10","java10");
	PreparedStatement pstmt =null;
	ResultSet rs=null;
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	int count = 0;
	int x =2;
	String dbpw = "out";
		
	pstmt= conn.prepareStatement("select count(id) from djdj  where id=? ");
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){		
		 count =rs.getInt(1);
	}
	
		if(count == 1){
			
			pstmt=conn.prepareStatement("select pw from djdj");
			rs=pstmt.executeQuery();
			if(rs.next()){
				
				dbpw = rs.getString(1);
				
				if(pw.equals(dbpw)){
					session.setAttribute("adminId", id);
					x=1;
				}else{
					x=0;
				}
			}
		}
		
if(x == 2){%>
<script>
	alert("침입자 입니까?");
	history.go(-1);
</script>

<%}else if(x == 1){%>
<script>
	window.location="admin_login.dj";
</script>

<%}else if(x == 0){%>
<script>
	alert("해킹할라고?");
	history.go(-1);
</script>
<%}%>







</body>
</html>