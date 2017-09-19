<%@page import="java.util.Date" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="bean.user"></jsp:useBean>
<%@page import="jsp.*,java.sql.*"%>

<%
        if(user.getEposta().equals(""))
        {
            response.sendRedirect("yonetim.jsp");
        }
%>


<% request.setCharacterEncoding("utf-8"); %>

<%
    String xx=null;
    xx=request.getParameter("kitap");
    if(xx!=null && xx.equals("kapat"))
    {
       String kitap_id=request.getParameter("kitap_id");
       Connection con= baglanti.connect();
       Statement st = con.createStatement();
       
       String sql="INSERT INTO tbl_rezerve_edilenler(kitap_id, uye_id, rezerve_aktif) VALUES ('"+Integer.parseInt(kitap_id)+"', '"+user.getUye_id()+"', '"+1+"')";
       st.executeUpdate(sql);
       
       
       baglanti.close(con);
    }
 
%>

<!DOCTYPE html>
<html>
    <head>
<script>
function myFunction() 
{
    alert("Rezerve Edildi");
}
</script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">@import "dist/css/bootstrap-theme.css";</style>
    <style type="text/css">@import "dist/css/bootstrap-theme.min.css";</style>
    <style type="text/css">@import "dist/css/bootstrap.css";</style>
    <style type="text/css">@import "dist/css/bootstrap.min.css";</style>
    <style type="text/css">@import "dist/css/bootstrap-theme.css.map";</style>
    <style type="text/css">@import "dist/css/bootstrap.css.map";</style>
    <style type="text/css">@import "css/stil.css";</style>
    <title>JSP Page</title>
</head>
<body>
<div class="container">
<form action="kitap_tarama.jsp?kitap=cikar&uye_id=<%=user.getUye_id() %>" method="POST">

    
    <h2>Kitap Tarama</h2><br>
    <table class="table table-hover">
        <tbody>
            <tr>
                <td>Kitap Adı : </td>
                <td><input class="form-control" type="text" name="kitap_adi"></input></td>
                <td><button type="submit" class="btn btn-success">Kitabı Tara</button></td>
            </tr>           
        </tbody>
    </table> 
    </form>
  


        <table class="table table-hover">
        <tbody>
            <%
    String x=null;
    String uye_id=request.getParameter("uye_id");
    x=request.getParameter("kitap");
    if(x!=null && x.equals("cikar"))
    {
       String kitap_adi=request.getParameter("kitap_adi");
       Connection con= baglanti.connect();
       Statement st = con.createStatement();
       ResultSet rs = st.executeQuery("select * from tbl_kitap where kitap_adi like '%"+kitap_adi+"%'");
       while(rs.next())
       {
           String kitap_id=rs.getString("kitap_id");
           String kitap_ad=rs.getString("kitap_adi");
           String kitap_stok=rs.getString("kitap_stok");
           String kitap_aktif=rs.getString("kitap_aktif");
%>
            <tr>
                <td>Kitap Adı : </td>
                <td><%=kitap_ad%></td>
        <form action="kitap_tarama.jsp?kitap=kapat&kitap_id=<%=kitap_id%>" method="POST" name="form2"><td align="center"><input type="submit" value="Rezerve Et" class="btn btn-primary" onClick="myFunction();"></input></td></form>
            </tr>
            <%
       }
       baglanti.close(con);
    }
%>
        </tbody>
    </table>
</div>
</body>
</html>

