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
        sss sr = new sss();
        ResultSet list = sr.sssList();                    
        if(sr.isHata()) {
            out.println("<pre>"+sr.getHataAciklama()+"</pre>");            
        } else { 
            while(list.next()){
        %>
        <div class="well">
            <p><strong><span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span> Soru : <%=list.getString("soru") %></strong></p>
            <p style="padding-left: 20px;"><strong> Cevap : </strong><%=list.getString("cevap") %></p>
        </div>
                
        <%
            }
        }
        %>

    </div>
</body>
</html>

