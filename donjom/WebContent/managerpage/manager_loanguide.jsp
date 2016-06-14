<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 대출 안내 </title>
</head>
<body>
<jsp:include page="/WEB-INF/header.jsp"/>
<div class="container">
<div class="box-header">
		<h2>대출 안내 </h2>
		</div>
		<div class="box box-primary">
		<div class="box-body">
		
		돈좀을 통해 합리적인 중금리 대출을 받으실 수 있습니다!.<br/>
		<hr>
		<br>
		<h2>1분만에 신청하는 간편한  대출절차</h2>
		<br>
		대출신청 > 추가정보 > 서류제출 > 펀딩실행<br/>
		<input type="button" value="대출신청" onclick="javascript:location.href='loan_step1.dj'"><br/>
		<hr>
		<br>
		최저5% 합리적인 대출이자<br/>
		 <img src="/image/sub-loan_1.jpg"><br/>
		<br/>
		Q. 합리적인 대출이자 어떻게 실현 가능한가요?<br/>
		<br/>	
		투자자와 대출자 간의 직거래를 통해 기존 금융사와 달리 비용구조를 획기적으로 낮춰, 대출이자 = 투자수익이 되는 투명한 거래구조를 만들었기 때문입니다.<br/>
		<br/>
		<br/>
		Q. 기존 금융권 대출심사 방식과 무엇이 다른가요?<br/>
		<br/>
		신용등급 외에도 대출자의 상환능력, 수익 분석, 지출 분석, 기 부채액 분석, 사업성 평가, 상권 분석, 소셜 데이터 분석 등의 종합적인 심사를 통해 대출자에게 새로운 신용을 부여합니다.<br/>
		<br/>
		<br/>
		Q. 대출 신청자격은 어떻게 되나요?<br/>
		<br/>
		1. 나이스 신용등급 기준 7등급 이내<br/>
		<br/>
		2. 최근 1년간 연체, 채무불이행 이력이 없으면 가능합니다.<br/>
		개인신용 : 재직기간 최소 3개월 이상 <br/>
		사업자 : 최소 1년간의 업력 및 매출 발생 이력<br/> 
		부동산 : 시세 조회 가능 담보 <br/>
		<hr>
		<br/>
		<h2> 돈좀은 다수의 투자자로 부터 모금된 투자금으로 대출이 발생되는 상생금융입니다. </h2><br/>
		<img src="/image/sub-loan_2.png"><br/>
		<hr>
		<br/>
			대출절차 상세 안내
			<table border="1">
				<tr>
					<td> step1 <br/>
					회원가입 및 대출신청 <br/>
					돈좀 회원가입 후 대출신청 화면에서 <br/>
					대출정보를 작성합니다.
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step2 <br/>
					서류제출 <br/>
					대출 신청 후 SMS 안내에 따라 관련 서류를  <br/>
					제출하시면 신청이 완료됩니다.
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step3 <br/>
					대출심사<br/>
					심사 담당자가 전화 연락을 통해 몇가지 확인<br/>
					후 심사결과를 통보합니다.
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step4 <br/>
					투자금 모집 (1분~7일)<br/>
					대출금 펀딩이 시작되며, 최소 1분에서 최대<br/>
					7일이 소요됩니다.
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step5 <br/>
					대출 실행 및 상환 시작<br/>
					계약서 작성 후 대출금이 대출자의 통장으로<br/>
					이체되며, 약정된 기간동안 매월 상환을<br/> 
					하시게 됩니다.
					</td>					
				</tr> 
			</table>
			<hr>
			<h2> 돈좀은 중도상환 수수료가 없습니다.</h2>
			<input type="button" value="대출신청" onclick="javascript:location.href='loan_step1.dj'"><br/>
			<jsp:include page="/WEB-INF/footer.jsp"/>
			</div></div></div>
	</body>
</html>