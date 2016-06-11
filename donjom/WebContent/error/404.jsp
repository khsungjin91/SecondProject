<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>404 ERROR</title>
</head>
<body>

<jsp:include page="/WEB-INF/header.jsp"/>
<section class="content">

      <div class="error-page">
        <h2 class="headline text-red">404</h2>

        <div class="error-content">
          <h3><i class="fa fa-warning text-red"></i> 페이지를 찾을 수 없습니다.<p>ERROR!- Page not found</p></h3>
<hr><p><img src="image/brand2.png" ></p>
          
찾으시는 페이지의 주소가 잘못 입력되었거나 , 페이지 주소의 변경 혹은 삭제로 인해 현재 사용하실 수 없습니다.
입력하신 페이지의 주소가 정확한지 다시 한번 확인해 주시길 바랍니다. 

동일한 문제가 지속적으로 발생할 경우 <a href="mailto:help@donjom.net"><i class="fa fa-envelope-square text-olive"></i><b>돈좀 관리자</b></a>에게 문의해 주시기 바랍니다.
         
          
         <br>
<br><p>
<a href="javascript:history.back()" type="button" class="btn btn-lg" ><i class="fa fa-hand-o-left text-red"></i> 이전페이지 </a>
<a href="javascript:location.reload()" type="button" class="btn btn-lg" ><i class="fa fa-refresh text-red"></i> 새로고침 </a>
          </p>

         
        </div>
      </div>
      <!-- /.error-page -->

    </section>



</body>
</html>