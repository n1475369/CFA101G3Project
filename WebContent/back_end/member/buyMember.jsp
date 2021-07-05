<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.member.model.*" %>
<%
	MemService service = new MemService();
	List<MemVO> list = service.getAllByBuyMember();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/back_end/member/css/all.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/back_end/member/css/buyMemberList.css">
    <title>買家會員帳號管理系統</title>
</head>
<body>
	<div class="wrap">
		<div class="side-bar">
            <ul class="menu">
                <li><a href="javascript:void(0)"><i class="fas fa-user"></i>買家帳號管理</a></li>
                <li><a href="javascript:void(0)"><i class="fas fa-user"></i>賣家帳號管理</a></li>
            </ul>
        </div>
        <div class="content" id="content">
            <h5>買家帳號管理</h5>
            <div class="account">
                <table class="table table-striped">
                    <thead>
                        <tr>
                        <th scope="col">會員ID</th>
                        <th scope="col">會員帳號</th>
                        <th scope="col">會員名稱</th>
                        <th scope="col">會員手機</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="memVO" items="${list}">
                        <tr>
                        <th scope="row">${memVO.mem_id}</th>
                        <td>${memVO.mem_username}</td>
                        <td>${memVO.mem_name}</td>
                        <td>${memVO.mem_phone}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>