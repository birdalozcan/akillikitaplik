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
            // islem=1 : soru ekle
            // islem=2 : soru güncelle
            // islem=3 : soru sil                    
            
        String islem = request.getParameter("islem");
        boolean hata=false;
        if (islem==null)
            response.sendRedirect("sss_yonetici_liste.jsp");
        String soru="" ,cevap="";
        String soru_id=request.getParameter("soru_id");
        if (soru_id != null){
            sss sr = new sss();
            ResultSet list = sr.sssList(soru_id);
            if(sr.isHata()) {
                hata=true;
                out.println("<pre>"+sr.getHataAciklama()+"</pre>");            
            } else {
                soru = list.getString("soru");
                cevap = list.getString("cevap");
            }            
        }
        if(!hata){
        %>
        <form id="yetkiliIslem" action="sss_yonetici_sonuc.jsp" method="get" style="padding: 25px;"
            <%if (islem.equals("3")) {%> class="form-horizontal alert alert-danger" role="alert" role="form"
            <%}else{%> class="form-horizontal alert alert-info " <%}%> >
            
            <input type="hidden" name="soru_id" value="<%=soru_id%>" />
            <input type="hidden" name="islem" value="<%=islem%>" />            
            
            <div class="form-group">
                <label class="col-sm-2 control-label">Soru</label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="3" id="soru" name="soru" required="required" maxlength="500"
                              <%if (islem.equals("3")){%> readonly <%}%> ><%=soru%></textarea>                    
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Cevap</label>
                <div class="col-sm-10">              
                    <textarea class="form-control" rows="3" id="cevap" name="cevap" required="required" maxlength="500"
                              <%if (islem.equals("3")){%> readonly <%}%> ><%=cevap%></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <%if(islem.equals("1")){%><p><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span><strong> Dikkat : </strong>Bütün alanlara bilgi girişi zorunludur</p><%}%>                    
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" <%if (islem.equals("3")) {%>class="btn btn-danger col-xs-3"<%}else{%>class="btn btn-primary col-xs-3 active"<%}%>  
                            style="margin-left: 20px;">
                        <% if (islem.equals("1")) {%><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Ekle 
                        <% } else if (islem.equals("2")) {%><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Güncelle
                        <% }else{%><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Sil<%}%>                         
                    </button>                    
                </div>
            </div>                        
        </form>
        <%    
        }
        %>                    
    </div>
</body>
</html>

