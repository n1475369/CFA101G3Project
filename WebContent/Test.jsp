<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
	<a href="<%=request.getContextPath()%>/weddingPhoto/workPhotoServlet?wed_wor_id=1&action=jsp">1號攝影師</a>
	<a href="<%=request.getContextPath()%>/weddingPhoto/workPhotoServlet?wed_wor_id=2&action=jsp">2號攝影師</a>
	<a href="<%=request.getContextPath()%>/weddingPhoto/workPhotoServlet?wed_wor_id=3&action=jsp">3號攝影師</a>
	<a href="<%=request.getContextPath()%>/weddingPhoto/workPhotoServlet?wed_wor_id=4&action=jsp">4號攝影師</a>
	<a href="<%=request.getContextPath()%>/weddingPhoto/workPhotoServlet?wed_wor_id=5&action=jsp">5號攝影師</a>
	<a href="<%=request.getContextPath()%>/weddingPhoto/workPhotoServlet?wed_wor_id=6&action=jsp">6號攝影師</a>
	<div id="img">
		<c:forEach var="wedVO" items="${list}">
			<img src="<%=request.getContextPath()%>/weddingPhoto/wedPhotoServlet?wed_id=${wedVO.wed_id}" alt="">
		</c:forEach>
	</div>
</body>
</html>