<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vaps shopping mall</title>
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bt.css" />
</head>
<body>
	<%@include file="/WEB-INF/views/top/title.jsp"%>
	<%@include file="/WEB-INF/views/top/menu.jsp"%>
	<br />
	<div style="padding: 1px 20px 30px 60px;">
		<h1> 파일 업로드 및 상품 리스트 구현</h1>
		<form method="post" enctype="multipart/form-data">

		<input type="text" id="fileName" class="file_input_textbox" readonly="readonly">
		 
		<div class="file_input_div">
		<input type="button" value="파일" class="button" />
		<input type="file" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value" />
		</div>
			
		</form>
	</div>
</body>
</html>
