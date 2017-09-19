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
        %>
        <div class="span10 offset2" style="margin: 25px; ">
            <form action="sss_yonetici_islem.jsp" method="post">                        
                <input type="hidden" name="islem" value="1" />                        
                <button type="submit" class="btn btn-primary col-xs-3"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Yeni Soru Ekle</button>
            </form>
        </div>            
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>...</th>
                    <th>Soru</th>                        
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>                                                
        <%    
            int i=0;
            while(list.next()){
                i++;
                String soru=list.getString("soru");
                String cevap=list.getString("cevap");
                if (soru.length()>50)
                    soru=soru.substring(0, 50)+"...";
                if (cevap.length()>100)
                    cevap=cevap.substring(0, 100)+"...";
                
        %>
                <tr>
                    <td><%=i%></td>
                    <td><strong><%=soru%></strong></td>                    
                    <td>
                        <form action="sss_yonetici_islem.jsp" method="post" style="margin: 0px;">                                        
                            <button class="btn-link" type="submit">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Güncelle
                            </button>
                            <input type="hidden" name="soru_id" value="<%=list.getInt("soru_id")%>" />
                            <input type="hidden" name="islem" value="2"/>
                        </form>                                    
                    </td>                                
                    <td>
                        <form action="sss_yonetici_islem.jsp" method="post" style="margin: 0px;">                                        
                            <button class="btn-link" type="submit">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Sil
                            </button>
                            <input type="hidden" name="soru_id" value="<%=list.getInt("soru_id")%>" />
                            <input type="hidden" name="islem" value="3"/>
                        </form>                                    
                    </td>                                                                    
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3" class="text-muted"><%=cevap%> </td>
                </tr>
        <%
            }
        %>
            </tbody>
        </table>
        
        <%    
        }
        %>

    </div>
</body>
</html>

