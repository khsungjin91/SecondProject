<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
 	<title>��ú���</title>
 	<c:if test = "${sessionScope.memId == null}">
 	<script type="text/javascript">
 		window.location="signIn.dj";
 	</script>
 	</c:if>
</head>
<body>

	<section class="profile-detail">
	<div class="container profile-wrap">
		<div class="col-sm-3 mobile-profile-nav">
			<div class="user-info text-center radius">						
				<img src="/donjom/save/${dto.profile}" class="img-circle" width="150"  >
				<p class="name txt-cut-line user-nick">${dto.nickname}	</p>
				<p class="email txt-cut-line">${dto.email}</p>
				<p class="date">������  ${dto.join}</p>
				<div class="btn-profile-edit hidden-xs">
					<button type="button" class="btn btn-success" onclick="location.href='setting.dj'"><i class="fa fa-cog"></i> �⺻���� ����</button>
				</div>
			</div>
			<ul class="menu menu-dashboard radius">
				<li class="dashboard"><a href ="dashboard.dj" class="active"><span class="glyphicon glyphicon-dashboard"></span> ��ú���</a></li>
				<li class="invest"><a href="invest_history.dj" class=""> ���ڳ���</a></li>
				<li class="lend"><a href="laon_history.dj" class=""> ���⳻��</a></li>
				<li class="moeny"><a href="point_deposit.dj" class=""> ����/ȯ��</a></li>
				<li class="moeny hidden-xs"><a href="notification.dj" class="">�˸� �޼���</a></li>
				<li class="setting"><a href="setting.dj" class="">����</a></li>
			</ul>
		</div>
		
		<div class="col-xs-12 col-sm-9 contents-warp right">
			
			
			<!-- ���� -->
			<div class="col-sm-12 col-md-8 contents-left">
				<!-- ���ڿ�� -->
				<div class="panel panel-default contents">
					<div class="panel-heading">
					<h3 class="panel-title">���ڿ��</h3>
					</div>
					<div class="panel-body">
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
				<div class="panel panel-default contents">
					<div class="panel-heading">
					<h3 class="panel-title">������</h3>
					</div>
					<div class="panel-body">
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
				<div class="panel panel-default contents contents-right">
					<div class="panel-heading">
						<h3 class="panel-title">������� ����</h3>
					</div>
					<div class="panel-body body-margin-bank text-center">
						<c:if test = "${infodto.randomacc == null}">
						<button class="btn deposit" onclick="location.href='setting_cert_person.dj'">������� �����ϱ�</button>							
						</c:if>
						<c:if test = "${infodto.randomacc != null}">
						${infodto.randomacc}
						</c:if>
					</div>
				</div>
				<!-- //����������� -->
                                          
                <!-- �˸� �޼��� -->
				<div class="panel panel-default contents contents-right">
					<div class="panel-heading">
					<h3 class="panel-title">�˸� �޼���<a class="btn-box-more radius right" href="notification.dj">������</a></h3>
					</div>
					<div class="panel-body timeline timeline-off">
					<c:if test="${count == 0 }">
					    <div class="timeline-off-box"><span>�޼����� �����ϴ�.</span></div>
					</c:if>
					<c:if test="${count != 0 }">
						<c:forEach var="list" items="${list}">
							<div>${list.m_content}</div>
							<div>${list.m_time}</div>
						</c:forEach>	
					</c:if>
					</div>
					</div>
				<!-- //�˸� �޼��� -->	
			</div>
			<!-- ���� -->		
		</div>
</div>		
</section>
</body>
</html>