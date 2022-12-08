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
<style>
#container {
	height: 400px;
}

.highcharts-figure, .highcharts-data-table table {
	min-width: 310px;
	max-width: 500px;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #ebebeb;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}

.highcharts-background {
	fill: #0b0c2a;
}
</style>
</head>
<body>
	<c:url var="adm" value="Admin"></c:url>
	<c:import url="header.jsp"></c:import>


	<div class="container">
		<div class="row">

			<div class="col-lg-12">

				<c:forEach var="mv" items="${listMovie.getTop5Movie()}">
					<div class="valueChar" style="display: none;">
						<input type="text" value="${mv.nameMovie}" class="namemv" /> <input
							type="number" value="${mv.getPerCent(listMovie.getTotalView())}"
							class="percentmv" />
					</div>
				</c:forEach>
				<figure class="highcharts-figure">
					<div id="container"></div>

				</figure>

			</div>
			<div class="col-lg-12">
			<p>Thêm phim mới</p>
			<form	action="${adm}?type=addMovie"
					method="post" enctype='multipart/form-data' id="postBlog">
					<div class="postUpload">
						Tên phim<input type="text" value="" name="nameMv" />
						<div>
							Ảnh đại diện: <label class="renderAvatar" for="avt"
								id="renderAvatar">Ảnh
							</label> <br> Thể loại: <input type="text"
								value="" name="genre" /> <br> Tổng
							số tập: <input type="number"
								value="" name="totalEpi" /><br>
							Mô tả:
							<textarea id="w3review" name="des" rows="5" cols="50"></textarea>
						</div>
						<input type="file" name="avt" id="avt" accept="png,jpg"
							onchange="demoImage()" hidden />
					</div>

					<button type="submit" name="" value="">Sửa</button>
				</form>
			</div>
			<div class="col-lg-12" style="overflow: scroll;">
				<p>Danh sách phim</p>
				<c:forEach var="movie" items="${listMovie.listMovie}">
					<div>
						<form action="${adm}?type=settingMovie&&idMovie=${movie.idMovie}"
							method="post">
							<img alt=""
								src="../anime-main/storage/avatarMovie/${movie.avatar}?${now}"
								id="avtUser">
							<p>Tên: ${movie.nameMovie}</p>
							<button type="submit" name="update" value="update">Sửa</button>
							<button type="submit" name="delete" value="delete">Xóa</button>
							<button type="submit" name="settingChapter"
								value="settingChapter">Tập phim</button>
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
	<script>
		var mvvalue = document.getElementsByClassName("percentmv");
		var mvname = document.getElementsByClassName("namemv");

		var values = [];
		for (let i = 0; i < mvvalue.length; i++) {
			values.push([ mvname[i].value, parseInt(mvvalue[i].value) ])
		}

		Highcharts.chart('container', {
			chart : {
				type : 'pie',
				options3d : {
					enabled : true,
					alpha : 45
				}
			},
			colors : [ "#b30000", "#7c1158", "#4421af", "#1a53ff", "#0d88e6",
					"#00b7c7", "#5ad45a", "#8be04e", "#ebdc78" ],
			title : {
				text : 'Top 5 phim view cao nhất'
			},
			subtitle : {
				text : ''
			},
			plotOptions : {
				pie : {
					innerSize : 100,
					depth : 45
				}
			},
			series : [ {
				name : '%',
				data : values
			} ]
		});
		$(".highcharts-credits").html("");
	</script>
</body>
</html>