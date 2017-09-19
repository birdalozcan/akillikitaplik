<%@ page import="java.io.*"%>
<%@ page import="com.itextpdf.text.*"%>
<%@ page import="com.itextpdf.text.pdf.*"%>
<%@ page import="bean.*"%>
<%@ page import="jsp.*,java.sql.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="bean.user"></jsp:useBean>
<%
	if (user.getEposta().equals("")) {
		response.sendRedirect("yonetim.jsp");
	}
%>
<%
	Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
	Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD);

	Paragraph paragraph = new Paragraph();
	response.setContentType("application/pdf");
	Document document = new Document();
	PdfWriter.getInstance(document, response.getOutputStream());
	document.open();
	document.addTitle("Raporum");
	ZapfDingbatsList zapfDingbatsList = new ZapfDingbatsList(47, 45);
	ZapfDingbatsList zapfDingbatsList1 = new ZapfDingbatsList(47, 45);
	ZapfDingbatsList zapfDingbatsList2 = new ZapfDingbatsList(47, 45);

	document.add(new Paragraph("Yazarlar(Yazar Adı, Yazar Soyadı)",
			catFont));
	document.add(new Paragraph(" "));
	Connection con = baglanti.connect();
	String sqlyazar = "SELECT yazar_adi, yazar_soyadi FROM tbl_yazar";
	Statement statementyazarlar = con.createStatement();
	ResultSet rsyazar = statementyazarlar.executeQuery(sqlyazar);
	while (rsyazar.next()) {
		String yazaradi = rsyazar.getString("yazar_adi");
		String yazarsoyadi = rsyazar.getString("yazar_soyadi");
		zapfDingbatsList
				.add(new ListItem(yazaradi + " " + yazarsoyadi));
	}
	document.add(zapfDingbatsList);

	for (int i = 0; i < 3; i++) {
		document.add(new Paragraph(" "));
	}
	document.add(new Paragraph("Kitaplar(Kitap Adı, Kitap Rafı)",
			catFont));
	document.add(new Paragraph(" "));
	String sqlkitap = "SELECT kitap_adi, kitap_raf FROM tbl_kitap";
	Statement statementkitaplar = con.createStatement();
	ResultSet rskitap = statementyazarlar.executeQuery(sqlkitap);
	while (rskitap.next()) {
		String Kkitapadi = rskitap.getString("kitap_adi");
		String Kkitapraf = rskitap.getString("kitap_raf");
		zapfDingbatsList1
				.add(new ListItem(Kkitapadi + "  " + Kkitapraf));
	}
	document.add(zapfDingbatsList1);

	for (int i = 0; i < 3; i++) {
		document.add(new Paragraph(" "));
	}
	document.add(new Paragraph(
			"Satın Alma Talepleri(Kitap Adı, Yazar Adı, Talep Tarihi)",
			catFont));
	document.add(new Paragraph(" "));
	String sqltalep = "SELECT KT.kitap_adi, KT.kitap_yazar_adi, KT.talep_tarih FROM tbl_kaynak_talep KT INNER JOIN tbl_talep_durum TD ON TD.talep_durum_id = KT.talep_durum_id WHERE TD.talep_durum_id='"
			+ 1 + "' AND uye_id='" + user.getUye_id() + "' ";
	Statement statementtalep = con.createStatement();
	ResultSet rstalep = statementyazarlar.executeQuery(sqltalep);
	while (rstalep.next()) {
		String KTkitapadi = rstalep.getString("KT.kitap_adi");
		String KTkitapyazaradi = rstalep
				.getString("KT.kitap_yazar_adi");
		Date KTtaleptarih = rstalep.getDate("KT.talep_tarih");

		zapfDingbatsList2.add(new ListItem(KTkitapadi + "       "
				+ KTkitapyazaradi + "       " + KTtaleptarih));
	}
	document.add(zapfDingbatsList2);

	document.close();
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
</body>
</html>