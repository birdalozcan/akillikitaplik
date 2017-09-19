<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="bean.user"></jsp:useBean>
<%@page import="jsp.*,java.sql.*"%>

<%
	if (user.getEposta().equals("")) {
		response.sendRedirect("yonetim.jsp");
	}
%>

<%
	Connection con = baglanti.connect();
	Statement statement = con.createStatement();
	String sql = "SELECT K.kitap_id, K.kitap_adi FROM tbl_kitap K INNER JOIN tbl_odunc_alinan_kitaplar OAK ON OAK.kitap_id = K.kitap_id WHERE OAK.odunc_aktif="
			+ 1
			+ " AND OAK.uye_id="
			+ user.getUye_id()
			+ " AND K.kitap_aktif=" + 1 + "";
	ResultSet rs = statement.executeQuery(sql);
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

		<h2>Ödünç Alınan Kitaplar</h2>
		<br>
		<table class="table table-hover">
			<tbody>
				<%
					while (rs.next()) {
						String kitapadi = rs.getString("K.kitap_adi");
						String kitapid = rs.getString("K.kitap_id");
				%>

				<tr>
					<td style="width: 293px;">Kitap Adı :</td>
					<td style="width: 338px;"><a
						href="kitap_detay.jsp?kitap_id=<%=kitapid%>" style="color:#2a6496;">
							<%=kitapadi%>
					</a></td>
					<td>
						<%=kitapid%>
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
