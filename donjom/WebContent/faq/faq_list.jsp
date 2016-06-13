<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>


<title>도움말</title>
</head>
<body>
<jsp:include page="/WEB-INF/header.jsp" />
	<div class="container">
		<div class="box-header">
		<h3 class="text-center">도움말</h3>
		</div>
	
		<ul class="list-inline text-center">
			<li><a href="help_faq.dj?h_category=공통" type="radio" class="btn btn-lg bg-navy">공통</a></li>
			<li><a href="help_faq.dj?h_category=투자" type="button" class="btn btn-lg bg-navy">투자</a></li>
			<li><a href="help_faq.dj?h_category=대출" type="button" class="btn btn-lg bg-navy">대출</a></li>
			<li><a href="help_faq.dj?h_category=계정" type="button" class="btn btn-lg bg-navy">계정</a></li>
		</ul>
		
		<div class="col-sm-12 col-sm-offset-3">
		<div class="col-sm-6" id="accordion">
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
	</div>
	<jsp:include page="/WEB-INF/footer.jsp" />
</body>
</html>