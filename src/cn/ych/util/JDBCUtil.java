package cn.ych.util;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JDBCUtil {
	//加载驱动
	public static final String DRIVER_NAME="com.mysql.cj.jdbc.Driver";
	//数据库账号
	public static final String USER_NAME="root";
	//数据库密码
	public static final String PASS_WORD="root";
	//数据库名称
	public static final String DB_NAME="crm1";
	//数据库的URL
	public static final String URL= "jdbc:mysql:///"+DB_NAME+"?serverTimezone=GMT%2B8";
	
	static {
		//如果有某些代码只需要在类加载的时候执行一次，可以放到静态块中
		try {
			Class.forName(DRIVER_NAME);
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	/**
	  * 获取数据库连接
	 * @return Connection
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn=DriverManager.getConnection(URL, USER_NAME, PASS_WORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	  * 数据库通用增,删,改方法
	  *方法参数为：SQL,以及SQL中的占位符参数 
	 *
	 */
	public static void dbDML(String sql,Object...objects) {
		Connection conn = getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			//把参数放到对应的占位符之中,经过这一步所有得参数都在占位符之中sql完整
			for (int i = 0; i < objects.length; i++) {
				ps.setObject(i+1, objects[i]);
			}
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(conn,ps);
		}
	}
	public static <E>List<E> dbDQL(String sql,Class<E> class1,Object...objects){
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<E> list = new ArrayList<>();
		try {
			 ps = conn.prepareStatement(sql);
			 //传入参数，完善sql语句
			for (int i = 0; i < objects.length; i++) {
				ps.setObject(i+1, objects[i]);
			}
			//获得数据库中所有得列名称
			ResultSetMetaData data = ps.getMetaData();
			//声明一个字符串数组，长度为数据库表中列的数量data.getColumnCount()==	names.length
			String [] names = new String [data.getColumnCount()];
			
			for (int i = 0; i <	data.getColumnCount(); i++) {
				//获得每一列的名称，然后把值赋值给字符串数组names，data的下标从1开始
				String name = data.getColumnLabel(i+1);
				names[i]=name;
			}
			rs = ps.executeQuery();
			while(rs.next()) {
				//根据传入的class获取一个实例对象
				E o = class1.newInstance();
				//循环数据库列名称(数据库列名称与model属性名称保持一致)
				for (String string : names) {
					//第一行数据所有值
					Object value = rs.getObject(string);
					Field field = class1.getDeclaredField(string);
					field.setAccessible(true);
					field.set(o, value);
					
				}
				list.add(o);
			}		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	} 
	/**
	  * 关闭数据库连接
	 */
	private static void close(Connection conn) {
		
		try {
			if(conn!=null) {
				conn.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private static void close(PreparedStatement ps) {
		
		try {
			if(ps!=null) {
				ps.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private static void close(ResultSet rs) {
		
		try {
			if(rs!=null) {
				rs.close();
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void close(Connection conn,PreparedStatement ps) {
		
		close(ps);
		close(conn);

	}
	public static void close(Connection conn,PreparedStatement ps,ResultSet rs) {
		close(rs);
		close(ps);
		close(conn);
	}
	
	
	
}

