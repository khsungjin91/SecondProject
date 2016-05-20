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


<title>welcome to DonJom</title>

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
          <a class="navbar-brand" href="#"><img alt="brand" src="image/brand.png"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="loan.dj" >����JOM</a></li>
			<li><a href="fundList_total.dj" >����JOM</a></li>
			<li><a href="DJlive.dj" >����JOM</a></li>
			<li><a href="DJex.dj" class="hidden-sm" >����JOM</a></li>
			<li><a href="DJcalculator.dj" class="hidden-sm" data-target="#mymodal">���ڰ���</a></li>
        
          </ul>
           <c:if test="${sessionScope.memId == null}">
          <ul class="nav navbar-nav navbar-right">
           	<li><a href="signUp.dj">ȸ������</a></li>
			<li><a href="signIn.dj">�α���</a></li>
          </ul>
          </c:if>
         <c:if test="${sessionScope.memId != null}">
            
            <ul class="nav navbar-nav navbar-right">
             <li><a href="">
             <i class="fa fa-bell fa-lg" aria-hidden="true"></i></a>
           </li>
             <li><a href="#" class="hidden-sm">��ġ�� 0��</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
          ${memId}<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="dashboard.dj">��ú���</a></li>
            <li><a href="">���⳻��</a></li>
            <li><a href="#">���ڳ���</a></li>
            <li><a href="point_deposit.dj">����/ȯ��</a></li>
            <li><a href="#">�˸��޼���</a></li>
            <li><a href="setting.dj">����</a></li>
            
            <li class="divider"></li>
            <li><a href="#">����</a></li>
            <li><a href="logout.dj">�α׾ƿ�</a></li>
          </ul>
        </li>
          </ul>
          </c:if>
      </div><!--/.nav-collapse -->
   
      </div>
    </nav>



<div class="jumbotron">
	<div id="mcontent" style="background-image:url(image/main-bn.jpg)">

			<div class="container">
				<div class="row">
				<div class="col-md-6">
					<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	
	<!--������-->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!--������-->

	<div class="carousel-inner">
		<!--�����̵�1-->
		<div class="item active"> 
			<img src="image/con-1.jpg" style="width:100%; height: 240px;" alt="First slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 1</h1>
					<p>�ؽ�Ʈ 1</p>
				</div>
			</div>
		</div>
		<!--�����̵�1-->

		<!--�����̵�2-->
		<div class="item"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w02.jpg" style="width:100%" data-src="" alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 2</h1>
					<p>�ؽ�Ʈ 2</p>
				</div>
			</div>
		</div>
		<!--�����̵�2-->
		
		<!--�����̵�3-->
		<div class="item"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg" style="width:100%" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 3</h1>
					<p>�ؽ�Ʈ 3</p>
				</div>
			</div>
		</div>
		<!--�����̵�3-->
	</div>
	
	<!--����, ���� ��ư-->
	<!-- <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
	<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>  -->
</div>





					</div>
				<div class="col-md-6">	
		
		<ul class="list-inline">
			<li><a href="dashboard.dj">
			<img src="image/icon/1463134285_speedometer.png"><br>��ú���</a></li>
			<li><a href="invest.history.dj"><img src="image/icon/1463134252_trends.png" ><br>���ڳ���</a></li>
			<li><a href="point.dj"><img src="image/icon/1463134258_money.png" ><br>����/ȯ��</a></li>
			</ul>
			
			<ul class="list-inline">
			
			<li><a href="press.dj"><img src="image/icon/1463134237_clipboard.png" ><br>��б��</a></li>
			<li><a href="/guide/loan.dj"><img src="image/icon/1463134285_speedometer.png" ><br>����ȳ�</a></li>
			<li><a href="/guide/invest.dj"><img src="image/icon/1463134285_speedometer.png" ><br>���ھȳ�</a></li>
		</ul>
		</div>
					</div>
				</div>
			</div><!-- product end -->
			
	
	</div>
		<table>
			<tr>
				<td>���������(��)</td>
				<td>���� �����</td>
				<td>���� ��ȯ��</td>
				<td>�ε���</td>
			</tr>
			<tr>
				
				<%-- 
<td>${avgiza}</td><td>${totalloan}</td><td>${totalgive}</td><td>${break}</td>
--%>
			</tr>
		</table>
</div>

	<div class="col-sm-6 col-md-4">
		<h4>
			�ε���<a href="#">�ڼ�������</a>
		</h4>
		<div class="thumbnail">
			<div id="thum_image" class="img-rounded" style="background-image: url(image/con-2.jpg)">
				<h4>�ݵ�����</h4>
				<br>(5�� �ҿ�)
			</div>
			<div class="caption">
				<h3>��������</h3>
				<p>'����'���� ���ڴ� �ű� �����ڸ� ���� ü���� ���� ��ǰ�Դϴ�. ����Ⱓ, ������, ��ȯ��� ������ ����</p>
				<p class="money">
					��ǥ 7,000 <span class="txt-sub">����</span> <span class="txt-point">��
						12.80%</span> <span class="txt-sub">���ͷ�</span>
				</p>
			</div>

			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
					style="width: 100%">
					<span class="sr-only">success</span>
				</div>

			</div>
			<div class="progress-detail">
				<p>
					<span class="txt-point">100%</span> ���� 
					<span class="progress-invest-people">(34��)</span>
				</p>
				<p class="d-day">
					<span class="txt-point">D-6��</span>
				</p>
			</div>
		</div>
	</div>
	<div class="col-sm-6 col-md-4">
		<h4>
			�ε���<a href="#">�ڼ�������</a>
		</h4>
		<div class="thumbnail">
			<div id="thum_image" class="img-rounded" style="background-image: url(image/con-2.jpg)">
				<h4>�ݵ�����</h4>
				<br>(5�� �ҿ�)
			</div>
			<div class="caption">
				<h3>��������</h3>
				<p>'����'���� ���ڴ� �ű� �����ڸ� ���� ü���� ���� ��ǰ�Դϴ�. ����Ⱓ, ������, ��ȯ��� ������ ����</p>
				<p class="money">
					��ǥ 7,000 <span class="txt-sub">����</span> <span class="txt-point">��
						12.80%</span> <span class="txt-sub">���ͷ�</span>
				</p>
			</div>

			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
					style="width: 100%">
					<span class="sr-only">success</span>
				</div>

			</div>
			<div class="progress-detail">
				<p>
					<span class="txt-point">100%</span> ���� 
					<span class="progress-invest-people">(34��)</span>
				</p>
				<p class="d-day">
					<span class="txt-point">D-6��</span>
				</p>
			</div>
		</div>
	</div>
	<div class="col-sm-6 col-md-4">
		<h4>
			�ε���<a href="#">�ڼ�������</a>
		</h4>
		<div class="thumbnail">
			<div id="thum_image" class="img-rounded" style="background-image: url(image/con-2.jpg)">
				<h4>�ݵ�����</h4>
				<br>(5�� �ҿ�)
			</div>
			<div class="caption">
				<h3>��������</h3>
				<p>'����'���� ���ڴ� �ű� �����ڸ� ���� ü���� ���� ��ǰ�Դϴ�. ����Ⱓ, ������, ��ȯ��� ������ ����</p>
				<p class="money">
					��ǥ 7,000 <span class="txt-sub">����</span> <span class="txt-point">��
						12.80%</span> <span class="txt-sub">���ͷ�</span>
				</p>
			</div>

			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
					style="width: 100%">
					<span class="sr-only">success</span>
				</div>

			</div>
			<div class="progress-detail">
				<p>
					<span class="txt-point">100%</span> ���� 
					<span class="progress-invest-people">(34��)</span>
				</p>
				<p class="d-day">
					<span class="txt-point">D-6��</span>
				</p>
			</div>
		</div>
	</div>
		<%-- �ݵ��޴� --%>
		
		<div id="funding">
		<div class="owl-carousel">
    <div class="item"><h4>1</h4></div>
    <div class="item"><h4>2</h4></div>
    <div class="item"><h4>3</h4></div>
    <div class="item"><h4>4</h4></div>
    <div class="item"><h4>5</h4></div>
    <div class="item"><h4>6</h4></div>
    <div class="item"><h4>7</h4></div>
    <div class="item"><h4>8</h4></div>
    <div class="item"><h4>9</h4></div>
    <div class="item"><h4>10</h4></div>
    <div class="item"><h4>11</h4></div>
    <div class="item"><h4>12</h4></div>
</div>
		�ݵ��� ������ ���� �ݵ���ǰ�� ���� ���� <br />
		<c:forEach var="mainlist" items="${mainlist}">


		</c:forEach>
		<br />

	</div>
		
		<%-- ��Ÿ���� --%>
<div id="guide">
������ �����̵� ������ script �����ϸ� �ϱ�
�ȵǸ� �ִ� 4��
<br/>
<c:forEach var="guidelist" items="${guidelist}">

</c:forEach>
<br/>


</div>

<%-- ���� ��� --%>

<div id="news">
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
</div>


<%-- �����޴� --%>
<footer>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 company-link">
				<a href="compony.dj">ȸ��Ұ�</a>
				<a href="/terms/agreement.dj">�̿���</a>
				<a href="/terms/privacy_policy.dj">����������޹�ħ</a>
				<a href="/terms/useinvest.dj">�����̿���</a>
				<a href="interview.dj">���ͺ�</a>
				<a href="notice.dj">��������</a>
				<a href="help.dj">����</a>

			</div>
		</div>
		
		<div class="row company-info">
			<div class="col-xs-12 col-sm-4">
				<h5>(��)����</h5>
				<p>��ǥ�̻� : ������, �ڼ���, ���ֿ�, ������, ������</p>
				<p>����ڵ�Ϲ�ȣ 533-86-00012</p>
				
			</div>
		</div>
	</div>
	
	
</footer>


</body>
</html>