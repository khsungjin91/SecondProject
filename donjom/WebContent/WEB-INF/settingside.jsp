<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.PreparedStatement"%>
<%@ page import = "java.sql.ResultSet"%>
<%@ page import = "point.bean.PointDto" %>
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
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@masterkh.iptime.org:7000:orcl","donjom","donjom");
 
    PreparedStatement pstmt = null;
    
    ResultSet rs = null;
    												
 	String email = (String)session.getAttribute("memId");
 	String profile = "";
 	long total = 0;
 	int no = 0;
 	String join ="";
 	String nickname="";
 	PointDto dto = new PointDto();
 	
	if(session.getAttribute("memId") != null){
		
		pstmt = conn.prepareStatement("select no,nickname,join,profile from member where email=?");
		pstmt.setString(1, email);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			no = rs.getInt("no");
			nickname = rs.getString("nickname");
			join = rs.getString("join");
			profile = rs.getString("profile");		
		}
		
		pstmt = conn.prepareStatement("select total_ch,total_re from memprice where no=?");
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			
			long total_ch = rs.getLong("total_ch");
			long total_re = rs.getLong("total_re");
			
			total = total_ch - total_re;
		}
		
		if(rs != null){try{rs.close();}catch(Exception e){e.printStackTrace();}}
		if(pstmt != null){try{pstmt.close();}catch(Exception e){e.printStackTrace();}}
		if(conn != null){try{conn.close();}catch(Exception e){e.printStackTrace();}}
	
	}
%>

<!-- warp시작 -->
		<div class="col-sm-3">
			<div class="text-center">	
			<%if(profile == null){ %>
			
			<img src="image/default.jpg" class="img-circle" width="150"  >
			
			<%}else{ %>
						
				<img src="/donjom/save/<%=profile %>" class="img-circle" width="150"  >
			
				<%} %>
				<p class="user-nick"><%=nickname %>	</p>
				<p ><%=email %></p>
				<p >가입일  <%=join %></p>
				<div class=" hidden-xs">
					<button type="button" class="btn btn-flat bg-orange" onclick="location.href='setting.dj'"><i class="fa fa-cog"></i> 기본정보 수정</button>
				</div>
			</div>
			<hr>
			<ul class=" dash-menu list-unstyled ">
				<li ><a href="dashboard.dj"><i class="fa fa-fw fa-tachometer fa-lg"></i>대시보드</a></li>
				<li><a href="invest_history.dj"><i class="fa fa-fw fa-bar-chart fa-lg"></i>투자내역</a></li>
				<li><a href="laon_history.dj">
				<i class="fa fa-fw fa-tasks fa-lg"></i>대출내역</a></li>
				<li><a href="point_deposit.dj">
				<i class="fa fa-fw fa-money fa-lg"></i>충전/환급</a></li>
				<li><a href="notification.dj">
				<i class="fa fa-fw fa-bullhorn fa-lg"></i>알림메세지</a></li>
				<li><a href="setting.dj">
				<i class="fa fa-fw fa-gear fa-lg"></i>설정</a></li>
			</ul>
		</div>
</body>
</html>