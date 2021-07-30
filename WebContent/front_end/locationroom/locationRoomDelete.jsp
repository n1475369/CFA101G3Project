<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.locationroom.model.*"%>



<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon"
	href="<%=request.getContextPath()%>/front_end/locationroom/images/logo-icon01.ico"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/locationroom/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/locationroom/css/cssreset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/locationroom/css/header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/locationroom/css/footer.css">
	
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/locationroom/css/memberBuyProfile.css">
<link rel="stylesheet"
	type="<%=request.getContextPath()%>/front_end/locationroom/text/css"
	href="<%=request.getContextPath()%>/front_end/locationroom/css/jquery.datetimepicker.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script
	src="<%=request.getContextPath()%>/front_end/locationroom/js/jquery.datetimepicker.full.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<style>
#table thead, #table tr {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: rgb(230, 189, 189);
}

#table {
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: rgb(230, 189, 189);
}

#table td, #table th {
	padding: 5px 10px;
	font-size: 12px;
	font-family: Verdana;
	color: rgb(177, 106, 104);
}

#table tr:nth-child(even) {
	background: rgb(238, 211, 210)
}

#table tr:nth-child(odd) {
	background: #FFF
}

<
style>table {
	width: 800px;
	background-color: red;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid rgb(238, 211, 210);
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</style>
<title>廳房中心｜MarryHappiness</title>
</head>
<body>
<header>
		<div class="top">
			<ul>
				<!-- 購物車圖片Icon -->

				<li><a href="#">首頁</a></li>
				<li><a
					href="<%=request.getContextPath()%>/front_end/member/login.html"><i
						class="fas fa-sign-out-alt"></i>登入</a></li>
				<li><a
					href="<%=request.getContextPath()%>/src/com/member/controller/CheckServlet.java"><i
						class="fas fa-home"></i> 會員系統</a></li>
				<li class="headcart"><a href="javascript:void(0)"
					data-bs-toggle="modal" data-bs-target="#exampleModal"
					id="cartModal"> <i class="fas fa-shopping-cart" id="cartIcon"></i></a></li>

			</ul>
		</div>
		<!--上面增加的小色塊-->
		<div class="nav1"></div>
		<ul class="nav2">
			<li><a href="#">婚禮攝影<br>Photography
			</a></li>
			<li><a
				href="<%=request.getContextPath()%>/front_end/locationprogram/LocIndex.html">婚禮場地<br>Location
			</a></li>
			<li><a href="#" class="logo"><img src="<%=request.getContextPath()%>/front_end/locationroom/images/MHlogo_01.svg"></a></li>
			<li><a href="#">婚禮週邊<br>Product
			</a></li>
			<li><a href="#">專欄討論<br>Post
			</a></li>
		</ul>
	</header>
	<div class="wrap">
		<div class="side-bar">
			<img
				src="<%=request.getContextPath()%>/front_end/locationroom/images/shop_tenin_houseki.png"
				alt="">
			<div class="user-name s-user-name"></div>
			<div class="user-hr">
				<i class="fas fa-heart"></i>
			</div>
			<ul class="menu">
				<li><a href="<%=request.getContextPath()%>/front_end/locationorder/locationOrderGetAll.html"><i class="fas fa-user"></i>訂單資料</a>
				</li>
				<li><a href="<%=request.getContextPath()%>/locationroom/locationRoomServlet?action=locationRoomGetAll"><i
							class="fas fa-file-invoice"></i>查詢廳房</a></li>
				
				<li><a
					href="<%=request.getContextPath()%>/front_end/locationroom/locationRoomGetOnee2.jsp"><i
						class="fas fa-church"></i>新增廳房</a></li>
				<li><a
					href="<%=request.getContextPath()%>/locationroom/locationRoomServlet?action=locationRoomDelete"><i
						class="fas fa-camera-retro"></i>刪除廳房</a></li>

			</ul>
		</div>
		<div class="content">
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			<table>
				<tr>
<!-- 					<th>刪除</th>   刪除廳房不含照片 -->
					<th>刪除</th><!-- 刪除廳房與照片 -->
					<th>廳房編號</th>
					<th>店家編號</th>
					<th>廳房名稱</th>


					<th>廳房最大<br>總桌數
					</th>
					<th>廳房最小<br>總桌數
					</th>
					<th>主桌人數</th>
					<th>客桌人數</th>
					<th>廳房樓層</th>
					<!-- 					<th>簡介</th> -->
					<th>廳房狀態</th>



				</tr>
				<%-- 				<%@ include file="page1.file"%> --%>
				<c:forEach var="LocrVO" items="${list}">

					<tr>

<!-- 						<td> -->
<!-- 							<FORM METHOD="post" -->
<%-- 								ACTION="<%=request.getContextPath()%>/locationroom/locrServletxx" --%>
<!-- 								style="margin-bottom: 0px;"> -->
<!-- 								<input type="submit" value="刪除"> <input type="hidden" -->
<%-- 									name="LOCR_ID" value="${LocrVO.LOCR_ID}"> <input --%>
<!-- 									type="hidden" name="action" value="delete"> -->
<!-- 							</FORM> -->
<!-- 						</td> -->
						<td><button type="button" class="btn btn-primary"
								onclick="editRoom(${LocrVO.LOCR_ID})">刪除</button></td>
						<td>${LocrVO.LOCR_ID}</td>
						<td>${LocrVO.LOCR_SMEM_ID}</td>
						<td>${LocrVO.LOCR_NAME}</td>
						<td>${LocrVO.LOCR_MAX_TABLE}</td>
						<td>${LocrVO.LOCR_MIN_TABLE}</td>
						<td>${LocrVO.LOCR_MAIN_TABLE}</td>
						<td>${LocrVO.LOCR_GUEST_TABLE}</td>
						<td>${LocrVO.LOCR_FLOOR}F</td>
						<%-- 						<td>${LocrVO.LOCR_CONTENT}</td> --%>
						<td>${LocrVO.LOCR_STATUS}</td>

					</tr>
				</c:forEach>
			</table>
			<%-- 			<%@ include file="page2.file" %> --%>
		</div>
		<!-- 購物車頁面 -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">
							購物車<img src="images/MHlogo_04.svg" alt="">
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">商品資訊</th>
									<th scope="col">商品名稱</th>
									<th scope="col">價格</th>
									<th scope="col">數量</th>
									<th scope="col">小計</th>
									<th scope="col">操作</th>
								</tr>
							</thead>
							<tbody id="cart"></tbody>
						</table>
						<div id="total-list" class="total-list">
							<h5 class="site-color">合計金額</h5>
							<h5 class="site-color">
								$<span id="total"></span>
							</h5>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary" id="checkout">結帳</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	</div>
	    <!--尾巴-->
    <div class="footer">
        <div class="foote-top">
            <ul class="foote-content">
                <div>婚攝服務</div>
                <li><a href="">拍婚紗</a></li>
            </ul>
            <ul class="foote-content">
                <div>婚宴服務</div>
                <li><a href="<%=request.getContextPath()%>/front_end/locationprogram/LocIndex.html">婚宴場地</a></li>
            </ul>
            <ul class="foote-content">
                <div>婚禮週邊</div>
                <li><a href="">婚禮小物</a></li>
                <li><a href="">婚鞋</a></li>
                <li><a href="">婚戒</a></li>
            </ul>
            <ul class="foote-content">
                <div>專欄討論</div>
                <li><a href="">幸福專欄</a></li>
                <li><a href="">幸福聊聊</a></li>
            </ul>
        </div>
        <div class="foote-between">
            <img src="<%=request.getContextPath()%>/front_end/locationroom/images/MHlogo_01.svg" alt="">
            <p class="f-logo">2021 MarryHappiness 嫁給幸福</p>
        </div>
    </div>
	<script>
		function editRoom(id) {
			console.log(id)
			window.location.href="<%=request.getContextPath()%>/locationroom/locrServletxx?action=delete2&LOCR_ID="+id;
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>


</body>
</html>