<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 	<title>대시보드</title>
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
			
			
			<!-- 좌측 -->
			<div class="col-sm-12 col-md-8 contents-left">
				<!-- 투자요약 -->
				<div class="box box-solid box-primary">
					<div class="box-header">
					<h3 class="box-title">투자요약</h3>
					</div>
					<div class="box-body">
						<ul class="col-xs-6">
							<li> 
								<p class="title-edge">누적 투자금</p>
							    <p class="title-other">0원</p>
							</li>
							<li class="line">
								<p>누적 투자 회수금<span>0원</span></p>
							</li>
							<li class="line">
								<p>누적 투자 회수 원금<span>0원</span></p>
							</li>
							<li class="line">
								<p>누적 수익금<span>0원</span></p>
							</li>
							<li>
								<p>잔여 상환 원금<span>0원</span></p>
							</li>
						</ul>
						<ul class="col-xs-6 table-wrap">
						    <li>
						        <p class="title-edge">평균 수익률(연)</p>
							    <p class="title-other">0.00%</p>
						    </li>
							<li class="line">
								<p>상환중인 투자<span>0건</span></p>
							</li>
							<li class="line">
								<p>상환 완료된 투자<span>0건</span></p>
							</li>
							<li class="line">
								<p>연체 건수<span>0건</span></p>
							</li>
							<li>
								<p>채권 발생 건수<span>0건</span></p>
							</li>
						</ul>
					</div>
				</div>
				<!-- //투자요약 -->
									
				<!-- 대출요약 -->
				<div class="box box-solid box-primary ">
					<div class="box-header">
					<h3 class="box-title">대출요약</h3>
					</div>
					<div class="box-body">
						<ul class="col-xs-6">
							<li>
								<p class="title-edge">누적 대출금</p>
								<p class="title-other">0원</p>
							</li>
							<li class="line">
								<p>누적 대출 상환금<span>0원</span></p>
							</li>
							<li class="line">
								<p>누적 이자금<span>0원</span></p>
							</li>
							<li>
								<p>잔여 상환 원금<span>0원</span></p>
							</li>
						</ul>
						<ul class="col-xs-6 table-wrap">
							<li>
								<p class="title-edge">평균 이자율(연)</p>
								<p class="title-other">0.00%</p>
							</li>
							<li class="line">
								<p>상환중인 대출<span>0건</span></p>
							</li>
							<li class="line">
								<p>상환 완료된 대출<span>0건</span></p>
							</li>
							<li class="line">
								<p>연체 건수<span>0건</span></p>
							</li>
							<li>
								<p>채권 발생 건수<span>0건</span></p>
							</li>
						</ul>

					</div>
				</div>
				<!-- //대출요약 -->		
			</div>
			<!-- //좌측-->	
			<!-- 우측 -->
			<div class="col-sm-12 col-md-4 contents-aside">
				<!-- 가상계좌정보 -->
				<div class="box box-solid box-primary contents contents-right">
					<div class="box-header">
						<h3 class="box-title">가상계좌 정보</h3><div class="box-tools"><a class="btn btn-sm" href="point_deposit.dj" type="button">환급하기</a></div>
					</div>
					<div class="box-body body-margin-bank text-center">
						<c:if test = "${infodto.randomacc == null}">
						<button class="btn deposit" onclick="location.href='setting_cert_person.dj'">가상계좌 생성하기</button>							
						</c:if>
						<c:if test = "${infodto.randomacc != null}">
						<div>보유 예치금</div>
						<div class="title-con"> <fmt:formatNumber value="${total }" pattern="#,###" />원</div> 
						예금주 ${infodto.name} 
						<hr>
						${infodto.bankcode} ${infodto.randomacc}
						</c:if>
					</div>
				</div>
				<!-- //가상게좌정보 -->
                                          
                <!-- 알림 메세지 -->
				<div class="box box-solid  box-primary ">
					<div class="box-header">
					<h3 class="box-title">알림 메세지</h3><div class="box-tools"><a class="btn btn-sm" href="notification.dj" type="button">더보기</a></div>
					</div>
					<div class="box-body">
					<c:if test="${count == 0 }">
					    <div class="timeline-off-box"><span>메세지가 없습니다.</span></div>
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
				<!-- //알림 메세지 -->	
			</div>
			<!-- 우측 -->		
		</div>
</div>		
</div><!-- container end -->
<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
</body>
</html>