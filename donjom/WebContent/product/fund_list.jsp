<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>�����ϱ�</title>
</head>
<body>
<jsp:include page="/WEB-INF/header.jsp"/>

<div class="warpper">
	<div class="container">
		 <section class="content-header">
					 <a href="fundList.dj" type="button" class="btn btn-lg">��ü</a>
					 <a href="fundList.dj?category=b" type="button" class="btn btn-lg">�����</a>
					 <a href="fundList.dj?category=p" type="button" class="btn btn-lg">���νſ�</a>
					 <a href="fundList.dj?category=r" type="button" class="btn btn-lg">�ε���</a>
					 <a href="fundList.dj?category=c" type="button" class="btn btn-lg">�㺸����</a>
		</section>
		
				<hr>
				<div class="content-header">
					<ul class="list-inline text-center">
					<li><h4>�� ${fundcount } ���� ��ǰ�� �ֽ��ϴ�.</h4></li>
					<li><div class="btn-group " >
						<button type="button" class="btn btn-default btn-flat" data-toggle="dropdown" aria-expended="false">
						��ü<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li class="active"><a href="#">��ü <span class="badge bg-aqua">${fundcount}</span></a> </li>
							 <li ><a href="#">��ȯ�� <span class="badge">${refunds}</span></a></li>
							<li><a href="#">��ȯ�Ϸ�<span class="badge bg-green">${overend}</span></a></li>
							<li><a href="#">��ü<span class="badge bg-yellow">0</span></a></li>
							<li><a href="#">�ε�<span class="badge bg-red">${fail}</span></a></li>
							
						</ul>
						</div>
						</li>
						</ul>
					
					<br/>
				
				</div>
				<div class="content-body">
				
				<c:if test="${maincount == 0 }">
				<h2 align="center">��ϵ� ��ǰ�� �����ϴ�.</h2>
				</c:if>
				<c:if test="${maincount != 0 }">
					<c:forEach var="list" items="${list}">
				<div class="col-md-4">
					<div class="box box-solid box-primary ">
					<c:if test="${list.p_success == 'success' || list.p_success == 'refunds' || list.p_success == 'overend'}">
									<div class="title-fin text-center">
									�ݵ����� <br>(${list.p_enddate }) 
									<p style="padding-top:10px;"><a href="fundView.dj?p_code=${list.p_code}" type="button" class="btn btn-lg bg-aqua">�ڼ�������</a></p>
										</div>
									</c:if> 
						<div class="box-header with-border text-center">
						<c:if test="${list.p_category == 'b'}">�����</c:if> 
						<c:if test="${list.p_category == 'c'}">����㺸</c:if> 
						<c:if test="${list.p_category == 'p'}">����</c:if> 
						<c:if test="${list.p_category == 'r'}">�ε���</c:if> 
							
						</div>
						
							<div class="box-body link-aa">
							 
							<a href="fundView.dj?p_code=${list.p_code}"></a>
								
								<div class="title-pr">
								${list.p_name}
								</div>
								<div class="title-pr-con"> <p>${list.p_purpose}</div>
							
								
								<span class="title-con text-green">
								��ǥ ${list.p_price} </span><span class="title"> ����</span> 
								<span class="title-con text-green">�� ${list.p_rate}% </span><span class="title"> ���ͷ�</span>
							
								<ul class="rate text-uppercase">
									<li><span class="text-green"> ${list.p_category}</span> ���� </li>
									<li><span class="text-green">${list.p_term}</span> ����</li>
									<li>��� <span class="text-green"> D1</span></li>
								</ul>
						<div class=" progress progress-sm">
							<div class="progress-bar progress-bar-info" role="progressbar" style="width:${list.p_invest/list.p_price*100}%"></div>
						</div>
						<div class="progress-detail">
							<ul class="list-inline">
								<li><fmt:formatNumber value="${list.p_invest/list.p_price}" type="percent"/>����</li>
								<li>(${list.p_people}��)</li>
								<li><c:if test="${list.p_success == 'doing'}">
										<b class="text-aqua">�ݵ�������</b>
									</c:if> 
									<c:if test="${list.p_success == 'success' || list.p_success == 'refunds' || list.p_success == 'overend'}">
									<span class="">${list.p_enddate }</span>
										<b class="text-green">�ݵ�����</b>
									</c:if> 
									<c:if test="${list.p_success == 'fail'}">
										<b class="text-danger">�ݵ�����</b>
									</c:if></li>
							</ul>
						</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="col-sm-12 text-center">${pagingHtml}</div>
			</c:if>
	
				</div>
		</div>
</div>
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>

</body>
</html>