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
	href="<%=request.getContextPath()%>/front_end/locationroom/css/LocSellerProfile.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/locationroom/css/newCart.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front_end/locationroom/css/friendchat.css">
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
<script
	src="<%=request.getContextPath()%>/front_end/locationroom/js/newCart.js"></script>
<title>???????????????MarryHappiness</title>
</head>
<style>
div.contant div.inner {
	/* 	position:sticky; */
	
}

div.content {
	/* 		width: :50%; */
	
}

div #errorMsg {
	color: red;
}

div.md-4 {
	width: 40%;
}

div.col-sm-6col-md-3 img {
	width: 720px;
}

ul {
	list-style: none;
	padding-left: 0px;
}
.form-control {
 
    width: 70%;
    
}
</style>
<body>
    <!--??????-->
    <header>
        <div class="top">
            <ul>
                <!-- ???????????????Icon -->

                <li><a href="<%=request.getContextPath()%>/front_end/index/index.jsp">??????</a></li>
                <li><a href="<%=request.getContextPath()%>/front_end/member/login.html"><i class="fas fa-sign-out-alt"></i>??????</a></li>
				<li><a href="<%=request.getContextPath()%>/member/loginServlet?action=logout"><i class="fas fa-sign-out-alt"></i>??????</a></li>
                <li><a href="<%=request.getContextPath()%>/member/checkServlet"><i class="fas fa-home"></i> ????????????</a></li>
                <li class="headcart">
                    <a href="javascript:void(0)" id="cartModal">
                        <i class="fas fa-shopping-cart" id="cartIcon"></i></a>
                </li>

            </ul>
        </div>


        <!--????????????????????????-->
        <div class="nav1"></div>
        <ul class="nav2">
            <li><a href="<%=request.getContextPath()%>/front_end/workphoto/browseHome.html">????????????<br>Photography
				</a></li>
            <li><a href="<%=request.getContextPath()%>/front_end/locationprogram/LocIndex.html">????????????<br>Location
				</a></li>
            <li>
                <a href="<%=request.getContextPath()%>/front_end/workphoto/browseHome.html" class="logo"><img src="images/MHlogo_01.svg"></a>
            </li>
            <li><a href="<%=request.getContextPath()%>/front_end/product/ProductMain.html">????????????<br>Product
				</a></li>
            <li><a href="<%=request.getContextPath()%>/front_end/post/forumindex.html">????????????<br>Post
				</a></li>
        </ul>
    </header>
	<div class="wrap">
        <div class="side-bar">
            <img class="imgdata" src="" alt="">
            <div class="user-name s-user-name"></div>
            <div class="user-hr"><i class="fas fa-heart"></i></div>
            <ul class="menu">
                <li><a href="../member/LocSellerProfile.html?action=profile" id="profile"><i class="fas fa-user"></i>????????????</a></li>
                <li><a href="../member/LocSellerProfile.html?action=setting" id="setting"><i class="fas fa-file-invoice"></i>????????????</a></li>
                <li><a href="../member/LocSellerProfile.html?action=sellerProfile"><i class="fas fa-shopping-cart"></i>????????????</a></li>
                <li><a href="../locationprogram/Locmanagement.html"><i class="fas fa-church"></i>????????????</a></li>
                <li><a href="javascript:void(0)" id="locRManage"><i class="fas fa-home"></i>????????????</a></li>
                <ul class="menu-locR">
                    <li><a href="../locationorder/locationOrderGetAll.html"><i class="fas fa-user"></i>????????????</a>
                    </li>
                    <li><a href="../../locationroom/locationRoomServlet?action=locationRoomGetAll"><i
                                class="fas fa-file-invoice"></i>????????????</a></li>

                    <li><a href="../locationroom/locationRoomGetOnee2.jsp"><i
                            class="fas fa-church"></i>????????????</a></li>
                    <li><a href="../../locationroom/locationRoomServlet?action=locationRoomDelete"><i
                            class="fas fa-camera-retro"></i>????????????</a></li>
                </ul>
                <li><a href="javascript:void(0)" id="locPManage"><i class="fas fa-indent"></i>????????????</a></li>
                <ul class="menu-locP">
                    <li><a href="../locationprogram/listLocpBySmemId.html"><i class="fas fa-tasks"></i>????????????</a></li>
                    <li><a href="../locationprogram/addLocpimage.html"><i class="fas fa-folder-plus"></i></i>????????????</a></li>
                    <li><a href="../locationprogram/updateLocpimage.html"><i class="fas fa-pencil-alt"></i>????????????</a></li>
                    <li><a href="../locationprogram/delLocp.html"><i class="fas fa-trash-alt"></i>????????????</a></li>
                </ul>
                <li><a href="../locationprogram/loccalendar.html"><i class="far fa-calendar-alt"></i>????????????</a></li>
            </ul>
        </div>

		<div class="content">
			<form action="" enctype="multipart/form-data" method="POST"
				id="imgform">
				<div class="imgblock">
					<div class="form-horizontal">
						<div class="form-group">
							<label for="file1">????????????:</label> <input type="file" id="file1"
								name="file1" accept="image/*"> <input type="hidden"
								id="uplocpid" name="locp_id">
						</div>
						<br> <img id="demoimg" width="450" />
					</div>
				</div>

				<div class="mb-3">
					<label for="LOCR_SMEM_ID" class="form-label">????????????</label> <input
						type="text/UTF-8" class="form-control" id="LOCR_SMEM_ID"
						name="LOCR_SMEM_ID" value="" disabled>
				</div>
				<div class="mb-3">
					<label for="LOCR_NAME" class="form-label">????????????</label> <input
						type="text" class="form-control" id="LOCR_NAME" name="LOCR_NAME"
						value="<%=(LocrVO == null) ? "2??????????????????" : LocrVO.getLOCR_NAME()%>">
				</div>
				<div class="mb-3">
					<label for="LOCR_MAX_TABLE" class="form-label">???????????????</label> <input
						type="text" class="form-control" id="LOCR_MAX_TABLE"
						name="LOCR_MAX_TABLE"
						value="<%=(LocrVO == null) ? "50" : LocrVO.getLOCR_MAX_TABLE()%>">
				</div>
				<div class="mb-3">
					<label for="LOCR_MIN_TABLE" class="form-label">???????????????</label> <input
						type="text" class="form-control" id="LOCR_MIN_TABLE"
						name="LOCR_MIN_TABLE"
						value="<%=(LocrVO == null) ? "10" : LocrVO.getLOCR_MIN_TABLE()%>">
				</div>
				<div class="mb-3">
					<label for="LOCR_MAIN_TABLE" class="form-label">????????????</label> <input
						type="text" class="form-control" id="LOCR_MAIN_TABLE"
						name="LOCR_MAIN_TABLE"
						value="<%=(LocrVO == null) ? "12" : LocrVO.getLOCR_MAIN_TABLE()%>">
				</div>
				<div class="mb-3">
					<label for="LOCR_GUEST_TABLE" class="form-label">????????????</label> <input
						type="text" class="form-control" id="LOCR_GUEST_TABLE"
						name="LOCR_GUEST_TABLE"
						value="<%=(LocrVO == null) ? "10" : LocrVO.getLOCR_GUEST_TABLE()%>">
				</div>
				<div class="mb-3">
					<label for="LOCR_FLOOR" class="form-label">????????????</label> <input
						type="text" class="form-control" id="LOCR_FLOOR" name="LOCR_FLOOR"
						value="<%=(LocrVO == null) ? "1" : LocrVO.getLOCR_FLOOR()%>">
				</div>
				<div class="mb-3">
					<label for="LOCR_STATUS" class="form-label">????????????</label>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="LOCR_STATUS"
							id="LOCR_STATUS1" value="1"
							<c:if test="${locrVO.LOCR_STATUS==1}">checked</c:if>> <label
							class="form-check-label" for="LOCR_STATUS1">??????</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="LOCR_STATUS"
							id="LOCR_STATUS0" value="0"
							<c:if test="${locrVO.LOCR_STATUS==0}">checked</c:if> checked>
						<label class="form-check-label" for="LOCR_STATUS0">??????</label>
					</div>
				</div>
				<div class="mb-3">
					<label for="LOCR_CONTENT" class="form-label">????????????</label>
					<textarea class="form-control" id="LOCR_CONTENT"
						name="LOCR_CONTENT" rows="3">????????????</textarea>
				</div>
				<input type="submit" value="????????????" id="button">
			</form>
			<div id="errorMsg"></div>
		</div>
	</div>
    <!--??????-->
    <div class="footer">
        <div class="foote-top">
            <ul class="foote-content">
                <div>????????????</div>
                <li><a href="<%=request.getContextPath()%>/front_end/workphoto/browseHome.html">?????????</a></li>
            </ul>
            <ul class="foote-content">
                <div>????????????</div>
                <li><a href="<%=request.getContextPath()%>/front_end/locationprogram/LocIndex.html">????????????</a></li>
            </ul>
            <ul class="foote-content">
                <div>????????????</div>
                <li><a href="<%=request.getContextPath()%>/front_end/product/ProductSubGoods.html">????????????</a></li>
                <li><a href="<%=request.getContextPath()%>/front_end/product/ProductSubShoes.html">??????</a></li>
                <li><a href="<%=request.getContextPath()%>/front_end/product/ProductSubRing.html">??????</a></li>
            </ul>
            <ul class="foote-content">
                <div>????????????</div>
                <li><a href="<%=request.getContextPath()%>/front_end/post/forumindex.html">????????????</a></li>
            </ul>
        </div>
        <div class="foote-between">
            <img src="<%=request.getContextPath()%>/front_end/index/images/MHlogo_01.svg" alt="">
            <p class="f-logo">2021 MarryHappiness ????????????</p>
        </div>
    </div>
	<script>
		//????????????
		$.ajax({
			type : "post",
			url : "../../locationroom/locrServletxx",
			data : {
				"action" : "getname"
			},
			dataType:"json",
			success : function(result) {
				console.log(result);

				$("#LOCR_SMEM_ID").val(result.Mem_shop_name);

			}

		})
		//????????????
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
				url : "../../locationroom/locrServletAdd2",
				type : 'POST',
				data : new FormData(this),
				dataType : "JSON",
				processData : false,
				contentType : false,
				success : function(data) {
					// 					console.log(data);

					alert("????????????");

				},

				error : function(data) {
					$("#errorMsg").html("");
					console.log(data.responseText);
					// let errorMsg = data.responseText.split(",");
					let errorMsg = JSON.parse(data.responseText);
					for (let i = 0; i < errorMsg.length; i++) {
						$("#errorMsg").append(errorMsg[i] + "<br>");
						// 						console.log(errorMsg[i]);

					}
					alert("????????????");
				}
			});
			//??????form?????????????????????
			e.preventDefault();
		});


        //profile??????????????????????????????
        Ajaxprofile();
        //??????????????????????????????
        Ajaxheadshot();
        function Ajaxprofile() {
            $.ajax({
                type: "get",
                url: "../../member/buyProfileServlet",
                dataType: 'json',
                success: function(result) {
                    if (result == "0") {
                        window.location.href = "../../front_end/index/index.jsp";
                    } else {
                        resultData = result;
                        $('.user-name').html(result.name != null ? result.name : "????????????");
                        $('#phone').html(result.phone != null ? result.phone : "????????????");
                        $('#city').html(result.city != null ? result.city : "????????????");
                        $('#cityarea').html(result.cityarea != null ? result.cityarea : "????????????");
                        $('#street').html(result.street != null ? result.street : "????????????");
                    }
                }
            });
        };

        function Ajaxheadshot() {
            $.ajax({
                type: "post",
                url: "../../member/headshotBuyServlet",
                data: {
                    "headshot": "headshot"
                },
                xhrFields: {
                    // ??????????????????Blob????????????????????????????????????
                    //jquery???dataType???????????????????????????blob??????????????????
                    responseType: "blob"
                },
                success: function(result) {
                    let img = document.getElementsByClassName('imgdata');
                    if (result.size != "0") {
                        let url = URL.createObjectURL(result);
                        for (let i = 0; i < img.length; i++) {
                            img[i].src = url;
                        }
                    } else {
                        for (let i = 0; i < img.length; i++) {
                            img[i].src = "images/music_castanet_girl.png";
                        }
                    }
                }
            });
        }

        $('#locRManage').on('click', function() {
            $('.menu-locR').slideToggle();
        });
        $('#locPManage').on('click', function() {
            $('.menu-locP').slideToggle();
        });
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/front_end/locationroom/js/friendchat.js"></script>
</body>
</html>