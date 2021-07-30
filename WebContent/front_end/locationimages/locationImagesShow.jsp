<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
<style>
div img {
	border: 1px solid black;
	padding: 10px;
	width: 500px;
	height: 300px;
	vertical-align: middle;
}
</style>
</head>

<body>
	<a
		href="<%=request.getContextPath()%>/LociServlet?LOCI_LOCR_ID=1&action=jsp">1號廳</a>
	<a
		href="<%=request.getContextPath()%>/LociServlet?LOCI_LOCR_ID=2&action=jsp">2號廳</a>
	<a
		href="<%=request.getContextPath()%>/LociServlet?LOCI_LOCR_ID=3&action=jsp">3號廳</a>
	<a
		href="<%=request.getContextPath()%>/LociServlet?LOCI_LOCR_ID=4&action=jsp">4號廳</a>
	<a
		href="<%=request.getContextPath()%>/LociServlet?LOCI_LOCR_ID=5&action=jsp">5號廳</a>
	<a
		href="<%=request.getContextPath()%>/LociServlet?LOCI_LOCR_ID=6&action=jsp">6號廳</a>

	<ul>

		<jsp:useBean id="LocrSvc" scope="page"
			class="com.locationroom.model.LocrService" />
		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/LociServlet">
				<b>選擇廳房編號:</b> <select size="1" name="LOCI_LOCR_ID">
<%-- 					<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 						<option value="${deptVO.deptno}" --%>
<%-- 							${(empVO.deptno==deptVO.deptno)? 'selected':'' }>${deptVO.dname} --%>
<%-- 					</c:forEach> --%>
					<c:forEach var="LocrVO" items="${LocrSvc.all}">
						<option value="${LocrVO.LOCR_ID}"${(LociVO.LOCI_LOCR_ID==LocrVO.LOCR_ID)?'selected':'' }>${LocrVO.LOCR_NAME}
					</c:forEach>
				</select><br> <input type="hidden" name="action" value="jsp"> <input
					type="submit" value="送出">
			</FORM>
		</li>
	</ul>
	<div id="img">
		<c:forEach var="LociVO" items="${list}">
			<img
				src="<%=request.getContextPath()%>/ImgLociServlet?LOCI_ID=${LociVO.LOCI_ID}"
				alt="">
		</c:forEach>
	</div>
</body>
</html>