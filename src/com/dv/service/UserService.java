package com.dv.service;

import com.dv.entity.User;

import java.util.List;


public interface UserService {

    List<User> allowLogin(String username, String password);
    String addUser(String username,String password,String userphone,String usercompany,String userrole,String usersex);
    String updateUser(String username,String password,String userphone,String usercompany,String userrole,String usersex);
}
