package cn.ych.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PageUtil {
	
	public static  int getTotal(String entity) {
		
		Connection connection = JDBCUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		int sum = 0 ;
		String sql = "select count(*) from "+entity+";";
		
		try {
			ps = connection.prepareStatement(sql);
			 rs = ps.executeQuery();
			 if(rs.next()) {
				 sum = rs.getInt(1);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(connection, ps, rs);
		}

		return sum;
		
	} 

}
