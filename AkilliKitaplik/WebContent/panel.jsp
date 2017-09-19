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
	<div class="panel panel-primary"><!--  style="height: 632px;" -->
		<div class="panel-heading">Akıllı Kitaplık Yönetim Sistemi</div>
		<div class="panel-body"><!-- style="background-image: url(dist/kitap.jpg); background-size:82%" -->
			<div class="col-md-3">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="profil_bilgilerim.jsp" target="frame">Profil
							Bilgilerim</a></li>
					<li><a href="okunmus_kitaplar.jsp" target="frame">Okunmuş Kitaplar</a></li>
					<li><a href="odunc_alinan_kitaplar.jsp" target="frame">Ödünç
							Alınan Kitaplar</a></li>
					<li><a href="rezerve_edilenler.jsp" target="frame">Rezerve
							Edilenler</a></li>
					<li><a href="kitap_tarama.jsp" target="frame">Kitap Tarama</a></li>
					<li><a href="yeni_kaynaksatinalma_talebi.jsp" target="frame">Yeni Kaynak Satın Alma Talebi</a></li>
					<li><a href="sss_kullanici.jsp" target="frame">S.S.S</a></li>
					<li><a href="#">Raporlar</a></li>
					<li><a href="cikis_yap.jsp">Çıkış Yap</a></li>
				</ul>
			</div>
			<div class="container">
				<iframe name="frame" width="890" height="585" frameborder="0"></iframe><!-- allowtransparency="true" -->
			</div>
		</div>
	</div>
</body>
</html>
<%
	}
%>