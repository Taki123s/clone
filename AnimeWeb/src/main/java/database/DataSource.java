package database;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;





public class DataSource {
	private static final String DB_URL = "jdbc:sqlserver://LAPTOP-M7JPL6R9:1433;databaseName=projectWeb";
	private static final String USER = "sa";
	private static final String PASS = "12";
	private static HikariConfig config = new HikariConfig();
	private static final String CLASS_NAME="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static HikariDataSource ds;
	
	static {
		
		config.setJdbcUrl(DB_URL);
		config.setUsername(USER);
		config.setPassword(PASS);
		config.setDriverClassName(CLASS_NAME);
		config.setMaximumPoolSize(3);
		config.setMinimumIdle(1);;
		config.addDataSourceProperty("cachePrepStmts", "true");
		config.addDataSourceProperty("prepStmtCacheSize", "250");
		config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
		ds = new HikariDataSource(config);
		
		
	}
	
	private DataSource() {
	}
	public static void closeConnection() {
		ds.close();
	}
	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}

	

}