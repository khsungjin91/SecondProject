<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="style/css/herb.css" rel="stylesheet">
	<link href="bt/css/bootstrap.min.css" rel="stylesheet">
 	<link href="bt/css/bootstrap-theme.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>도움말</title>
</head>
<body>

<c:forEach var="list" items="${list }">
${list.h_category }
</c:forEach>

	
	
	<div class="container text-left">
	
	<c:forEach var="list" items="${list }">
		
		
		<div class="panel-group col-xs-12 col-sm-8 col-sm-offset-2 tab-content" id="help-box-wrap">
		
		<c:if test="${list.h_category == option1}">
			<div role="tabpanel" class="tab-pane fade active in" id="faq1">
		</c:if>
		
		<c:if test="${list.h_category == option2}">
			<div role="tabpanel" class="tab-pane fade active in" id="faq2">
		</c:if>
		
		<c:if test="${list.h_category == option3}">
			<div role="tabpanel" class="tab-pane fade active in" id="faq3">
		</c:if>
		
		<c:if test="${list.h_category == option4}">
			<div role="tabpanel" class="tab-pane fade active in" id="faq4">
		</c:if>
		
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a href="#list${list.h_no }" 
							
							data-toggle="collapse" data-parent="#accordion" aria-expanded="true">
								
								<span class="txt-point">
								Q  ${list.h_no }.
								
								</span> 
								
								${list.h_subject }
							</a>
						</h4>
					</div>
					<div id="list${list.h_no }" class="panel-collapse collapse" role="tabpanel" aria-expanded="true">
						<div class="panel-body">
							<span class="txt-point">A.</span>
								${list.h_content }						</div>
					</div>
				</div>
				
			</div>
			</div>
			<!-- faq1 end --></c:forEach></div>
			
			
			
			
	
</div>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="bt/js/bootstrap.min.js"></script>
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="bt/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>