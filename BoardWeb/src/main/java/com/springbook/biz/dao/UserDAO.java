package com.springbook.biz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.springbook.biz.common.JDBCUtil;
import com.springbook.biz.vo.UserVO;

public class UserDAO {

	private Connection conn = null;
	private PreparedStatement  stmt = null;
	private ResultSet rs = null;
	
	private final String USER_GET = "select * from users where id=? and passwd=?";
	
	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		
		try {
			
			System.out.println("===> JDBC로 getUser() 기능 처리");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPasswd());
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("id"));
				user.setPasswd(rs.getString("passwd"));
				user.setName(rs.getString("name"));
				user.setRole(rs.getString("role"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		
		return user;
	}
}
