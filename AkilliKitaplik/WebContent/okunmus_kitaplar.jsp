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

		<h2>Okunmuş Kitaplar</h2>
		<br>
		<table class="table table-hover">
			<tbody>
				<%
					String uye_id = user.getUye_id();
					Connection conn = baglanti.connect();
					Statement st = conn.createStatement();
					ResultSet rs = st
							.executeQuery("SELECT tbl_kitap.kitap_adi,tbl_kitap.kitap_id from tbl_kitap where kitap_id IN(select tbl_odunc_alinan_kitaplar.kitap_id from tbl_odunc_alinan_kitaplar where uye_id='"
									+ uye_id + "' and odunc_aktif=0)");
					while (rs.next()) {
						String kitap_id = rs.getString("kitap_id");
						String kitap_adi = rs.getString("kitap_adi");
				%>
				<tr>
					<td>Kitap Adı :</td>
					<td><a href="kitap_detay.jsp?kitap_id=<%=kitap_id%>" style="color:#2a6496;">
							<%
								out.print(kitap_adi);
							%>
					</a></td>
					<td>
						<%
							out.print(kitap_id);
						%>
					</td>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>
	</div>
</body>
</html>
