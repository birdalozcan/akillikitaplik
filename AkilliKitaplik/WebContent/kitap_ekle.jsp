<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="bean.user"></jsp:useBean>
<%@page import="jsp.*,java.sql.*"%>
<%@page import="bean.Yazar"%>
<%@page import="java.util.ArrayList"%>

<%
	if (user.getEposta().equals("")) {
		response.sendRedirect("yonetim.jsp");
	}

	Connection con = baglanti.connect();
	Statement statement = con.createStatement();

	ArrayList<Yazar> yazar_array = new ArrayList<Yazar>();
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
<script type="text/javascript" src="dist/js/jquery.js"></script>
<script type="text/javascript" src="dist/js/bootstrap-typeahead.js"></script>
<script type="text/javascript">
	function myFunction() {
		var kitapadi = document.getElementById("k_adi").value;
		var kitapraf = document.getElementById("k_raf").value;
		if (kitapadi == "" || kitapadi == null) {
			alert("Kitap Adı alanı boş olamaz");
		} else if (kitapraf == "" || kitapraf == null) {
			alert("Kitap Rafı alanı boş olamaz");
		} else {
			var textareavalue = document.getElementById("textarea").value;
			var yazarekle = document.getElementById("yazar").value;
			var lines = $('textarea').val().split('\n');
			var state = 0;
			for ( var i = 0; i < lines.length; i++) {
				if (lines[i] == yazarekle) {
					state = 1;
				}
			}
			if (state == 0) {
				textareavalue = textareavalue + yazarekle + "\n";
			} else {
				alert("Eklemek istediğiniz yazar mevcut." + "\n\n"
						+ "Başka bir Yazar giriniz");
				state == 0;
			}
			document.getElementById("textarea").innerHTML = textareavalue;
			$('button').prop('disabled', false);
		}
	}
</script>
<script type="text/javascript">
	function yukle() {
		$('button').prop('disabled', true);
		var kitapadi = document.getElementById("k_adi").value;
		var kitapraf = document.getElementById("k_raf").value;
		if (kitapadi == "" || kitapadi == null || kitapraf == "" || kitapraf == null) {
			$('button').prop('disabled', true);
		} else {
			$('button').prop('disabled', false);
		}
	}
</script>
</head>
<body onload="yukle()" onchange="yukle()">
	<!-- style="background-color: rgba(255, 255, 255, 0.61);"-->

	<form action="kitap_ekle_detay.jsp" method="post">
		<div class="container">

			<h2>Kitap Ekle</h2>
			<br>
			<table class="table table-hover" style="width: 600px;">
				<tbody>
					<tr>
						<td>
							<!-- <div class="col-xs-3" style="padding-left: 0px;"> --> <input
							type="text" name="k_adi" id="k_adi" style="width: 569px;"
							class="form-control" placeholder="Kitap Adı" />
						</td>
					</tr>
					<!-- </div> -->
					<!-- <div class="col-xs-3" > -->
					<tr>
						<td><input type="text" name="k_raf" id="k_raf"
							class="form-control" style="width: 569px;"
							placeholder="Kitap Rafı" /> <!-- </div> --></td>
					</tr>
					<tr>
						<td style="width: 723px; height: 111px">
							<div class="col-xs-3"
								style="padding-left: 0px; width: 421px; height: 115px; width: 685px">
								<input type="text" id="yazar" class="form-control"
									style="margin: 0 auto; vertical-align: middle; float: left; width: 159px;"
									data-provide="typeahead" data-items="4"
									data-source='[<%String sqlkitap = "SELECT yazar_adi, yazar_soyadi FROM tbl_yazar";
			ResultSet rss = statement.executeQuery(sqlkitap);
			while (rss.next()) {
				String yazaradi = rss.getString("yazar_adi");
				String yazarsoyadi = rss.getString("yazar_soyadi");
				Yazar yazar_bean = new Yazar();
				yazar_bean.setYazaradi(yazaradi);
				yazar_bean.setYazarsoyadi(yazarsoyadi);
				yazar_array.add(yazar_bean);
			}
			for (int i = 0; i < yazar_array.size(); i++) {
				out.print('"' + yazar_array.get(i).getYazaradi() + " "
						+ yazar_array.get(i).getYazarsoyadi() + '"');
				if (!(i == yazar_array.size() - 1)) {
					out.print(",");
				}
			}%>]'
									placeholder="Yazar Adı Girin" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" onclick="myFunction()"
									style="margin-left: 20px; float: left; position: relative; vertical-align: middle;"
									class="btn btn-success" value="Yazar Ekle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<textarea class="form-control" rows="2" id="textarea"
									name="yazarlar"
									style="margin-left: 20px; width: 276px; float: left; position: relative; vertical-align: middle; display: inline-block; height: 106px;"></textarea>
							</div>
						</td>
					</tr>
					<tr>

					</tr>
					<tr>

					</tr>
					<tr>
						<td>
							<button type="submit" id="button" class="btn btn-success"
								style="width: 146px; margin-left:235px; height: 44px;">Kitap Ekle</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

	</form>
</body>
</html>
