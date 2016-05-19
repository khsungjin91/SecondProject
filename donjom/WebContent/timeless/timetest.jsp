<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


<c:if test="${When == 1}">
  <script type="text/javascript">
    $(document).ready(function(){
    	window.setInterval('callAjax()', 1000); //3초마다한번씩 함수를 실행한다..!! 
    });
    function callAjax(){
    	 $.ajax({
 	        type: "post",
 	        url : "/donjom/timemelee.dj",
 	        success: test,	// 페이지요청 성공시 실행 함수
 	        error: whenError	//페이지요청 실패시 실행함수
      	});
    }
    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $("#ajaxReturn").html(aaa);
    }
    function whenError(){
        alert("Error");
    }
  </script>

	 <div id="ajaxReturn"></div>
</c:if>

<c:if test="${When == 0}">
투자하기????????????
</c:if>

</body>
</html>