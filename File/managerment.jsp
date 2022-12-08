<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:url var="admin" value="Admin"></c:url>
	<div class="container">
		<div class="Blog-Area">
			<p>Đăng bài viết</p>
			<form action="${admin}" method="post" enctype='multipart/form-data'
				id="postBlog">
				<div class="postUpload">
					File Word:
					<input value="text" name="title"></input>
					<div>
						<label class="renderAvatar" for="files"> Upload </label>
					</div>
					<input type="text" name="dayDebut" id="dayDebut" />
					<input type="file" name="files" id="files" hidden />
					<input type="file" name="avt" id="avt" />
				</div>

				<button type="submit">Đăng</button>
			</form>
		</div>
	</div>
</body>
</html>