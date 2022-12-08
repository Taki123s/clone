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
</head>
<body>

	<c:url var="adm" value="Admin"></c:url>
	<c:import url="header.jsp"></c:import>


	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<p>Đăng bài viết</p>
				<form action="${adm}?type=upBlog" method="post"
					enctype='multipart/form-data' id="postBlog">
					<div class="postUpload">
						File Word: <input value="text" name="title"></input>
						<div>
							<label class="renderAvatar" for="avt" id="renderAvatar">
								Upload </label>
						</div>
						<input type="text" name="dayDebut" id="dayDebut" /> <input
							type="file" name="files" id="files" /> <input type="file"
							name="avt" id="avt" accept="png,jpg" onchange="demoImage()"
							hidden />
					</div>

					<button type="submit">Đăng</button>
				</form>
			</div>
			<div class="col-lg-12" style="overflow: scroll;">
				<p>Danh sách bài viết</p>
				<c:forEach var="blog" items="${listBlog.list}">
					<div>
						<form action="${adm}?type=settingBlog&&idBlog=${blog.idBlog}"
							method="post">
							<img alt=""
								src="../anime-main/storage/blogSave/${blog.folder}/${blog.avt}?${now}"
								id="avtUser">
							<p>Tiêu đề: ${blog.title} - Thời gian đăng: ${blog.datePost}</p>
							<button type="submit" name="update" value="update">Sửa</button>
							<button type="submit" name="delete" value="delete">Xóa</button>
						</form>

					</div>

				</c:forEach>
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
	<script type="text/javascript">
		function demoImage() {
			var fileSelected = document.getElementById("avt").files;
			if (fileSelected.length > 0) {
				var fileToLoad = fileSelected[0];
				var fileReader = new FileReader();
				fileReader.onload = function(fileLoaderEvent) {
					var srcData = fileLoaderEvent.target.result;
					var newImage = document.createElement('img');
					newImage.src = srcData;
					document.getElementById("renderAvatar").innerHTML = newImage.outerHTML;
				}
				fileReader.readAsDataURL(fileToLoad);
			}
		}
	</script>
</body>
</html>