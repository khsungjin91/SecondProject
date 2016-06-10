<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 	<title>��ú���</title>
 	<c:if test = "${sessionScope.memId == null}">
 	<script type="text/javascript">
 		window.location="signIn.dj";
 	</script>
 	</c:if>
</head>
<body >
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>


	<div class="warpper dash-body">
	<div class="container">
	<jsp:include page="/WEB-INF/settingside.jsp"/>
		<div class="col-xs-12 col-sm-9 contents-warp right">
			
			
			<!-- ���� -->
			<div class="col-sm-12 col-md-8 contents-left">
				<!-- ���ڿ�� -->
				<div class="box box-solid box-primary">
					<div class="box-header">
					<h3 class="box-title">���ڿ��</h3>
					</div>
					<div class="box-body">
						<ul class="col-xs-6">
							<li> 
								<p class="title-edge">���� ���ڱ�</p>
							    <p class="title-other">0��</p>
							</li>
							<li class="line">
								<p>���� ���� ȸ����<span>0��</span></p>
							</li>
							<li class="line">
								<p>���� ���� ȸ�� ����<span>0��</span></p>
							</li>
							<li class="line">
								<p>���� ���ͱ�<span>0��</span></p>
							</li>
							<li>
								<p>�ܿ� ��ȯ ����<span>0��</span></p>
							</li>
						</ul>
						<ul class="col-xs-6 table-wrap">
						    <li>
						        <p class="title-edge">��� ���ͷ�(��)</p>
							    <p class="title-other">0.00%</p>
						    </li>
							<li class="line">
								<p>��ȯ���� ����<span>0��</span></p>
							</li>
							<li class="line">
								<p>��ȯ �Ϸ�� ����<span>0��</span></p>
							</li>
							<li class="line">
								<p>��ü �Ǽ�<span>0��</span></p>
							</li>
							<li>
								<p>ä�� �߻� �Ǽ�<span>0��</span></p>
							</li>
						</ul>
					</div>
				</div>
				<!-- //���ڿ�� -->
									
				<!-- ������ -->
				<div class="box box-solid box-primary ">
					<div class="box-header">
					<h3 class="box-title">������</h3>
					</div>
					<div class="box-body">
						<ul class="col-xs-6">
							<li>
								<p class="title-edge">���� �����</p>
								<p class="title-other">0��</p>
							</li>
							<li class="line">
								<p>���� ���� ��ȯ��<span>0��</span></p>
							</li>
							<li class="line">
								<p>���� ���ڱ�<span>0��</span></p>
							</li>
							<li>
								<p>�ܿ� ��ȯ ����<span>0��</span></p>
							</li>
						</ul>
						<ul class="col-xs-6 table-wrap">
							<li>
								<p class="title-edge">��� ������(��)</p>
								<p class="title-other">0.00%</p>
							</li>
							<li class="line">
								<p>��ȯ���� ����<span>0��</span></p>
							</li>
							<li class="line">
								<p>��ȯ �Ϸ�� ����<span>0��</span></p>
							</li>
							<li class="line">
								<p>��ü �Ǽ�<span>0��</span></p>
							</li>
							<li>
								<p>ä�� �߻� �Ǽ�<span>0��</span></p>
							</li>
						</ul>

					</div>
				</div>
				<!-- //������ -->		
			</div>
			<!-- //����-->	
			<!-- ���� -->
			<div class="col-sm-12 col-md-4 contents-aside">
				<!-- ����������� -->
				<div class="box box-solid box-primary contents contents-right">
					<div class="box-header">
						<h3 class="box-title">������� ����</h3><div class="box-tools"><a class="btn btn-sm" href="point_deposit.dj" type="button">ȯ���ϱ�</a></div>
					</div>
					<div class="box-body body-margin-bank text-center">
						<c:if test = "${infodto.randomacc == null}">
						<button class="btn deposit" onclick="location.href='setting_cert_person.dj'">������� �����ϱ�</button>							
						</c:if>
						<c:if test = "${infodto.randomacc != null}">
						<div>���� ��ġ��</div>
						<div class="title-con"> <fmt:formatNumber value="${total }" pattern="#,###" />��</div> 
						������ ${infodto.name} 
						<hr>
						${infodto.bankcode} ${infodto.randomacc}
						</c:if>
					</div>
				</div>
				<!-- //����������� -->
                                          
                <!-- �˸� �޼��� -->
				<div class="box box-solid  box-primary ">
					<div class="box-header">
					<h3 class="box-title">�˸� �޼���</h3><div class="box-tools"><a class="btn btn-sm" href="notification.dj" type="button">������</a></div>
					</div>
					<div class="box-body">
					<c:if test="${count == 0 }">
					    <div class="timeline-off-box"><span>�޼����� �����ϴ�.</span></div>
					</c:if>
					
					 <ul class="timeline">
					 
					 	<li>
					 		<div class="timeline-item">
					 		<c:if test="${count != 0 }">
						<c:forEach var="list" items="${list}">
					 		
					 			<div class="timeline-body">${list.m_content}</div>
					 				<span class="time">
					 			<fmt:parseDate var="dateString" value="${list.m_time}" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate value="${dateString}" pattern="yy.MM.dd HH:mm" /></span>
					 			</c:forEach>	
					</c:if>
					 		</div>
					 	</li>
					 </ul>
					
					</div>
					</div>
				<!-- //�˸� �޼��� -->	
			</div>
			<!-- ���� -->		
		</div>
</div>		
</div><!-- container end -->
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
</body>
</html>