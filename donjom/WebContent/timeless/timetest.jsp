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
    	window.setInterval('callAjax()', 1000); //3�ʸ����ѹ��� �Լ��� �����Ѵ�..!! 
    });
    function callAjax(){
    	 $.ajax({
 	        type: "post",
 	        url : "/donjom/timemelee.dj",
 	        success: test,	// ��������û ������ ���� �Լ�
 	        error: whenError	//��������û ���н� �����Լ�
      	});
    }
    function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
        $("#ajaxReturn").html(aaa);
    }
    function whenError(){
        alert("Error");
    }
  </script>

	 <div id="ajaxReturn"></div>
</c:if>

<c:if test="${When == 0}">
�����ϱ�????????????
</c:if>

</body>
</html>