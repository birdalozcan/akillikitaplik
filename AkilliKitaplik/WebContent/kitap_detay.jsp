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
<body><!-- style="background-color: rgba(255, 255, 255, 0.61);"-->
	<div class="container">

		<h2>Kitap Detayı</h2>
		<br>
		<table class="table table-hover">
			<tbody>
				<%
					String kitap_id = request.getParameter("kitap_id");
					String uye_id = user.getUye_id();
					Connection conn = baglanti.connect();
					Statement st = conn.createStatement();
					ResultSet rs = st
							.executeQuery("select alinan_tarih,iade_tarih from tbl_odunc_alinan_kitaplar where kitap_id='"
									+ kitap_id + "' and uye_id='" + uye_id + "'");
					while (rs.next()) {
						String alinan_tarih = rs.getString("alinan_tarih");
						String iade_tarih = rs.getString("iade_tarih");
				%>
				<tr>
					<td>Alınan Tarih / İade Tarihi</td>
					<td><%=alinan_tarih%></td>
					<td><%=iade_tarih%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
