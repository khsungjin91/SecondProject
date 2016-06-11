<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>심사내용 작성 페이지 </title>
</head>
<body>
<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="content-wrapper">
    <div class="container ">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <h1>심사내용 작성</h1>
     </div>

      <!-- Main content -->
			<div  class="content">
			<div class="row">
	<div>
		<center>
			
			<form action="manager_evaluation_writeinsert.dj" method="post" enctype="multipart/form-data">
				<table class="table bg-gray">
					<tr>
						<td>
						<b> ${dto.memname}님의 대출 제안</b>
						<span>ID :${dto.mememail}</span>
						
						</td>
						
					</tr>
					<tr>
						<td >
						
						<textarea name="e_content" class="ckeditor" style="width:100%;height:200px;"></textarea>
						</td>
					</tr>
					<tr>
					<td>
					<div class="form-inline">
					<div class="form-group">
					
					<label class="control-label">사업체 존재 유무 : </label>
				
					
					<select name="e_cphave" class="form-control">
						<option value="사업체 확인완료">사업체 확인 완료</option>
						<option value="확인 보류">확인 보류</option>
						<option value="사업체 없음">사업체 없음</option>
					</select>
					</div>
					
					<div class="form-group">
					<label class="control-label"> &nbsp;&nbsp; 사업체 등기부등록: </label>
					<input type="file" name="cpfile" class="form-control">
					</div>
					</div>
					
					</td>
					</tr>
					<tr>
					<td>
					<div class="form-inline">
					<div class="form-group">
					<label class="control-label">기타 서류 : </label>
					<input type="file" name="document" class="form-control">
					</div>
					<div class="form-group">
					<label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;총 서류 개수:</label>
					<select name="e_doccount" class="form-control">
						<option value="0">0개</option>
						<option value="1">1개</option>
						<option value="2">2개</option>
						<option value="3">3개</option>
						<option value="4">4개</option>
						<option value="5">5개</option>
					</select>
					</div>
					<div class="form-group">
					<label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;대출 결과 : </label>
					<select name="e_result" class="form-control">
						<option value="success">대출 성공 </option>
						<option value ="fail">대출 실패</option>					
					</select>
					</div>
					
					
					</div>
					</td>
					</tr>
					
					<tr>			
						<td colspan="4" align="center">
						
						<input type="hidden" value="${dto.memname}" name="e_memname"/>
						<input type="hidden" value="${dto.no}" name="no"/>
						<input type="hidden" value="${dto.mememail}" name="e_memid">
						<input type="submit"	value="심사완료"  class="btn btn-block bg-olive"/>
						
						</td>
					</tr>
				</table>


			</form>


		</center>

	</div>
</div>
</div>
</div>
</div>



</body>
</html>