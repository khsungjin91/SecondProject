<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/fragment/common-css.jsp" />
<jsp:include page="/WEB-INF/fragment/common-js.jsp" />
<title>500 ERROR</title>
</head>
<body>

  <section class="content">

      <div class="error-page">
        <h2 class="headline text-red">500</h2>

        <div class="error-content">
          <h3><i class="fa fa-warning text-red"></i> 페이지를 표시할 수 없습니다.<p>Internal Server Error</p></h3>
<hr><p><img src="image/brand2.png" ></p>
         페이지를 가져오는 중 웹 사이트에서 오류가 발생했습니다.
     웹사이트가 유지보수 중이거나 설정이 잘못되어 웹사이트가 다운되었을 수 있습니다.
          <a href="mailto:help@donjom.net"><i class="fa fa-envelope-square text-olive"></i><b>관리자에게 문의하기</b></a>
          
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