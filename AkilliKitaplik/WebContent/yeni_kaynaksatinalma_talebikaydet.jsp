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
	x = request.getParameter("bilgi");
	if (x != null && x.equals("guncelle")) {
		String kitapadi = request.getParameter("kitapadi");
		String yazaradi = request.getParameter("yazaradi");
		Connection con = baglanti.connect();
		Statement st = con.createStatement();
		String sql = "INSERT INTO tbl_kaynak_talep(uye_id, kitap_adi, kitap_yazar_adi, talep_durum_id) VALUES('"+ user.getUye_id() + "', '"+ kitapadi+ "', '"+ yazaradi + "', '" + 1 + "') ";
		st.executeUpdate(sql);
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
<body>
	<div class="alert alert-info" role="alert">Talep oluşturuldu</div>
</body>
</html>