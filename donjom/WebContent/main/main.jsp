<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="style/css/herb.css" rel="stylesheet">
	<link href="bt/css/bootstrap.min.css" rel="stylesheet">
 	<link href="bt/css/bootstrap-theme.min.css" rel="stylesheet">
<title>main page</title>
</head>
<body>

   <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><img alt="brand" src="../image/brand.png"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="loan_step1.dj" ><b>����JOM</b></a></li>
			<li><a href="fundList_total.dj" ><b>����JOM</b></a></li>
			<li><a href="DJlive.dj" ><b>����JOM</b></a></li>
			<li><a href="ex.dj" ><b>����JOM</b></a></li>
			<li><a href="DJcalculator.dj" data-target="#mymodal"><b>����JOM</b></a></li>
        
          </ul>
          <ul class="nav navbar-nav navbar-right">	
			<c:if test="${sessionScope.memId == null}">
			<li><a href="signUp.dj">ȸ������</a></li>
			<li><a href="signIn.dj">�α���</a></li>
			</c:if>
			<c:if test="${sessionScope.memId != null}">
			<li>�˸�</li>
			<li>��ġ�� ${total}��</li>
			<li>
				<ul>
				<li>������</li>	
				<li><a href="dashboard.dj">��ú���</a></li>
				<li><a href="invest_history.dj">���ڳ���</a></li>
				<li><a href="laon_history.dj">���⳻��</a></li>
				<li><a href="point_deposit.dj">����/ȯ��</a></li>
				<li><a href="notification.dj">�˸��޼���</a></li>
				<li><a href="setting.dj">����</a></li>
				<li><a href="helf.dj">����</a></li>	
				<li><a href="logout.dj">�α׾ƿ�</a></li>			
				</ul>
			</li>	
			</c:if>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>



<%-- �߰��޴� --%>
<div class="jumbotron">
	<div id="top_menu">
	
���ι���
<ul>
<li><a href="dashboard.dj" >��ú���</a></li>
<li><a href="invest_history.dj" >���ڳ���</a></li>
<li><a href="point_deposit.dj">����/ȯ��</a></li>
<li><a href="press.dj" >��б��</a></li>
<li><a href="/guide/loan.dj" >����ȳ�</a></li>
<li><a href="/guide/invest.dj" >���ھȳ�</a></li>

</ul>

<%-- ����� �ε� ���� --%>

<table>
<tr>
<td>���������(��)</td><td>���� �����</td><td>���� ��ȯ��</td><td>�ε��� </td>
</tr>
<tr>
<%-- 
<td>${avgiza}</td><td>${totalloan}</td><td>${totalgive}</td><td>${break}</td>
--%>
</tr>
</table>

 </div>
   </div>
<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="image/main-bn.jpg" alt="...">
						<div class="caption">
							<h3>��������</h3>

							<p>'����'���� ���ڴ� �ű� �����ڸ� ���� ü���� ���� ��ǰ�Դϴ�. ����Ⱓ, ������, ��ȯ��� ������ ����</p>
						<p class="money">
							��ǥ 7,000
							<span class="txt-sub">����</span>
							<span class="txt-point">�� 12.80%</span>
							<span class="txt-sub">���ͷ�</span>
						</p>
						
						
						</div>
							<div class="progress">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="80" aria-valuemin="0"
									aria-valuemax="100" style="width: 40%">
									<span class="sr-only">80% Complete (success)</span>
								</div>
								
							</div>
							<div class="progress-detail">
						<p>
						<span class="txt-point">80%</span>
						����
						<span class="progress-invest-people">(34��)</span>
						</p>
						<p class="d-day">
						<span class="txt-point">D-6��</span>
						</p>
						</div>
					</div>
				</div>
				
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="image/main-bn.jpg" alt="...">
						<div class="caption">
							<h3>��������</h3>

							<p>'����'���� ���ڴ� �ű� �����ڸ� ���� ü���� ���� ��ǰ�Դϴ�. ����Ⱓ, ������, ��ȯ��� ������ ����</p>
						<p class="money">
							��ǥ 7,000
							<span class="txt-sub">����</span>
							<span class="txt-point">�� 12.80%</span>
							<span class="txt-sub">���ͷ�</span>
						</p>
						
						
						</div>
							<div class="progress">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100" style="width: 40%">
									<span class="sr-only">40% Complete (success)</span>
								</div>
								
							</div>
							<div class="progress-detail">
						<p>
						<span class="txt-point">50%</span>
						����
						<span class="progress-invest-people">(34��)</span>
						</p>
						<p class="d-day">
						<span class="txt-point">D-6��</span>
						</p>
						</div>
					</div>
				</div>
		
		
		<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<img src="image/main-bn.jpg" alt="...">
						<div class="caption">
							<h3>��������</h3>

							<p>'����'���� ���ڴ� �ű� �����ڸ� ���� ü���� ���� ��ǰ�Դϴ�. ����Ⱓ, ������, ��ȯ��� ������ ����</p>
						<p class="money">
							��ǥ 7,000
							<span class="txt-sub">����</span>
							<span class="txt-point">�� 12.80%</span>
							<span class="txt-sub">���ͷ�</span>
						</p>
						
						
						</div>
							<div class="progress">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100" style="width: 40%">
									<span class="sr-only">40% Complete (success)</span>
								</div>
								
							</div>
							<div class="progress-detail">
						<p>
						<span class="txt-point">50%</span>
						����
						<span class="progress-invest-people">(34��)</span>
						</p>
						<p class="d-day">
						<span class="txt-point">D-6��</span>
						</p>
						</div>
					</div>
				</div>
		


<%-- �ݵ��޴� --%>
�ݵ��� ������ ���� �ݵ���ǰ�� ���� ����
<br/>
<c:forEach var="mainlist" items="${mainlist}">


</c:forEach>
<br/>

<%-- ��Ÿ���� --%>

������ �����̵� ������ script �����ϸ� �ϱ�
�ȵǸ� �ִ� 4��
<br/>
<c:forEach var="guidelist" items="${guidelist}">

</c:forEach>
<br/>

<%-- ���� ��� --%>

��� �� DJ
������ �����̵� ������ script �����ϸ� �ϱ�
<br/>
<c:forEach var="newslist" items="${newslist}">


</c:forEach>
<br/>

DJ��ǥ�����
������ �����̵� ������ script �����ϸ� �ϱ�
<br/>
<c:forEach var="newslist" items="${newslist}">


</c:forEach>
<br/>

<%-- �����޴� --%>
<a href="compony.dj">ȸ��Ұ�</a>
<a href="/terms/agreement.dj">�̿���</a>
<a href="/terms/privacy_policy.dj">����������޹�ħ</a>
<a href="/terms/useinvest.dj">�����̿���</a>
<a href="interview.dj">���ͺ�</a>
<a href="notice.dj">��������</a>
<a href="help.dj">����</a>

<%-- ������ȸ������ --%>



<%-- sns���� �� ��밡���� sns --%>




<!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
    <script src="../bt/js/bootstrap.min.js"></script>
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../bt/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>