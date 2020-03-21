package com.springbook.biz.impl;

import com.springbook.biz.dao.UserDAO;
import com.springbook.biz.vo.UserVO;

public class UserServiceImpl implements UserService {

	private UserDAO userDAO;
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}
}
