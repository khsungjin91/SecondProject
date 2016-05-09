<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../style/css/herb.css" rel="stylesheet">
	<link href="../bt/css/bootstrap.min.css" rel="stylesheet">
 	<link href="../bt/css/bootstrap-theme.min.css" rel="stylesheet">
 	<title>��ú���</title>
</head>
<body>
	<section class="profile-detail">
	<div class="container profile-wrap">
		<div class="col-sm-3 mobile-profile-nav">
			<div class="user-info text-center radius">						
				<img src="../image/default.png" class="radius-circle" width="75"  >
				<p class="name txt-cut-line user-nick">User Name</p>
				<p class="email txt-cut-line">user@donjom.net</p>
				<p class="date">������ 16.04.20</p>
				<div class="btn-profile-edit hidden-xs">
					<button type="button" class="btn" onclick="location.href='/profile/setting'"><i class="fa fa-cog"></i> �⺻���� ����</button>
				</div>
			</div>
			<ul class="menu menu-dashboard radius">
				<li class="dashboard"><a href="dashboard.dj" class="active"><span class="glyphicon glyphicon-dashboard"></span> ��ú���</a></li>
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
						<button class="btn deposit" onclick="location.href='../profile/point.jsp'">������� �����ϱ�</button>							
					</div>
				</div>
				<!-- //����������� -->
                                          
                <!-- �˸� �޼��� -->
				<div class="panel panel-default contents contents-right">
					<div class="panel-heading">
					<h3 class="panel-title">�˸� �޼���<a class="btn-box-more radius right" href="/profile/notification">������</a></h3>
					</div>
					<div class="panel-body timeline timeline-off">
					    <div class="timeline-off-box"><span>�޼����� �����ϴ�.</span></div>
					</div>
					</div>
				<!-- //�˸� �޼��� -->	
			</div>
			<!-- ���� -->		
		</div>
</div>		
</section>


	<!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
    <script src="../bt/js/bootstrap.min.js"></script>
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../bt/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>