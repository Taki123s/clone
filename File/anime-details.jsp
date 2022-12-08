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
		value="${request.rervletContext.realPath}/anime-main/storage/avatarUser/${sessionScope.user.avatar}" />
	<c:url var="categories" value="/anime-main/categories.jsp" />
	<c:url var="blog-details" value="/anime-main/blog-details.jsp" />
	<c:url var="blog" value="/anime-main/blog.jsp" />
	<c:url var="anime_details" value="anime_details" />
	<c:url var="anime-details" value="/anime-main/anime-deails.jsp" />

	<c:url var="urlAvatarFilm"
		value="${request.rervletContext.realPath}/anime-main/storage/avatarMovie/${viewFilm.avatar}" />
	<c:url var="anime_watching" value="/anime-main/anime-watching.jsp" />
	<c:url var="userComment" value="comment" />
	<c:url var="follow" value="follow" />
	<c:url var="voteMovie" value="rateMovie" />
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
							href="./categories.jsp">Categories</a> <span>Romance</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Anime Section Begin -->
	<section class="anime-details spad">
		<div class="container">
			<div class="anime__details__content">
				<div class="row">
					<div class="col-lg-3">
						<div class="anime__details__pic set-bg"
							data-setbg="${urlAvatarFilm}">
							<div class="comment">
								<i class="fa fa-comments"></i> ${viewFilm.listComment.size()}
							</div>
							<div class="view">
								<i class="fa fa-eye"></i> ${viewFilm.view }
							</div>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="anime__details__text">
							<div class="anime__details__title">
								<h3>${viewFilm.nameMovie}</h3>

							</div>
							<div class="anime__details__rating">
								<div class="rating" style="font-size: 18px; color: #b7b7b7;">
									${viewFilm.getAvgScore()} <i class="fa fa-star"></i>
								</div>
								<span>${viewFilm.voteTotal()} Votes</span>
							</div>
							<p>${viewFilm.description}</p>
							<div class="anime__details__widget">
								<div class="row">
									<div class="col-lg-6 col-md-6">
										<ul>
											<li><span>Type:</span> TV Series</li>

											<li><span>Genre:</span>${viewFilm.genre}</li>
										</ul>
									</div>
									<div class="col-lg-6 col-md-6">
										<ul>
											<li><span>Duration:</span> 24 min/ep</li>
											<li><span>Quality:</span> HD</li>
											<li><span>Views:</span> ${viewFilm.view}</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="anime__details__btn">
								<c:choose>

									<c:when test="${checkFl==false}">

										<a href="${follow}?${viewFilm.idMovie}" class="follow-btn">
											<i class="fa fa-heart-o"></i> Follow
											
										</a>

									</c:when>
									<c:when test="${empty checkFl}">

											<a href="${follow}?${viewFilm.idMovie}" class="follow-btn">
											<i class="fa fa-heart-o"></i> Follow
											
										</a>

									</c:when>
									<c:when test="${checkFl==true}">
										<a href="${follow}?${viewFilm.idMovie}" class="follow-btn">
											<i class="fa fa-heart"></i> Follow
											
										</a>
									</c:when>



								</c:choose>
								<a href="${anime_details}?idf=${viewFilm.idMovie}"
									class="watch-btn"><span>Watch Now</span> <i
									class="fa fa-angle-right"></i></a>
								<button id="rateBtn">Rate</button>
								<div>
									<form action="${voteMovie}?id=${viewFilm.idMovie}" method="post" id="formVote">
										<p class="fa fa-star rateStar"></p>
										<p class="fa fa-star rateStar"></p>
										<p class="fa fa-star rateStar"></p>
										<p class="fa fa-star rateStar"></p>
										<p class="fa fa-star rateStar"></p>
										<p class="fa fa-star rateStar"></p>
										<p class="fa fa-star rateStar"></p>
										<p class="fa fa-star rateStar"></p>
										<p class="fa fa-star rateStar"></p>
										<p class="fa fa-star rateStar"></p>
										<c:choose>
										
											<c:when test="${empty sessionScope.user}">
											<input type="number" id="scoreMovie" value="1" name="scoreMovie" style="display:none;">
											</c:when>
											<c:when test="${not empty sessionScope.user}">
											<input type="number" id="scoreMovie" value="${user.getmyRate(viewFilm.idMovie)}" name="scoreMovie" style="display:none;">
											</c:when>
										</c:choose>
										<input id="vote" type="submit" value="vote">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<div class="anime__details__review">
						<div class="section-title">
							<h5>Reviews</h5>
						</div>



						<c:forEach var="comment" items="${viewFilm.listComment}">
							<div class="anime__review__item">
								<div class="anime__review__item__pic">
									<c:url var="avt"
										value="/anime-main/storage/avatarUser/${comment.account.avatar}" />
									<img src="${avt}" alt="">
								</div>
								<div class="anime__review__item__text">
									<h6>
										${comment.account.userName} - <span>${comment.getDifferentTime(nowTime)}</span>
									</h6>
									<p>${comment.comment}</p>
								</div>
							</div>
						</c:forEach>
					</div>






					<div class="anime__details__form">
						<div class="section-title">
							<h5>Your Comment</h5>
						</div>

						<form action="${userComment}">
							<textarea placeholder="Your Comment" name="message"></textarea>
							<button type="submit" value="${viewFilm.idMovie}" name="saveID">
								<i class="fa fa-location-arrow"></i> Review
							</button>
						</form>
					</div>





				</div>
				<c:import url="/anime-main/topview.jsp" />

			</div>
		</div>
	</section>
	<!-- Anime Section End -->

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
	<script>
		$("#rateBtn").on("click",function(){
			$("#formVote").toggleClass("show");
		})
		var arrbutton = document.getElementsByClassName("rateStar");
		for(let i=0;i<arrbutton.length;i++){
			arrbutton[i].addEventListener("click", function(){
				for(let j=0;j<arrbutton.length;j++){
					arrbutton[j].style.color='white';
				}
				for(let m=0;m<i+1;m++){
					arrbutton[m].style.color='yellow';
				}
				document.getElementById("scoreMovie").value=i+1;
			});
			arrbutton[i].addEventListener("mouseover", function(){
				for(let j=0;j<arrbutton.length;j++){
					arrbutton[j].style.color='white';
				}
				for(let m=0;m<i+1;m++){
					arrbutton[m].style.color='yellow';
				}
			});
			arrbutton[i].addEventListener("mouseleave", function(){
				var value=document.getElementById("scoreMovie").value;
				for(let j=0;j<arrbutton.length;j++){
					arrbutton[j].style.color='white';
				}
				for(let m=0;m<value;m++){
					arrbutton[m].style.color='yellow';
				}
			});
		}
	</script>
	<script>
	var arrbutton = document.getElementsByClassName("rateStar");
	var value=document.getElementById("scoreMovie").value;
	for(var j =0;j<value;j++){
		arrbutton[j].style.color='yellow';
	}
	</script>

</body>

</html>