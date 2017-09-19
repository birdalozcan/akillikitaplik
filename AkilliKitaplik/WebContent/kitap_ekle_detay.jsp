<%@page import="bean.Yazar"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="bean.user"></jsp:useBean>
<%@page import="jsp.*,java.sql.*"%>
<%@page import="java.util.Scanner"%>
<%
	if (user.getEposta().equals("")) {
		response.sendRedirect("yonetim.jsp");
	}
	try {
		ArrayList<Yazar> yazarliste = new ArrayList<Yazar>();
		String yazaradi, yazarsoyadi;
		int kitap_id;
		String kitapadi = request.getParameter("k_adi");
		String kitapraf = request.getParameter("k_raf");
		String textarea = request.getParameter("yazarlar");
		Scanner scanner = new Scanner(textarea);
		while (scanner.hasNextLine()) {
			String line = scanner.nextLine();
			for (int i = 0; i < line.length(); i++) {
				if (line.charAt(i) == ' ') {
					Yazar yazar_bean = new Yazar();
					yazaradi = line.substring(0, i);
					yazarsoyadi = line.substring(i + 1, line.length());
					yazar_bean.setYazaradi(yazaradi);
					yazar_bean.setYazarsoyadi(yazarsoyadi);
					yazarliste.add(yazar_bean);
				}
			}
		}
		String kitapstk;
		Connection con = baglanti.connect();
		Statement statement = con.createStatement();
		ResultSet rs;
		String sqlkitap = "SELECT kitap_stok FROM tbl_kitap WHERE kitap_adi='"
				+ kitapadi + "' ";
		rs = statement.executeQuery(sqlkitap);
		Statement statementkitapstok = con.createStatement();
		if (!(rs.next())) {
			String intokitap = "INSERT INTO tbl_kitap(kitap_adi, kitap_raf, kitap_stok, kitap_aktif) VALUES ('"
					+ kitapadi
					+ "','"
					+ kitapraf
					+ "','"
					+ 1
					+ "','"
					+ 1 + "')";
			statement.executeUpdate(intokitap);
		} else {
			kitapstk = rs.getString("kitap_stok");
			int kitapstok = Integer.parseInt(kitapstk);
			kitapstok = kitapstok + 1;
			String intokitapguncelle = "UPDATE tbl_kitap SET kitap_stok='"
					+ kitapstok
					+ "',kitap_raf='"
					+ kitapraf
					+ "' WHERE kitap_adi='" + kitapadi + "'";
			statementkitapstok.executeUpdate(intokitapguncelle);
		}
		String querykitap = "SELECT kitap_id FROM tbl_kitap WHERE kitap_adi='"
				+ kitapadi + "' ";
		rs = statement.executeQuery(querykitap);
		while (rs.next()) {
			kitap_id = rs.getInt("kitap_id");
			for (int i = 0; i < yazarliste.size(); i++) {
				String queryyazar = "SELECT yazar_id FROM tbl_yazar WHERE yazar_adi='"
						+ yazarliste.get(i).getYazaradi()
						+ "' AND yazar_soyadi='"
						+ yazarliste.get(i).getYazarsoyadi() + "' ";
				Statement statementyazar = con.createStatement();
				ResultSet rss = statementyazar.executeQuery(queryyazar);
				Statement statementkitapyazar = con.createStatement();
				while (rss.next()) {
					String yazar_id = rss.getString("yazar_id");
					String intokitapyazar = "INSERT INTO tbl_yazar_kitap(kitap_id, yazar_id) VALUES ('"
							+ kitap_id + "', '" + yazar_id + "') ";
					statementkitapyazar.executeUpdate(intokitapyazar);
				}
			}
		}
		statement.close();
	} catch (SQLException e) {
		out.println("Hata Olustu :" + e.getMessage());
		System.out.println("Hata Olustu :" + e.getMessage());
	} catch (Exception e) {
		out.println("Hata Olustu :" + e.getMessage());
		System.out.println("Hata Olustu :" + e.getMessage());
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
<script type="text/javascript" src="dist/js/bootstrap.js"></script>
<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>

<title>JSP Page</title>
</head>
<body>
	<div class="alert alert-success" role="alert">
		<strong>Kitap Eklenildi</strong>
	</div>
</body>
</html>