
package jsp;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class sss {
    private boolean hata;
    private String hataAciklama;
    
    public boolean isHata() {
        return hata;
    }
    public void setHata(boolean hata) {
        this.hata = hata;
    }

    public String getHataAciklama() {
        return hataAciklama;
    }
    public void setHataAciklama(String hataAciklama) {
        this.hataAciklama = hataAciklama;
    }

    public ResultSet sssList (){        
        Statement stmt;
        ResultSet sonuc = null;        
        setHata(false);
        try {
            Connection con=baglanti.connect();            
            stmt=con.createStatement();
            sonuc=stmt.executeQuery("SELECT *"
                                + " FROM tbl_sik_sorulan_sorular"                                
                                + " ORDER BY soru_id;");
            //con.close();
        } catch (Exception e) {
            setHata(true);
            setHataAciklama(e.toString());
        }
        return sonuc;        
    }
    public ResultSet sssList (String s_soru_id){        
        PreparedStatement pstmt;
        ResultSet sonuc = null;        
        setHata(false);
        try {
            int soru_id=Integer.parseInt(s_soru_id);
            Connection con=baglanti.connect();                        
            pstmt=con.prepareStatement("SELECT *"
                                    + " FROM tbl_sik_sorulan_sorular"
                                    + " WHERE soru_id=?;");            
            pstmt.setInt (1,  soru_id);
            sonuc=pstmt.executeQuery();
            if(!sonuc.next())
            {
                setHata(true);
                setHataAciklama("Soruyla İlgili Aktif Bir Kayıt Bulunamadı");
            }
            //con.close();
        } catch (Exception e) {
            setHata(true);
            setHataAciklama(e.toString());
        }
        return sonuc;        
    }    
    public void sssInsertUpdate ( String islem
                                , String s_soru_id
                                , String soru
                                , String cevap )
    {   
        PreparedStatement pstmt;
        int sonuc = 0;        
        setHata(false);
        try {
            Connection con=baglanti.connect();            
            if(islem.equals("1")){
                // islem=1 : Yeni Soru Ekle
                pstmt=con.prepareStatement("INSERT INTO tbl_sik_sorulan_sorular(soru, cevap ) VALUES (?, ?);");
                pstmt.setString (1,  soru);
                pstmt.setString (2,  cevap);
                sonuc=pstmt.executeUpdate();    
                if (sonuc==0) {
                    setHata(true);
                    setHataAciklama("Soru Bilgisi Sisteme Eklenemedi.");
                }
            } else if(islem.equals("2")){
                // islem=2 : Soruyu Güncelle                
                int soru_id=Integer.parseInt(s_soru_id);
                pstmt=con.prepareStatement("UPDATE tbl_sik_sorulan_sorular"
                                            + " SET soru=?, cevap=?"
                                            + " WHERE soru_id=? ;");
                pstmt.setString (1,  soru);
                pstmt.setString (2,  cevap);
                pstmt.setInt    (3,  soru_id);                
                sonuc=pstmt.executeUpdate();    
                if (sonuc==0) {
                    setHata(true);
                    setHataAciklama("Soru Bilgisi Güncellenemedi.");
                }
            } else if(islem.equals("3")){
                // islem=3 : Soruyu Sil
                int soru_id=Integer.parseInt(s_soru_id);
                pstmt=con.prepareStatement("DELETE FROM tbl_sik_sorulan_sorular"                                        
                                        + " WHERE soru_id=? ;");
                pstmt.setInt (1,  soru_id);
                
                sonuc=pstmt.executeUpdate();    
                if (sonuc==0) {
                    setHata(true);
                    setHataAciklama("Soru Bilgisi Sistemden Silinemedi.");
                }
            }
            else {
                //bilinmeyen işlem
                setHata(true);
                setHataAciklama("Bilinmeyen İşlem Kodu.");                
            }               
            con.close();
        } catch (NumberFormatException | SQLException e) {
            setHata(true);
            setHataAciklama(e.toString());
        }
    } 
    
    
    

    
}
