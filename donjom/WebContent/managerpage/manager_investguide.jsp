<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 투자 안내 </title>
</head>
<body>
<jsp:include page="/WEB-INF/header.jsp"/>
	<div class="container">
		<div class="box-header text-center">
		<h2> 투자 안내 </h2>
		저금리 시대! 안정적인 고수익 대출 채권에 투자하세요!
		</div>
		
		<hr>
		<div class="box-body">
		<div class="text-center">
		<h2>빌리의 간편한 투자절차</h2>
		예치금 입금 > 투자하기 > SMS인증 > 투자완료
		<br><input type="button" value="투자하기" class="btn btn-lg bg-green" onclick="javascript:location.href='fundList.dj'"><br/>
		</div>
		<hr>
		<br>
		시중 투자상품 대비 5~15%의 월등한 이자수익 <br/>
		 <img src="image\sub-loan_2.png"><br/>
		<br/>
		<br/>
		Q. 돈좀 투자는 왜 수익률이 높나요?<br/>
		<br/>
		투자자와 대출자 간의 직거래를 통해 기존 금융사와 달리 비용구조를 획기적으로 낮춰, 대출 시 발생하는 이자 수익을 투자자분께 그대로 돌려드리기 때문입니다.<br/>
		<br/>
		<br/>
		Q. 대출 채권 투자가 위험하지는 않나요?<br/>
		<br/>
		2016년 1월 현재 대출심사 승인율은 6.9% 입니다. 빌리의 보수적인 심사를 통해 위험도가 낮고 안정적인 투자상품에 투자 할 수 있습니다.<br/>
		<br/>
		<br/>
		Q. 예치금 시스템은 무엇인가요?<br/>
		<br/>
		고객님 명의로 발급된 가상계좌에 돈을 입출금 할 수 있는 시스템입니다.<br/>
		투자 시 해당 가상계좌번호에 투자금을 입금하면 예치금이 충전되고, 대출자로부터 원리금을 상환 받는 경우도 해당 금액이 예치금으로 충전됩니다. 예치금은 24시간 실시간으로 입출금이 가능합니다.<br/>
		<br/>
		<hr>
		<br/>
			투자 및 환급 상세 안내
			<table border="1">
				<tr>
					<td> step1 <br/>
					투자자인증 (최초 1회) <br/>
					회원 가입 후 설정 > 회원인증 이동 후  <br/>
					투자자원천징수정보 입력
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step2 <br/>
					가상계좌 발급 및 예치금 입금 <br/>
					충전/환급 > 충전 이동 후 가상계좌 발급 및 <br/>
					해당 계좌로 예치금 입금
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step3 <br/>
					투자금 입력 후 인증메일 회신<br/>
					<input type="button" value="자세히 보기" onclick="javascript:location.href='manager_investmethod.dj'">
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step4 <br/>
					투자완료 및 상환시작 <br/>
					매월 대출자가 상환하는 원금과 이자를<br/>
					수취하며, 만기시 투자가 종료됩니다.
					</td>
				</tr> 
			</table>
			<table border="1">
				<tr>
					<td> step5 <br/>
					원리금 내 실거래 통장으로 출금하기<br/>
					매월 상환되는 원리금은 투자자 계정의<br/>
					예치금으로 입금되어 있습니다. 충전/환급 > 환급<br/> 
					이동 후 원하시는 금액을 24시간 즉시 출금 가능합니다.
					<input type="button" value="자세히 보기" onclick="javascript:location.href='manager_refundmethod.dj'">
					</td>					
				</tr> 
			</table>
			<hr>
			<h2> 돈좀은 플랫폼 이용 수수료가 없습니다.</h2>
			<input type="button" value="투자하기" onclick="javascript:location.href='fundList.dj'">
</div>
</div>
	<jsp:include page="/WEB-INF/footer.jsp"/>
</body>
</html>