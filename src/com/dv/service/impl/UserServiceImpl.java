package com.dv.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.dv.dao.UserDAO;
import com.dv.entity.User;
import com.dv.service.UserService;

@Transactional
public class UserServiceImpl implements UserService{
	UserDAO userDAO;

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public List<User> allowLogin(String username, String password) {
		// TODO Auto-generated method stub
		List<User> list=userDAO.searchUser(username,password);
		return list;
	}


	public String addUser(String username, String password, String userphone, String usercompany, String userrole,
			String usersex) {
		// TODO Auto-generated method stub
		String result = userDAO.addUser(username, password, userphone, usercompany, userrole, usersex);
		System.out.println("Service"+result);
		return result;
	}


	public String updateUser(String username, String password, String userphone, String usercompany, String userrole,
			String usersex) {
		// TODO Auto-generated method stub
		String result = userDAO.updateUser(username, password, userphone, usercompany, userrole, usersex);
		return result;
	}
	
	
}
