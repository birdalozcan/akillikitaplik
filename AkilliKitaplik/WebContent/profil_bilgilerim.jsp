<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="bean.user"></jsp:useBean>
<%@page import="jsp.*,java.sql.*"%>

<%
	if (user.getEposta().equals("")) {
		response.sendRedirect("yonetim.jsp");
	}
%>

<%
	String x = null;
	String uye_id = request.getParameter("uye_id");
	x = request.getParameter("bilgi");
	if (x != null && x.equals("guncelle")) {
		String sifre = request.getParameter("uye_sifre");
		Connection con = baglanti.connect();
		Statement st = con.createStatement();
		String sql = "update tbl_uyeler set uye_sifre='" + sifre
				+ "' where uye_id='" + uye_id + "'";
		st.executeUpdate(sql);
		out.print("Güncellendi");
		baglanti.close(con);
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
@import "dist/css/bootstrap.minn.css";
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
<body style="background-color: rgba(255, 255, 255, 0.61);"><!-- style="background-color: rgba(255, 255, 255, 0.61);" -->
	<form
		action="profil_bilgilerim.jsp?bilgi=guncelle&uye_id=<%=user.getUye_id()%>"
		method="POST">
		<div class="container">

			<h2>Profil Bilgilerim</h2>
			<br>
			<table class="table table-hover">
				<tbody>
					<tr>
						<td>Üye Adı :</td>
						<td><%=user.getUye_adi()%></td>
					</tr>
					<tr>
						<td>Üye Soyadı :</td>
						<td><%=user.getUye_soyadi()%></td>
					</tr>
					<tr>
						<td>Üye E-Posta:</td>
						<td><%=user.getEposta()%></td>
					</tr>
					<tr>
						<td>Üye Şifresi :</td>
						<td><input type="password" name="uye_sifre"
							class="form-control" value="<%=user.getSifre()%>"></input></td>
					</tr>
					<tr>
						<td></td>
						<td><button type="submit" class="btn btn-success">Güncelle</button></td>
					</tr>

				</tbody>
			</table>
		</div>
	</form>
</body>
</html>
