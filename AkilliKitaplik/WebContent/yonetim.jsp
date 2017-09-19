<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="bean.user"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");

	if (!(user.getEposta().equals("") || user.getEposta().equals(null))) {
		response.sendRedirect("panel.jsp");
	} else {
%>
<html>
<head>
<title>Akıllı Kitaplık Yönetim Sistemi</title>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
@import "css/stil.css";
</style>
</head>
<body>
	<form name="form1" method="post" action="sifre_kontrol.jsp">
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<table width="413" border="0" align="center" cellpadding="0"
			cellspacing="0" class="dis_cerceve">
			<tr>
				<td width="407"><table border="0" align="center"
						cellpadding="5" cellspacing="5">
						<tr>
							<td height="60" align="center" class="yazi_tipi_login">Akıllı
								Kitaplık Yönetim Sistemi</td>
						</tr>
						<tr>
							<td align="left"><input name="eposta" type="text"
								class="textbox" id="textfield"
								placeholder=" E-posta Adresinizi Giriniz" /></td>
						</tr>
						<tr>
							<td align="left"><input name="sifre" type="password"
								class="textbox" id="textfield2"
								placeholder=" Parolanızı Giriniz"></td>
						</tr>
						<tr>
							<td align="center"><input name="button" type="submit"
								class="buton" id="button" value="Giriş Yap"></td>
						</tr>
					</table></td>
			</tr>
		</table>
	</form>
</body>
</html>
<%
	}
%>