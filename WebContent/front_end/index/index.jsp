<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="org.springframework.dao.DataAccessException"%>
<%@ page import="org.springframework.jdbc.core.BeanPropertyRowMapper"%>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.product_images.model.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.workphoto.model.*"%>
<%@ page import="com.weddingphoto.model.*"%>
<%@ page import="com.locationroom.model.*"%>
<%@ page import="com.locationimages.model.*"%>
<%@ page import="com.post.model.*"%>
<%@ page import="com.category.model.*"%>
<%@ page import="com.message.model.*"%>


<%
DataSource ds = null;
try {
	Context ctx = new InitialContext();
	ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA101G3");
} catch (NamingException e) {
	e.printStackTrace();
}
JdbcTemplate template = new JdbcTemplate(ds);
String prdSql = "select * from product order by pro_id desc limit 0,6";//獲取最新商品
String worSql = "select * from work_photo order by wor_id desc limit 0,6";//獲取最新婚紗作品
String locSql = "select * from location_room order by locr_id desc limit 0,6";//獲取最新婚禮場地
String postSql = "select * from post order by post_id desc limit 0,6";//獲取最新文章
String mesSql = "select * from message";//取得所有留言

List<ProVO> proList = template.query(prdSql, new BeanPropertyRowMapper(ProVO.class));
List<WorVO> worList = template.query(worSql, new BeanPropertyRowMapper(WorVO.class));
List<LocrVO> locrList = template.query(locSql, new BeanPropertyRowMapper(LocrVO.class));
List<PostVO> postList = template.query(postSql, new BeanPropertyRowMapper(PostVO.class));


pageContext.setAttribute("proList", proList);//將商品list存入scope
pageContext.setAttribute("worList", worList);//將婚紗作品list存入scope
pageContext.setAttribute("locrList", locrList);//將場地廳房list存入scope
pageContext.setAttribute("postList",postList);//將文章list存入scope


//將商品各取一張照片存入list
ProImgService proImgSvc = new ProImgService();
List<ProImgVO> proImgList = new ArrayList<ProImgVO>();
for (ProVO proVO : proList) {
	ProImgVO proImgVO = proImgSvc.findByForeignKey(proVO.getPro_id()).get(0);
	proImgList.add(proImgVO);
}
pageContext.setAttribute("proImgList", proImgList);//將商品照片存入scope

//將婚紗作品集各取一張照片存入list
WedService wedSvc = new WedService();
List<WedVO> wedImgList = new ArrayList<WedVO>();
for (WorVO worVO : worList) {
	WedVO wedVO = wedSvc.findByForeignKey(worVO.getWor_id()).get(0);
	wedImgList.add(wedVO);
}
pageContext.setAttribute("wedImgList", wedImgList);//將婚紗照片存入scope

//將場地廳房各取一張照片存入list
LociService lociSvc = new LociService();
List<LociVO> lociImgList = new ArrayList<LociVO>();
for (LocrVO locrVO : locrList) {
	LociVO lociVO = lociSvc.findByForeignKey(locrVO.getLOCR_ID()).get(0);
	lociImgList.add(lociVO);
}
pageContext.setAttribute("lociImgList", lociImgList);//將廳房照片存入scope

//取得文章分類list
CategoryService catSvc = new CategoryService();
List<CategoryVO> catList = catSvc.getAll();
pageContext.setAttribute("catList",catList);

//計算文章留言數
MessageService mesSvc = new MessageService();
HashMap<Integer,Integer> mesCountMap = new HashMap<Integer,Integer>();
for(PostVO postVO : postList){
	Integer count = mesSvc.getBy_mes_post_id(postVO.getPost_id()).size();
	Integer post_id = postVO.getPost_id();
	mesCountMap.put(post_id,count);
}
pageContext.setAttribute("mesCountMap",mesCountMap);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="images/logo-icon01.ico" type="image/x-icon" />
<!-- boostrap -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- JQ -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- SWEET -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- SWiper -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<!-- CSS -->
<link rel="stylesheet" href="css/all.css">
<link rel="stylesheet" href="css/cssreset.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/cart.css">
<link rel="stylesheet" href="css/index.css">
<title>嫁給幸福｜MarryHappiness</title>
</head>
<style>
.swiper-container {
	width: 100%;
	height: 100%;
	padding: 20px;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.swiper-container img {
	width: 1050px;
	border-radius: 10px;
	margin-bottom: 5px;
	margin-top: 5px;
	box-shadow: 0 10px 15px -3px rgb(115 82 78/ 20%), 0 4px 6px -2px
		rgb(115 82 78/ 10%);
}

.swiper-pagination-bullet-active {
	background: #fc9086;
}
</style>

<body>
	<header>
		<div class="top">
			<ul>
				<!-- 購物車圖片Icon -->
				<li><a href="#">首頁</a></li>
				<li><a href="/CFA101G3/front_end/member/login.html"><i
						class="fas fa-sign-out-alt"></i>登入</a></li>
				<li><a href="/CFA101G3/front_end/member/memberBuyProfile.html"><i
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
			<li><a href="#">婚禮場地<br>Location
			</a></li>
			<li><a href="#" class="logo"><img src="images/MHlogo_01.svg"></a></li>
			<li><a href="ProductMain.html">婚禮週邊<br>Product
			</a></li>
			<li><a href="#">專欄討論<br>Post
			</a></li>
		</ul>
	</header>

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


	<!-- Swiper -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="images/sw1.jpeg" alt="">
			</div>
			<div class="swiper-slide">
				<img src="images/sw2.jpeg" alt="">
			</div>
			<div class="swiper-slide">
				<img src="images/sw3.jpeg" alt="">
			</div>
			<div class="swiper-slide">
				<img src="images/sw4.jpeg" alt="">
			</div>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
	</div>

	<!-- 主頁面 -->
	<div class="container">
		<div class="row">
			<div class="col-6">
				<div class="post">
					<div class="post-heading">
						<div>
							<h2>專欄討論區</h2>
							<p>新娘聊心事的好地方</p>
						</div>
						<a href="">
							<div class="post-more">看更多討論</div>
						</a>
					</div>
					<div class="post-content">
						<c:forEach var="postVO" items="${postList}">
							<div class="post-box d-flex">
								<img src="<%=request.getContextPath()%>/member/memImgServlet?action=headShot&mem_id=${postVO.post_mem_id}" alt=""> 
								<a href="">
									<div class="post-article">
										<div class="post-tag-box">
											<div class="post-tag c${postVO.post_cat_id}">
												<c:forEach var="catVO" items="${catList}">
													<c:if test="${catVO.cat_id==postVO.post_cat_id}">${catVO.cat_name}</c:if>
												</c:forEach>
											</div>
										</div>
										<div class="post-chat">
											<p>${postVO.post_title}</p>
											<div class="post-article-reply">
												<i class="far fa-comment-dots"></i> <span>${mesCountMap[postVO.post_id]}個回覆</span>
											</div>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="product">
					<div class="product-heading">
						<div>
							<h2>婚禮週邊</h2>
							<p>新娘最愛的婚禮小物</p>
						</div>
						<a href="">
							<div class="product-more">看更多小物</div>
						</a>
					</div>
					<div class="product-content">
						<div class="row">
							<c:forEach var="proVO" items="${proList}" begin="0" end="1">
								<div class="pro-box col">
									<a href=""> <c:forEach var="proImgVO" items="${proImgList}">
											<c:if test="${proImgVO.proi_pro_id==proVO.pro_id}">
												<img
													src="<%=request.getContextPath()%>/product/ProImgOutServlet?proi_id=${proImgVO.proi_id}">
											</c:if>
										</c:forEach>
										<h3>${proVO.pro_name}</h3>
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="row">
							<c:forEach var="proVO" items="${proList}" begin="2" end="3">
								<div class="pro-box col">
									<a href=""> <c:forEach var="proImgVO" items="${proImgList}">
											<c:if test="${proImgVO.proi_pro_id==proVO.pro_id}">
												<img
													src="<%=request.getContextPath()%>/product/ProImgOutServlet?proi_id=${proImgVO.proi_id}">
											</c:if>
										</c:forEach>
										<h3>${proVO.pro_name}</h3>
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="row">
							<c:forEach var="proVO" items="${proList}" begin="4" end="5">
								<div class="pro-box col">
									<a href=""> <c:forEach var="proImgVO" items="${proImgList}">
											<c:if test="${proImgVO.proi_pro_id==proVO.pro_id}">
												<img
													src="<%=request.getContextPath()%>/product/ProImgOutServlet?proi_id=${proImgVO.proi_id}">
											</c:if>
										</c:forEach>
										<h3>${proVO.pro_name}</h3>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="wedding">
			<div class="wedding-heading">
				<div>
					<h2>拍婚紗</h2>
					<p>新娘最喜歡的婚紗照</p>
				</div>
				<a href="">
					<div class="wedding-more">看更多作品</div>
				</a>
			</div>
			<div class="wedding-content">
				<div class="row">
					<c:forEach var="worVO" items="${worList}" begin="0" end="2">
						<div class="wed-box col">
							<a href=""> <c:forEach var="wedVO" items="${wedImgList}">
									<c:if test="${wedVO.wed_wor_id == worVO.wor_id}">
										<img
											src="<%=request.getContextPath()%>/weddingphoto/wedPhotoServlet?wed_id=${wedVO.wed_id}">
									</c:if>
								</c:forEach>
								<h3>${worVO.wor_name}</h3>
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="row">
					<c:forEach var="worVO" items="${worList}" begin="3" end="5">
						<div class="wed-box col">
							<a href=""> <c:forEach var="wedVO" items="${wedImgList}">
									<c:if test="${wedVO.wed_wor_id==worVO.wor_id }">
										<img
											src="<%=request.getContextPath()%>/weddingphoto/wedPhotoServlet?wed_id=${wedVO.wed_id}">
									</c:if>
								</c:forEach>
								<h3>${worVO.wor_name}</h3>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="location">
			<div class="location-heading">
				<div>
					<h2>婚禮場地</h2>
					<p>新娘最想在這辦婚禮</p>
				</div>
				<a href="">
					<div class="location-more">看更多場地</div>
				</a>
			</div>
			<div class="location-content">
				<div class="row">
					<c:forEach var="locrVO" items="${locrList}" begin="0" end="2">
						<div class="loc-box col">
							<a href="">
								<c:forEach var="lociVO" items="${lociImgList}">
									<c:if test="${lociVO.LOCI_LOCR_ID==locrVO.LOCR_ID}">
										<img src="<%=request.getContextPath()%>/locationimages/imgLociServlet?LOCI_ID=${lociVO.LOCI_ID}">
									</c:if>
								</c:forEach>
								<h3>${locrVO.LOCR_NAME }</h3>
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="row">
					<c:forEach var="locrVO" items="${locrList}" begin="3" end="5">
						<div class="loc-box col">
							<a href=""> 
								<c:forEach var="lociVO" items="${lociImgList}">
									<c:if test="${lociVO.LOCI_LOCR_ID==locrVO.LOCR_ID}">
										<img src="<%=request.getContextPath()%>/locationimages/imgLociServlet?LOCI_ID=${lociVO.LOCI_ID}">
									</c:if>
								</c:forEach>
								<h3>${locrVO.LOCR_NAME}</h3>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="js/cart.js"></script>
	<!-- Initialize Swiper -->
	<script>
		let swiper = new Swiper('.swiper-container', {
			spaceBetween : 30,
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
		autoplay: {
		     delay: 5000
		 }
		});
	</script>
</body>

</html>