<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Anime | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/plyr.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" type="text/css" href="css/ds/style.css" />
<script src="https://kit.fontawesome.com/9847adceef.js"></script>
</head>

<body>
	<c:url var="index" value="/anime-main/index.jsp" />
	<c:url var="login" value="/anime-main/login.jsp" />
	<c:url var="signup" value="/anime-main/signup.jsp" />
	<c:url var="loginServlet" value="login" />
	<c:url var="urlAvatar"
		value="/anime-main/storage/avatarUser/${sessionScope.user.avatar}" />
	<c:url var="categories" value="/anime-main/categories.jsp" />
	<c:url var="blog-details" value="/anime-main/blog-details.jsp" />
	<c:url var="blog" value="/anime-main/blog.jsp" />
	<c:url var="anime-watching" value="/anime-main/anime-watching.jsp" />
	<c:url var="anime-details" value="/anime-main/anime-details.jsp" />
	<c:url var="anime_details" value="anime_details" />
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<c:import url="/anime-main/header.jsp" />
	<!-- Header End -->

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="${index}"><i class="fa fa-home"></i> Home</a> <a
							href="./categories.jsp">Categories</a> <span>${rqGenre}</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="trending__product">
						<div class="row">
							<div class="col-lg-8 col-md-8 col-sm-8">
								<div class="section-title">
									<h4>${rqGenre}</h4>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="btn__all">
									<a href="" class="primary-btn">View All <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="row">
							<c:forEach var="movie"
								items="${listMovie.getMoviebyGenre(rqGenre)}">
								<div class="col-lg-4 col-md-6 col-sm-6">
									<div class="product__item">
										<c:url var="urlAvatarMovie"
											value="/anime-main/storage/avatarMovie/${movie.avatar}" />
										<div class="product__item__pic set-bg"
											data-setbg="${urlAvatarMovie}">
											<div class="ep">${movie.currentEpisode}/
												${movie.totalEpisodes}</div>
											<div class="comment">
												<i class="fa fa-comments"></i> ${movie.listComment.size()}
											</div>
											<div class="view">
												<i class="fa fa-eye"></i> ${movie.view}
											</div>
										</div>
										<div class="product__item__text">
											<ul>

												<li>${movie.genre}</li>
											</ul>
											<h5>


												<a href="${anime_details}?${movie.idMovie}">${movie.nameMovie}</a>
											</h5>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>




				</div>
				<div class="col-lg-4 col-md-6 col-sm-8">
					<div class="product__sidebar">
						<div class="product__sidebar__view">
							<div class="section-title">
								<h5>Top Views</h5>
							</div>
							<ul class="filter__controls">
								<li class="active" data-filter="*">Day</li>
								<li data-filter=".week">Week</li>
								<li data-filter=".month">Month</li>
								<li data-filter=".years">Years</li>
							</ul>
							<div class="filter__gallery">
								<c:forEach var="mv" items="${topMovie}">
									<div class="product__sidebar__view__item set-bg mix day week month years"
										<c:url var="urlAvatarMovie"
											value="/anime-main/storage/avatarMovie/${mv.avatar}" />
										data-setbg="${urlAvatarMovie}"
										style="background-position: center; background-size: cover;">
										<div class="ep">${mv.currentEpisode}/${mv.totalEpisodes}</div>
										<div class="rate">
											${mv.getAvgScore()} <i class='fa fa-star'
												style='color: #f3da35'></i>
										</div>
										<div class="view"
											style='bottom: 10px; right: 10px; top: unset;'>
											<i class="fa fa-eye"></i>${mv.view}
										</div>

										<h5>
											<a href="${anime_details}?${mv.idMovie}">${mv.nameMovie}</a>
										</h5>
									</div>
								</c:forEach>
								
						<div class="product__sidebar__comment">
							<div class="section-title">
								<h5>New Comment</h5>
							</div>
							<div class="product__sidebar__comment__item">
								<div class="product__sidebar__comment__item__pic">
									<img src="img/sidebar/comment-1.jpg" alt="">
								</div>
								<div class="product__sidebar__comment__item__text">
									<ul>
										<li>Active</li>
										<li>Movie</li>
									</ul>
									<h5>
										<a href="#">The Seven Deadly Sins: Wrath of the Gods</a>
									</h5>
									<span><i class="fa fa-eye"></i> 19.141 Viewes</span>
								</div>
							</div>
							<div class="product__sidebar__comment__item">
								<div class="product__sidebar__comment__item__pic">
									<img src="img/sidebar/comment-2.jpg" alt="">
								</div>
								<div class="product__sidebar__comment__item__text">
									<ul>
										<li>Active</li>
										<li>Movie</li>
									</ul>
									<h5>
										<a href="#">Shirogane Tamashii hen Kouhan sen</a>
									</h5>
									<span><i class="fa fa-eye"></i> 19.141 Viewes</span>
								</div>
							</div>
							<div class="product__sidebar__comment__item">
								<div class="product__sidebar__comment__item__pic">
									<img src="img/sidebar/comment-3.jpg" alt="">
								</div>
								<div class="product__sidebar__comment__item__text">
									<ul>
										<li>Active</li>
										<li>Movie</li>
									</ul>
									<h5>
										<a href="#">Kizumonogatari III: Reiket su-hen</a>
									</h5>
									<span><i class="fa fa-eye"></i> 19.141 Viewes</span>
								</div>
							</div>
							<div class="product__sidebar__comment__item">
								<div class="product__sidebar__comment__item__pic">
									<img src="img/sidebar/comment-4.jpg" alt="">
								</div>
								<div class="product__sidebar__comment__item__text">
									<ul>
										<li>Active</li>
										<li>Movie</li>
									</ul>
									<h5>
										<a href="#">Monogatari Series: Second Season</a>
									</h5>
									<span><i class="fa fa-eye"></i> 19.141 Viewes</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

	<!-- Footer Section Begin -->
	<c:import url="/anime-main/footer.jsp" />
	<!-- Footer Section End -->

	<!-- Search model Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">
				<i class="icon_close"></i>
			</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/player.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>