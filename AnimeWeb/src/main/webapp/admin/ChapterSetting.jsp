<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../anime-main/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="../anime-main/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="../anime-main/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="../anime-main/css/plyr.css" type="text/css">
<link rel="stylesheet" href="../anime-main/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="../anime-main/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="../anime-main/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="../anime-main/css/ds/style.css" />
<script src="https://kit.fontawesome.com/9847adceef.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
</head>
<body>
	<c:url var="ChapterAdmin" value="ChapterAdmin"></c:url>
	<c:import url="header.jsp"></c:import>
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<p>${movieBeUpdate.nameMovie}</p>
				<img src="../anime-main/storage/avatarMovie/${movieBeUpdate.avatar}"
					id="avtrd">
			</div>
			<div class="col-lg-6" style="overflow: scroll;">
				<p>Danh sách tập phim</p>
				<c:forEach var="chapter" items="${movieBeUpdate.listchapter}">
					<div>
						<form
							action="${ChapterAdmin}?type=setting&&idMovie=${chapter.idMovie}&&index=${chapter.index}"
							method="post">
							Tập:${chapter.index}
							<button type="submit" name="update" value="update">Sửa</button>
							<button type="submit" name="delete" value="delete">Xóa</button>



						</form>
					</div>

				</c:forEach>
				<form
					action="${ChapterAdmin}?type=add&&idMovie=${movieBeUpdate.idMovie}&&index=${movieBeUpdate.listchapter.size()+1}"
					method="post" enctype='multipart/form-data'>
					Thêm tập tiếp theo: ${movieBeUpdate.listchapter.size()+1} <br>
					File MP4: <input type="file" accept="video/mp4" name="video"><br>
					Thời điểm kết thúc opening: <input type="number" name="opening"><br>
					<button type="submit" name="" value="">Thêm</button>
				



				</form>
			</div>

		</div>
	</div>
	<script src="../anime-main/js/jquery-3.3.1.min.js"></script>
	<script src="../anime-main/js/bootstrap.min.js"></script>
	<script src="../anime-main/js/player.js"></script>
	<script src="../anime-main/js/jquery.nice-select.min.js"></script>
	<script src="../anime-main/js/mixitup.min.js"></script>
	<script src="../anime-main/js/jquery.slicknav.js"></script>
	<script src="../anime-main/js/owl.carousel.min.js"></script>
	<script src="../anime-main/js/main.js"></script>
</body>
</html>