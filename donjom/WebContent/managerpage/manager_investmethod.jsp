<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 투자 방법 (자세히 보기)</title>
</head>
<body>	
	<jsp:include page="/WEB-INF/header.jsp"/>
	<div class="container">
<div class="box-header">
		<h2> 투자방법 </h2>
		</div>
		<div class="box box-primary">
		<div class="box-body">
	
	<table>
		<tr>
			<td>
			Step1 우측의 투자 금액을 입력한 후, [투자미리보기]를 클릭합니다.<br/>
			<img src="image\intro_invest_step1.png"><br/>
			<hr>
			Step2 투자이용약관 체크박스에 체크를 한 후, [투자확정] 버튼을 클릭합니다.<br/>
			<img src="image\intro_invest_step2.png"><br/>
			<hr>
			step3 문자로 수신된 세이퍼트 송금 요청 동의번호를 확인 후, <br/> 
			해당 번호를  [0000] 형식으로 답변합니다. (투자금 만큼의 예치금이 차감됩니다.)<br/>
			<img src="image\intro_invest_step3_new.png"><br/>
			<hr>
			Step4 투자가 완료되면 아래와 같이 [투자완료] 상태로 바뀝니다. (최대 10분 소요)<br/>
			※ 투자 실패시 투자 실패 알림 문자가 발송되고, 투자금은 예치금으로 반환됩니다.(최대 10분 소요)
			<img src="image\intro_invest_step5.png"><br/>
	</table>
	</div></div></div>
	<jsp:include page="/WEB-INF/footer.jsp"/>
</body>
</html>