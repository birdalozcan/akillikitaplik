<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jsp.sss"%>
<!DOCTYPE html>
<html>
    <head>
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
        <h2>Sıkça Sorulan Sorular</h2> 
        <%
        String islem=request.getParameter("islem");
        if(islem==null) islem="";
        session.setAttribute("islem", "iptal");
        sss soru = new sss();
        soru.sssInsertUpdate( islem
                            , request.getParameter("soru_id")
                            , request.getParameter("soru")
                            , request.getParameter("cevap"));
        if(soru.isHata()){
        %>
        <div class="alert alert-danger" role="alert">            
            <p><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Sistemde Bekelenmeyen Bir Hata Oluştu :  <%=soru.getHataAciklama() %></p>
            <p>İşlemi tekrar denemek için <a href="sss_yonetici_liste.jsp" class="alert-link">Buraya Tıklayınız.</a></p>
        </div>        
        <%    
        } else {
        %>
        <div class="alert alert-info" role="alert">
            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
            İşleminiz başarıyla gerçekleştirildi. Sıkça Sorulan Sorular listesine dönmek için <a href="sss_yonetici_liste.jsp" class="alert-link">Buraya Tıklayınız.</a>
        </div>        
        <%    
        }                
        %>



    
    </div>
</body>
</html>
    