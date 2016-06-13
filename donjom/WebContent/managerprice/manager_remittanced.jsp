<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<div class="row">
			<div class="box box-primary">
				<div class="box-body">
					<div class="col-sm-12">

						<div>송금한 상픔
							
							<table class="table table-bordered table-responsive table-hover">
							<tr>
								<td>상품코드</td>
								<td>상품제목</td>
								<td>투자된금액</td>
								<td>총투자인원</td>
								<td>대출자이름</td>
								<td>대출자정보</td>
							</tr>
							<c:if test="${count == 0 }">
							<tr><td colspan="6" align="center">상환완료된 상품이 없습니다.</td></tr>
							</c:if>
							<c:if test="${count != 0 }">
								<c:forEach var="listrt" items="${listrt}">
									<tr>
										<td>${listrt.p_code}</td>
										<td><a href="fundView.dj?p_code=${listrt.p_code}">${listrt.p_name}</a></td>
										<td>${listrt.p_price}만원</td>
										<td>${listrt.p_people}명</td>
										<td>${listrt.name}</td>
										<td><a href="confirm_search.dj?confirm=i.no&search=${listrt.p_memeno}">상세정보</a></td>
									</tr>
								</c:forEach>
								</c:if>
						</table>
						<div align="center">${pagingHtmled}</div>
						</div>
						
				</div>
			</div>
		</div>
	</div>


</body>
</html>