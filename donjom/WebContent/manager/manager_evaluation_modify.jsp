<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>evaluation write</title>
</head>
<body>
	<div>
		<center>
			<b> ${edto.e_memname}님의 대출 제안(수정)</b>
			<form action="manager_evaluation_update.dj" method="post" enctype="multipart/form-data">
				<table border="1">
					<tr>
						<td>ID :${edto.e_memid}</td>
					</tr>
					<tr>
						<td width="70" align="center" colspan="4">
						심사내용<textarea name="e_content" rows="13" cols="100">${edto.e_content}</textarea>
						</td>
					</tr>
					<tr><td>
					사업체 존재 유무 : ${edto.e_cphave}
					<select name="e_cphave">
					<c:if test="${edto.e_cphave == null}">
					<option value = '사업체 확인완료'>사업체 확인완료 </option>
					<option value = '확인 보류'>확인 보류</option>
					<option value="사업체 없음">사업체 없음</option>
					</c:if>
					<c:if test="${edto.e_cphave == '사업체 확인완료'}">
					<option value = '사업체 확인완료'>사업체 확인완료 </option>
					<option value = '확인 보류'>확인 보류</option>
					<option value="사업체 없음">사업체 없음</option>
					</c:if>
					<c:if test="${edto.e_cphave == '확인 보류'}">
					<option value = '확인 보류'>확인 보류</option>
					<option value="사업체 없음">사업체 없음</option>
					<option value = '사업체 확인완료'>사업체 확인완료 </option>
					</c:if>
					<c:if test="${edto.e_cphave == '사업체 없음'}">
					<option value="사업체 없음">사업체 없음</option>
					<option value = '사업체 확인완료'>사업체 확인완료 </option>
					<option value = '확인 보류'>확인 보류</option>
					</c:if>
					</select> 
					</td></tr>
					
					<tr><td>
					사업체 등기부등록: 
					<a href ="/donjom/file/${edto.e_cpfile}" >${edto.e_cpfile}</a>	
					<input type="file" name="cpfile"/>
					</td></tr>
					
					<tr><td>
					기타 서류 : 
					<a href ="/donjom/file/${edto.e_document}">${edto.e_document}</a>
					<input type="file" name="document"/>
					</td></tr>
					
					<tr><td>			
					총 서류 개수: 
					<select name="e_doccount">
						<option value="${edto.e_doccount}">${edto.e_doccount}개(원래갯수)</option>
						<option value="0">0개</option>
						<option value="1">1개</option>
						<option value="2">2개</option>
						<option value="3">3개</option>
						<option value="4">4개</option>
						<option value="5">5개</option>
					</select>
					대출 결과 : ${edto.e_result}
					<select name="e_result">
						<option value="success">success</option>
						<option value ="fail">fail</option>					
					</select>
					</td></tr>
					
					<tr><td colspan="4" align="center">
						
						<input type="hidden" value="${edto.e_cpfile}" name="cpfile"/>
						<input type="hidden" value="${edto.e_document}" name="document"/>
						
						<input type="hidden" value="${edto.e_memname}" name="e_memname"/>
						<input type="hidden" value="${edto.no}" name="no"/>
						<input type="hidden" value="${edto.e_memid}" name="e_memid">
						<input type="submit"	value="수정완료" />
						
					</td></tr>
				</table>


			</form>


		</center>

	</div>



</body>
</html>