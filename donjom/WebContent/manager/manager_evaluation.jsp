<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>evaluation page</title>
</head>
<body>
	<form method="post" action="manager_evaluation.dj">
	<!-- 기본 서류  -->
	신분증 사본 :  <input type="file" name="file"> <br/>
	건강보험 자격득실 확인서 :  <input type="file" name="file"> <br/>
	건강보헙 납부확인서 :  <input type="file" name="file"> <br/>
	주민등록 원초본(발급기준 1주일이내 발급용) :  <input type="file" name="file"> <br/>
	
	<!-- 그외의 심사 내용 -->
	사업체 존재유무 확인 : <input type="checkbox"> 사업체 확인 완료 
						<input type="checkbox"> 확인 보류 <br/>
	사업체 등기부등록 확인 : <input type="text"> <br/>
	
	<input type="submit" value="저장">
	<br/><br/>
	
	<select> 
		<option>회원아이디</option>
	</select>
	<input type="text">
	<input type="button" value="검색"> <br/>
	
	<table border="1">
		<tr>
			<td> 회원아이디 </td>
			<td> 서류 존재 여부</td>
			<td> 심사완료 	</td>
				<input type="button" value="심사완료"> <br/>
			<td> 탈락사유 </td>
				<input type="button" value="탈락 사유"> <br/>
		</tr>				
	</table>
	</form>
</body>
</html>