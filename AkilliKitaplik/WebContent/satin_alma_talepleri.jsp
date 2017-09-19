<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.TalepDurum"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="bean.user"></jsp:useBean>
<%@page import="jsp.*,java.sql.*"%>

<%
	if (user.getEposta().equals("") || user.getEposta().equals(null)) {
		response.sendRedirect("yonetim.jsp");
	} else {
%>
<%		
		Connection con= baglanti.connect();
		ArrayList<TalepDurum> list = new ArrayList<TalepDurum>();
		
		Statement statementtalepdurum = con.createStatement();
		ResultSet resultSettalepdurum = statementtalepdurum.executeQuery("SELECT talep_durum_id, onay_tip, aciklama FROM tbl_talep_durum");
		while(resultSettalepdurum.next()){
			int talepdurumid = resultSettalepdurum.getInt("talep_durum_id");
			int onaytip = resultSettalepdurum.getInt("onay_tip");
			String aciklama = resultSettalepdurum.getString("aciklama");
		   	TalepDurum talepdurum = new TalepDurum();
		   	
		   	talepdurum.setTalep_durum_id(talepdurumid);
		   	talepdurum.setOnay_tip(onaytip);
		   	talepdurum.setAciklama(aciklama);
		   	list.add(talepdurum);
			
		}
		
%>
<%			
			String talepdurum_id = request.getParameter("talepdurum");
			if(talepdurum_id != null) {
				String talep_id = request.getParameter("talepid");
				System.out.println("Talep durum :" + talepdurum_id);
				Statement statementupdate = con.createStatement();
				statementupdate.executeUpdate("UPDATE tbl_kaynak_talep SET talep_durum_id='"+Integer.parseInt(talepdurum_id)+"' WHERE talep_id='"+Integer.parseInt(talep_id)+"' ");
			}
			
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
	<h2>Satın Alma Talepleri</h2><br>
	<table class="table table-hover">
	    <form class="form-control" action="satin_alma_talepleri.jsp" method="post">
	    	<%
	    	
	       Statement statementtalep = con.createStatement();
	       ResultSet rstalep = statementtalep.executeQuery("SELECT * FROM tbl_kaynak_talep WHERE uye_id='"+user.getUye_id()+"' AND talep_durum_id='"+0+"' OR talep_durum_id='"+1+"' ");
	       int talepid;
	       while(rstalep.next()) {
	    	   talepid = rstalep.getInt("talep_id");
	           String kitapadi = rstalep.getString("kitap_adi");
	           String kitapyazaradi = rstalep.getString("kitap_yazar_adi");
	           int talepdurumid = rstalep.getInt("talep_durum_id");
	           Date date = rstalep.getDate("talep_tarih");
	           for(int i = 0; i<list.size(); i++){
	        	   if(talepdurumid == list.get(i).getTalep_durum_id()) { 
	 	%>
	            <tr>
	                <td><%=kitapadi%><input type="hidden" name="talepid" value="<%=talepid%>"/></td>
	                <td><%=kitapyazaradi%></td>
	                
	                <td>
		                <select class="form-control" name="talepdurum">
		                	<option value="<%=list.get(i).getTalep_durum_id()%>"><%=list.get(i).getAciklama() %></option>
			                <% for (int j=0; j<list.size(); j++) {
			                		if(list.get(j).getTalep_durum_id() != talepdurumid) { %>
			                <option value="<%=list.get(j).getTalep_durum_id()%>"><%=list.get(j).getAciklama() %></option>
			                	
			                <% 
			                		}
			                	}
			                %>
		                </select>
	                </td>
	           		<td><%=date %></td>
	           		<td><button class="form-control" name="buton">Güncelle</button></td>
	            </tr>
	            <%
		       		}
	       		}
		    }
	       baglanti.close(con);
		%>
	        </tbody>
	    </form>
	</table>
    
</body>
</html>
<%
	}
%>