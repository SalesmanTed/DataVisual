package com.dv.dao;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.dv.entity.User;


public class UserDAO extends HibernateDaoSupport {

    @SuppressWarnings("unchecked")
    public List<User> searchUser(String username, String password) {
        // TODO Auto-generated method stub
        String hql = "from User where username='" + username + "' and password='" + password + "'";
        List<User> list = this.getHibernateTemplate().find(hql);
        return list;
    }
    public String addUser(String username,String password,String userphone,String usercompany,String userrole,String usersex){
    	//Timestamp now = new Timestamp(System.currentTimeMillis());
    	User u = new User();
    	String result = "注册成功";
    	System.out.println("用户名"+username);
    	u.setUsername(username);
    	u.setPassword(password);
    	u.setUsercompany(usercompany);
    	u.setUserphone(userphone);
    	u.setUserrole(userrole);
    	u.setUsersex(usersex);
    	String hql = "from User where username = '" + username + "'";
    	@SuppressWarnings("unchecked")
		List<User> list = this.getHibernateTemplate().find(hql);
    	if(list.size()!=0) {
    		return "该用户名已存在";
    	}
    	try{
    		this.getHibernateTemplate().save(u);
    		this.getHibernateTemplate().flush();
    		
    	}catch(Exception e){
    		result = "提交失败，请稍后重新尝试";
    	}
    	finally{
    		//String hql = "from User";
    		//@SuppressWarnings("unchecked")
			//List<User> list = this.getHibernateTemplate().find(hql);
    		//System.out.println(list.size());
    		return result;
    	}
    }
    public String updateUser(String username,String password,String userphone,String usercompany,String userrole,String usersex){
    	String hql = "from User where username = '" + username + "'";
    	String result = "更新成功";
    	@SuppressWarnings("unchecked")
		List<User> list = this.getHibernateTemplate().find(hql);
    	if(list.size()==0) return "该用户不存在";
    	User u = list.get(0);
    	if(password!=null){
    		u.setPassword(password);
    	}
    	if(userphone!=null){
    		u.setUserphone(userphone);
    	}
    	if(usercompany!=null){
    		u.setUsercompany(usercompany);
    	}
    	if(usersex!=null){
    		u.setUsersex(usersex);
    	}
    	try{
    		this.getHibernateTemplate().update(u);
    	}catch(Exception e){
    		result = "提交请求失败，请稍后重新尝试";
    	}
    	finally{
    		return result;
    	}
    }


}
