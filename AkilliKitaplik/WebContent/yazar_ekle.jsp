<%@page import="bean.Yazar"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="bean.user"></jsp:useBean>
<%@page import="jsp.*,java.sql.*"%>

<%
	if (user.getEposta().equals("")) {
		response.sendRedirect("yonetim.jsp");
	}

	Connection con = baglanti.connect();
	
	String author_name = request.getParameter("y_adi");
	String author_surname = request.getParameter("y_soyadi");
	try {
		if (!(author_name == null || author_name == ""
				|| author_surname == null || author_surname == "")) {
			String sql = "SELECT yazar_adi, yazar_soyadi FROM tbl_yazar";
			Statement statementquery = con.createStatement();
			ResultSet rs = statementquery.executeQuery(sql);
			while (rs.next()) {
				String yazaradi = rs.getString("yazar_adi");
				String yazarsoyadi = rs.getString("yazar_soyadi");
				if(!(author_name.toLowerCase().equals(yazaradi) && author_surname.toLowerCase().equals(author_surname))){
					System.out.println(yazaradi + " " + yazarsoyadi);
					String intosql = "INSERT INTO tbl_yazar(yazar_adi, yazar_soyadi) VALUES ('"
								+ author_name
								+ "','"
								+ author_surname
								+ "')";
						statementquery.executeUpdate(intosql);
				}
			}
		}
	} catch (SQLException ex) {
		System.out.println(ex.getMessage().toString());
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
	<!-- style="background-color: rgba(255, 255, 255, 0.61);"-->
	<div class="container">

		<h2>Yazar Ekle</h2>
		<br>
		<form action="yazar_ekle.jsp" method="get">
			<div>
				<input type="text" name="y_adi" class="form-control"
					placeholder="Yazar Adı" /><br> <input type="text" name="y_soyadi"
					class="form-control" placeholder="Yazar Soyadı" /><br>
				<button type="submit" class="btn btn-success" style="width: 101px; height: 39px; margin-left: 310px;">Ekle</button>
			</div>
		</form>
		<br> <br>
		<table class="table table-bordered" data-height="299">
			<thead>
				<tr>
					<th data-field="name" data-formatter="nameFormatter">Yazar Adı</th>
					<th data-field="surname" data-formatter="nameFormatter">Yazar
						Soyadı</th>
				</tr>
				<%
					String sqll = "SELECT yazar_adi, yazar_soyadi FROM tbl_yazar";
					Statement statement = con.createStatement();
					ResultSet rss = statement.executeQuery(sqll);
					while (rss.next()) {
						String yazaradi = rss.getString("yazar_adi");
						String yazarsoyadi = rss.getString("yazar_soyadi");
				%>
				<tr>
					<td name="yadi"><%=yazaradi%></td>
					<td name="ysoyadi"><%=yazarsoyadi%></td>
				</tr>
				<%
					}
					rss.close();
					statement.close();
				%>
			</thead>
		</table>
	</div>
</body>
</html>
