<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>evaluation write</title>
</head>
<body>
	<div>
		<center>
			<b> ${dto.memname}님의 대출 제안</b>
			<form action="manager_evaluation_writeinsert.dj" method="post" enctype="multipart/form-data">
				<table border="1">
					<tr>
						<td>ID :${dto.mememail}</td>
					</tr>
					<tr>
						<td width="70" align="center" colspan="4">
						심사내용<textarea name="e_content" rows="13" cols="100"></textarea>
						</td>
					</tr>
					<tr>
					<td>
					사업체 존재 유무 : 
					<select name="e_cphave">
						<option value="사업체 확인완료">사업체 확인 완료</option>
						<option value="확인 보류">확인 보류</option>
						<option value="사업체 없음">사업체 없음</option>
					</select>
					사업체 등기부등록: <input type="file" name="cpfile"/></td>
					</tr>
					<tr>
					<td>
					기타 서류 : <input type="file" name="document"/>
					</td>
					</tr>
					<tr>
					<td>			
					총 서류 개수: 
					<select name="e_doccount">
						<option value="0">0개</option>
						<option value="1">1개</option>
						<option value="2">2개</option>
						<option value="3">3개</option>
						<option value="4">4개</option>
						<option value="5">5개</option>
					</select>
					대출 결과 :
					<select name="e_result">
						<option value="success">대출 성공 </option>
						<option value ="fail">대출 실패</option>					
					</select>
					</td>
					</tr>
					<tr>			
						<td colspan="4" align="center">
						
						<input type="hidden" value="${dto.memname}" name="e_memname"/>
						<input type="hidden" value="${dto.no}" name="no"/>
						<input type="hidden" value="${dto.mememail}" name="e_memid">
						<input type="submit"	value="심사완료" />
						
						</td>
					</tr>
				</table>


			</form>


		</center>

	</div>



</body>
</html>