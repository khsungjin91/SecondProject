<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
<title>도움말</title>
</head>
<body>

	<div class="container">
	<div class="box ">
		<ul>
			<li><a href="help_faq.dj?h_category=all" type="button" class="btn btn-lg">공통</a></li>
			<li><a href="help_faq.dj?h_category='투자'" type="button" class="btn btn-lg">투자</a></li>
			<li><a href="help_faq.dj?h_category=공통" type="button" class="btn btn-lg">공통</a></li>
			<li><a href="help_faq.dj?h_category=공통" type="button" class="btn btn-lg">공통</a></li>
			
			
		</ul>
	</div>
		<div class="col-sm-8" id="accordion">
			<c:forEach var="list" items="${list }">
				<div class="panel panel-success">
					<div class="panel-heading ">
						<h4 class="panel-title">
							<a href="#list${list.h_no }" data-toggle="collapse" data-parent="#accordion" aria-expanded="true"> 
							<span class="txt-point">Q ${list.h_no }.</span> 
							${list.h_subject }
							</a>
						</h4>
					</div>
					<div id="list${list.h_no }" class="panel-collapse collapse" role="tabpanel" aria-expanded="true">
						<div class="panel-body">
							<span class="txt-point">A.</span> 
							${list.h_content }
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>