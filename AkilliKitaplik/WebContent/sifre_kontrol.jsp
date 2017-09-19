<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jsp.*,java.sql.*"%>
<jsp:useBean id="user" scope="session" class="bean.user"></jsp:useBean>
<%
	String eposta = request.getParameter("eposta");
	String sifre = request.getParameter("sifre");

	if (eposta == "" || sifre == "") {
		response.sendRedirect("yonetim.jsp");
	} else {

		//out.print(eposta+" "+sifre);
		Connection conn = baglanti.connect();
		Statement st = conn.createStatement();
		ResultSet rs = st
				.executeQuery("SELECT * FROM tbl_uyeler where uye_eposta='"
						+ eposta + "' && uye_sifre='" + sifre + "'");
		while (rs.next()) {
			if (eposta.equals(rs.getString("uye_eposta"))
					&& sifre.equals(rs.getString("uye_sifre"))) {
				user.setUye_id(rs.getString("uye_id"));
				user.setUye_adi(rs.getString("uye_adi"));
				user.setUye_soyadi(rs.getString("uye_soyadi"));
				user.setEposta(rs.getString("uye_eposta"));
				user.setSifre(rs.getString("uye_sifre"));

				String uye_tip = rs.getString("uye_tip");
				if (uye_tip.equals("1")) {
					response.sendRedirect("panel.jsp");
				} else if (uye_tip.equals("2")) {
					response.sendRedirect("panel2.jsp");
				} else {
					response.sendRedirect("yonetim.jsp");
				}
			}
		}

	}
%>




