package jsp;

import java.sql.Connection;
import java.sql.DriverManager;

public class baglanti {
	public static Connection connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/kitaplik_proje", "root", "asdf");
			return connection;
		} catch (Exception ex) {
			System.out.println("HATA :"+ex.getMessage());			
			return null;
		}
	}

	public static boolean close(Connection c) {
		try {
			c.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
