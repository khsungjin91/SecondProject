<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>

function fund_cancle(){
	
	if(confirm("대출신청을 취소 하시겠습니까?")){
		
		window.location="fund_cancle.dj";		
	}else{
		
		self.close();	
	}	
}


</script>


${dto.name}님의 대출신청이 완료 되었습니다.<br/>
심사 통과 시 대출금 펀딩이 시작됩니다. <br/>
<br/>
금리/한도 산출을 위해 다음 서류가 필요합니다. <br/>
아래 서류들을 Fax또는 Email로 보내주시면 대출심사가 완료됩니다. <br/>
Fax: 02 - 8282 - 8282 / Email:psj9102@naver.com <br/>

<table border="1">
<tr>
<td>대출구분</td><td>준비서류</td>
</tr>
<tr>
<td>개인신용</td>
<td>
- 신분증사본 <br/>
- 건강보험 자격득실 확인서, 납부 확인서 <br/>
   신청방법 : 건강보험 공단 홈페이지 혹은 전화신청(1577-<br/>
   1000) <br/>
- 주거래통장 최근 3개월 내역  <br/>
- 주민등록 원초본 (발급기준 1주일 이내 발급용)  <br/>
</td>
</tr>
</table> 
<input type="button" value="대출 신청 취소" onclick="return fund_cancle()">
<input type="button" value="메인으로 가기" onclick="javascript:window.location='main.dj'">

</body>
</html>