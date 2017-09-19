<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="bean.user"></jsp:useBean>
<%
	if (user.getEposta().equals("") || user.getEposta().equals(null)) {
		response.sendRedirect("yonetim.jsp");
	} else {
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Akıllı Kitaplık Yönetim Sistemi Kontrol Paneli</title>
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
</head>
<body>
	<div class="panel panel-primary">
		<div class="panel-heading">Akıllı Kitaplık Yönetim Sistemi</div>
		<div class="panel-body">
			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="profil_bilgilerim.jsp" target="frame">Profil
							Bilgilerim</a></li>
					<li><a href="kitap_ekle.jsp" target="frame">Yeni Kitap Ekle</a></li>
					<li><a href="yazar_ekle.jsp" target="frame">Yazar Ekle</a></li>
					<li><a href="kitap_cikar.jsp" target="frame">Kitap Çıkar</a></li>
					<li><a href="satin_alma_talepleri.jsp" target="frame">Satın Alma Talepleri</a></li>
					<li><a href="sss_yonetici_liste.jsp" target="frame">S.S.S</a></li>
					<li><a href="raporkitaplikgorevlisi.jsp" target="frame">Raporlar</a></li>
					<li><a href="cikis_yap.jsp">Çıkış Yap</a></li>
				</ul>
			</div>
			<div class="container">
				<iframe name="frame" width="890" height="585" frameborder="0"></iframe>
			</div>
		</div>
	</div>
</body>
</html>
<%
	}
%>