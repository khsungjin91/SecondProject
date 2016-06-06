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
<script>

function checkprice(){
	
	var f1 = document.userinput;
	var receive = f1.re_price.value;
	var total = ${total}
	
	if(!f1.re_price.value){
		
		alert("ȯ�޾��� �Է����ֽñ� �ٶ��ϴ�.");
		f1.re_price.focus();
		return false;
	}
	
	if(total < receive){
		
		alert("ȯ�ޱݾ��� �ʰ��Ǿ����ϴ�");
		f1.re_price.focus();
		return false;
	}
	
}

</script>

<c:if test="${sessionScope.memId == null }">

<script type="text/javascript">
alert("�α��� �� ��밡���մϴ�.");
window.location="signIn.dj";
</script>

</c:if>

<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<div class="warpper dash-body">
		<div class="container">
			<div class="col-sm-3">
				<div class="text-center">
					<img src="/donjom/save/${mdto.profile}" class="img-circle"
						width="150">
					<p class="user-nick">${mdto.nickname}</p>
					<p>${mdto.email}</p>
					<p>������ ${mdto.join}</p>
					<div class=" hidden-xs">
						<button type="button" class="btn btn-flat bg-orange"
							onclick="location.href='setting.dj'">
							<i class="fa fa-cog"></i> �⺻���� ����
						</button>
					</div>
				</div>
				<hr>
				<ul class=" dash-menu list-unstyled ">
					<li><a href="dashboard.dj"><i
							class="fa fa-fw fa-tachometer fa-lg"></i>��ú���</a></li>
					<li><a href="invest_history.dj"><i
							class="fa fa-fw fa-bar-chart fa-lg"></i>���ڳ���</a></li>
					<li><a href="laon_history.dj"> <i
							class="fa fa-fw fa-tasks fa-lg"></i>���⳻��
					</a></li>
					<li><a href="point_deposit.dj"> <i
							class="fa fa-fw fa-money fa-lg"></i>����/ȯ��
					</a></li>
					<li><a href="notification.dj"> <i
							class="fa fa-fw fa-bullhorn fa-lg"></i>�˸��޼���
					</a></li>
					<li><a href="setting.dj"> <i
							class="fa fa-fw fa-gear fa-lg"></i>����
					</a></li>
				</ul>
			</div>
			<!-- ������ ����ȯ�� ���̾� -->
			<div class="col-sm-12 col-md-8 ">
				<div class="box box-solid panel-body">
					<div class="box-header">
					<ul class="breadcrumb">
					<li><h2 class="box-title">����ȯ��</h2></li>
						<li><a href="point_deposit.dj">����</a></li>
						<li><a href="point_withdrow.dj">ȯ��</a></li>
						<li><a href="point_history.dj">����/ȯ�޳���</a></li>
					</ul>
					</div>
					
					<div class="box-body">
					<h4 class="box-title">�����ϱ�</h4>
					 <h3 class="title-con text-aqua">������ġ��:  <fmt:formatNumber value="${total }" pattern="#,###" />�� </h3>
					 <ul class="list-unstyled text-lineheight">
					 <li><i class="fa fa-check text-olive"></i> ȯ�� ������ : ����</li>
					 <li><i class="fa fa-check text-olive"></i>  ȯ�� �ּ� �ݾ� : 1 ��	 </li>
					 <li><i class="fa fa-check text-olive"></i>  ȯ�� �ִ� �ݾ� (1�� ����) : ������  </li>
					 <li><i class="fa fa-check text-olive"></i>  ȯ�� �ð� : ��û �� �� 20�� �̳��� ������ü <small>(��, ���� �۾��� �������� ������ �ݿ��ݾ��� ��ü�� �� �ֽ��ϴ�.)</small>	 </li>
					 <li><i class="fa fa-check text-olive"></i>ȯ�� ��û�� ������ �޴������� ���ŵ� ȯ�� ��û ���ǹ�ȣ�� Ȯ�� ��, �ش� ��ȣ�� 0000 �������� �亯�ϸ� ȯ���� �Ϸ�˴ϴ�.</li>
					 </ul> 



<c:if test="${dto.socialnum == null && dto.bankaccnum == null}">

-ȯ���� �����Ͻ÷��� ȸ�������� �ʿ��մϴ�.			<br/>
-��õ¡�� �������� �Է��ϼž� ���������� �Ϸ�˴ϴ�.		<br/>
(ȸ������ �Ŀ��� ȯ�� ������ �Ұ��ϴٸ�, �̸��� �Ǵ� ��ȭ�� ���� �ٶ��ϴ�.) <br/>

<input type="button" value="�����Ϸ�����" onclick="javascript:window.location='setting_cert_person.dj'">

</c:if>
<br>
<div class="well">
					<c:if test="${dto.socialnum != null && dto.bankaccnum != null}">
								<form action="point_refunds.dj" method="post" name="userinput">
					
								<dl class="dl-horizontal ">
									<dt>ȯ�ް��ɾ�</dt>
									<dd> ${total}��	</dd>
									<dt>1�� ȯ���ѵ� ���о�</dt>
									<dd>������</dd>
									<dt>ȯ�޾�</dt>
									<dd> <input type="text" name="re_price"/>��	</dd>
									<dt>�����</dt>
									<dd>${dto.bankcode}		</dd>
									<dt>ȯ�ް��¹�ȣ</dt>
									<dd>${dto.bankaccnum}		</dd>
									<dt>������</dt>
									<dd>${dto.name}		</dd>
									</dl>

	<div class="list-inline text-center">		
	<input type="button" value="ȯ�޾˾ƺ���" onclick="" class="btn btn-default btn-lg disabled">			
<input type="submit" value="ȯ���ϱ�" onclick="return checkprice()" class="btn btn-lg bg-green">	
</div>						
</form>

	
	
</c:if>	
</div>
				</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>