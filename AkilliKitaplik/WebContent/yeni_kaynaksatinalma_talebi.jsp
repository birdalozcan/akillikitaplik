<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="bean.user"></jsp:useBean>
<%@page import="jsp.*,java.sql.*"%>

<%
	if (user.getEposta().equals("")) {
		response.sendRedirect("yonetim.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
@import "dist/css/bootstrap-theme.css";
</style>
<style type="text/css">
@import "dist/css/bootstrap-theme.min.css";
</style>
<style type="text/css">
@import "dist/css/bootstrap.css";
</style>
<style type="text/css">
@import "dist/css/bootstrap.min.css";
</style>
<style type="text/css">
@import "dist/css/bootstrap-theme.css.map";
</style>
<style type="text/css">
@import "dist/css/bootstrap.css.map";
</style>
<style type="text/css">
@import "css/stil.css";
</style>
<title>JSP Page</title>
</head>
<body style="background-color: rgba(255, 255, 255, 0.61);">
	<!-- style="background-color: rgba(255, 255, 255, 0.61);" -->

	<div class="container">

		<h2>Yeni Kaynak Satın Alma Talebi</h2>
		<br>
		<form action="yeni_kaynaksatinalma_talebikaydet.jsp?bilgi=guncelle"
			method="POST">
			<table class="table table-hover">
				<tbody>
					<tr>
						<td>Kitap Adı :</td>
						<td><input name="kitapadi" type="text" class="form-control" /></td>
					</tr>
					<tr>
						<td>Yazar Adı :</td>
						<td><input name="yazaradi" type="text" class="form-control" /></td>
					</tr>

					<tr>
						<td></td>
						<td><button type="submit" class="btn btn-success">Ekle</button></td>
					</tr>

				</tbody>
			</table>
		</form>
	</div>
	
</body>
</html>
