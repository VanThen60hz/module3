package repository;

import java.sql.Connection;
import java.sql.DriverManager;

public class Config {
    private static final String URL = "jdbc:mysql://localhost:3306/furamamanagement";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "123456";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
