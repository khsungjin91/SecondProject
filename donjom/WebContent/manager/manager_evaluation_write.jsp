<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ɻ系�� �ۼ� ������ </title>
</head>
<body>
<jsp:include page="/WEB-INF/admin-slider.jsp" />
<div class="content-wrapper">
    <div class="container ">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <h1>�ɻ系�� �ۼ�</h1>
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
						<b> ${dto.memname}���� ���� ����</b>
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
					
					<label class="control-label">���ü ���� ���� : </label>
				
					
					<select name="e_cphave" class="form-control">
						<option value="���ü Ȯ�οϷ�">���ü Ȯ�� �Ϸ�</option>
						<option value="Ȯ�� ����">Ȯ�� ����</option>
						<option value="���ü ����">���ü ����</option>
					</select>
					</div>
					
					<div class="form-group">
					<label class="control-label"> &nbsp;&nbsp; ���ü ���ε��: </label>
					<input type="file" name="cpfile" class="form-control">
					</div>
					</div>
					
					</td>
					</tr>
					<tr>
					<td>
					<div class="form-inline">
					<div class="form-group">
					<label class="control-label">��Ÿ ���� : </label>
					<input type="file" name="document" class="form-control">
					</div>
					<div class="form-group">
					<label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;�� ���� ����:</label>
					<select name="e_doccount" class="form-control">
						<option value="0">0��</option>
						<option value="1">1��</option>
						<option value="2">2��</option>
						<option value="3">3��</option>
						<option value="4">4��</option>
						<option value="5">5��</option>
					</select>
					</div>
					<div class="form-group">
					<label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;���� ��� : </label>
					<select name="e_result" class="form-control">
						<option value="success">���� ���� </option>
						<option value ="fail">���� ����</option>					
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
						<input type="submit"	value="�ɻ�Ϸ�"  class="btn btn-block bg-olive"/>
						
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