<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.locationroom.model.*"%>
<%
	LocrVO LocrVO = (LocrVO) request.getAttribute("LocrVO");
%>

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
<title>廳房中心｜MarryHappiness</title>
</head>
<style>
ul {
	list-style: none;
	padding-left: 0px;
}

div.showimg div {
	display: inline-block;
}
.imglist {
display: flex;
/* border: 1px solid #facfd2; */
}
.imglist form div{
display: inline-block;

}

@media (min-width: 768px)
.col-md-3 {
    -ms-flex: 0 0 25%;
    flex: 0 0 25%;
    max-width: 250PX;
}

</style>
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

			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			<div class="mb-3">
				<label for="" class="form-label">廳房照片</label><br>



				<!-- 				加入圖片 -->

				<form METHOD="post" id="imgform" name="imgform"
					enctype="multipart/form-data">

					<div class="imgblock">
						<div class="form-horizontal">
							<div class="form-group">
								<input type="submit" class="btn btn-danger" value="上傳"
									id="button"> <label for="file1">選取圖片:</label> <input
									type="file" id="file1" name="file1" accept="image/*"> <input
									type="hidden" value="${locrVO.LOCR_ID}" name="LOCR_ID"
									id="LOCR_ID">

							</div>
							<br> <img id="demoimg" width="450" />
						</div>
					</div>



				</form>
				<!-- 				預覽圖片與刪除 -->
				
				<div class="imglist">
				<c:forEach var="LociVO" items="${lociList}">
					<form METHOD="post"
						ACTION="<%=request.getContextPath()%>/LociServlet?LOCI_ID=${LociVO.LOCI_ID}"
						name="image1">

						<div class="col-sm-6 col-md-3">
							<img
								src="<%=request.getContextPath()%>/locationimages/imgLociServlet?LOCI_ID=${LociVO.LOCI_ID}"
								class="img-thumbnail" alt=""> <input type="hidden"
								name="action" value="delete"> <input type="submit"
								class="btn btn-danger" value="刪除">
						</div>
					</form>

				</c:forEach>
				</div>
			</div>


			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/locationroom/locrServletxx?LOCR_ID=${locrVO.LOCR_ID}"
				name="form1">

				<div class="mb-3">
					<label for="LOCR_ID" class="form-label">廳房編號</label> <input
						type="text" class="form-control" id="LOCR_ID" name="LOCR_ID"
						value="${locrVO.LOCR_ID}" disabled>
				</div>
				<div class="mb-3">
					<label for="LOCR_NAME" class="form-label">廳房名稱</label> <input
						type="text" class="form-control" id="LOCR_NAME" name="LOCR_NAME"
						value="${locrVO.LOCR_NAME}">
				</div>
				<div class="mb-3">
					<label for="LOCR_MAX_TABLE" class="form-label">最大總桌數</label> <input
						type="text" class="form-control" id="LOCR_MAX_TABLE"
						name="LOCR_MAX_TABLE" value="${locrVO.LOCR_MAX_TABLE}">
				</div>
				<div class="mb-3">
					<label for="LOCR_MIN_TABLE" class="form-label">最小總桌數</label> <input
						type="text" class="form-control" id="LOCR_MIN_TABLE"
						name="LOCR_MIN_TABLE" value="${locrVO.LOCR_MIN_TABLE}">
				</div>
				<div class="mb-3">
					<label for="LOCR_MAIN_TABLE" class="form-label">主桌人數</label> <input
						type="text" class="form-control" id="LOCR_MAIN_TABLE"
						name="LOCR_MAIN_TABLE" value="${locrVO.LOCR_MAIN_TABLE}">
				</div>
				<div class="mb-3">
					<label for="LOCR_GUEST_TABLE" class="form-label">客桌人數</label> <input
						type="text" class="form-control" id="LOCR_GUEST_TABLE"
						name="LOCR_GUEST_TABLE" value="${locrVO.LOCR_GUEST_TABLE}">
				</div>
				<div class="mb-3">
					<label for="LOCR_FLOOR" class="form-label">廳房樓層</label> <input
						type="text" class="form-control" id="LOCR_FLOOR" name="LOCR_FLOOR"
						value="${locrVO.LOCR_FLOOR}">
				</div>
				<div class="mb-3">
					<label for="LOCR_STATUS" class="form-label">廳房狀態</label>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="LOCR_STATUS"
							id="LOCR_STATUS1" value="1"
							<c:if test="${locrVO.LOCR_STATUS==1}">checked</c:if>> <label
							class="form-check-label" for="LOCR_STATUS1">上架</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="LOCR_STATUS"
							id="LOCR_STATUS0" value="0"
							<c:if test="${locrVO.LOCR_STATUS==0}">checked</c:if>> <label
							class="form-check-label" for="LOCR_STATUS0">下架</label>
					</div>
				</div>
				<div class="mb-3">
					<label for="LOCR_CONTENT" class="form-label">廳房介紹</label>
					<textarea class="form-control" id="LOCR_CONTENT"
						name="LOCR_CONTENT" rows="3">${locrVO.LOCR_CONTENT}</textarea>
				</div>
				<input type="hidden" name="action" value="update"> 
				<input type="submit" value="送出修改" class="btn btn-danger">
				
			</form>

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
		//預覽圖片
		
		$('#file1').on('change', function() {
			var file = $('#file1')[0].files[0];
			var reader = new FileReader;
			reader.onload = function(e) {
				$('#demoimg').attr('src', e.target.result);
			};
			reader.readAsDataURL(file);
		})

		$('#imgform').on('submit', function(e) {
			$.ajax({
				url : "<%=request.getContextPath()%>/locationimages/LociServletAddImg",
										type : 'POST',
										data : new FormData(this),
										dataType : "JSON",
										processData : false,
										contentType : false,
										success : function(data) {
											// 					console.log(data);

											alert("上傳成功");
											location.reload(false);
										},

										error : function(data) {

											console.log("123");
											alert("上傳失敗");
											location.reload(false);
										}
									});
							//取消form表單的跳轉畫面
							e.preventDefault();

						});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>